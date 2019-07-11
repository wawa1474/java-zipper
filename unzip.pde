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
          //int b = zipInputStream.read();
          //println(entry.getSize());
          //while (b != -1){
          //  outputStream.write(b);
          //  b = zipInputStream.read();
          //}
          
          //int size = int(entry.getSize());
          //byte buffer[] = new byte[size];
          //zipInputStream.read(buffer, 0 , size);
          //outputStream.write(buffer);
          
          outputStream.write(saveBytesRaw(zipInputStream, entry.getSize()));
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

byte[] saveBytesRaw(ZipInputStream zis_, long size_) throws IOException {
  int total = int(size_);
  byte buffer[] = new byte[total];
  int offset = 0;
  int bytesRead;
  while ((bytesRead = zis_.read(buffer, offset, total-offset)) != -1){
    offset += bytesRead;
    if (bytesRead == 0) break;
  }
  return buffer;
}

byte[] saveBytesRawTest(ZipInputStream zis_, long size_) throws IOException {
  int total = int(size_);
  byte buffer[] = new byte[total];
  zis_.read(buffer, 0 , total);
  return buffer;
}