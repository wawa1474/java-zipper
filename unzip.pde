import java.io.BufferedOutputStream;
import java.util.zip.ZipInputStream;

void unzip(File inputFile_, File outputDirectory_) throws IOException {// Unzip inputFile into outputDirectory
  FileInputStream fis = new FileInputStream(inputFile_);
  ZipInputStream zipInputStream = new ZipInputStream(fis);

  try {
    if(!outputDirectory_.exists()){
      outputDirectory_.mkdirs();
    }
    
    ZipEntry entry = zipInputStream.getNextEntry();
    while (entry != null){
      File file = new File(outputDirectory_, entry.getName());
      if (entry.isDirectory()){
        file.mkdir();
      } else {
        OutputStream outputStream = new BufferedOutputStream(new FileOutputStream(file), BUFFER_SIZE);
        try {
          //outputStream.write(saveBytesRaw(zipInputStream, entry.getSize()));//can't do single files?
          int b = zipInputStream.read();
          while (b != -1) {
            outputStream.write(b);
            b = zipInputStream.read();
          }
          outputStream.flush();
        } finally {
          outputStream.close();
        }
        file.setLastModified(entry.getTime());
      }
      entry = zipInputStream.getNextEntry();
    }
  } finally {
    zipInputStream.close();
  }
}

//byte[] saveBytesRaw(ZipInputStream zis_, long size_) throws IOException {
//  int total = int(size_);
//  byte buffer[] = new byte[total];
//  int offset = 0;
//  int bytesRead;
//  while ((bytesRead = zis_.read(buffer, offset, total-offset)) != -1){
//    offset += bytesRead;
//    if (bytesRead == 0) break;
//  }
//  return buffer;
//}