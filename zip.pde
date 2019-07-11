void zip(File input_, File outputDirectory_) throws IOException {
  FileOutputStream fos = new FileOutputStream(outputDirectory_);
  ZipOutputStream zos = new ZipOutputStream(fos);
  
  try {
    if(input_.isDirectory()){//input_ is a folder
      zipFolder(input_, null, zos);
    } else {//input is a file
      zipFile(input_, zos);
    }
    zos.flush();
  } finally {
    zos.close();
    fos.close();
  }
}

void zipFolder(File inputDir_, String sofar_, ZipOutputStream zos_) throws IOException {
  String files[] = inputDir_.list();
  
  for (int i = 0; i < files.length; i++){
    if (files[i].equals(".") || //$NON-NLS-1$
        files[i].equals("..")) continue; //$NON-NLS-1$

    File sub = new File(inputDir_, files[i]);
    String nowfar = (sofar_ == null) ?
      files[i] : (sofar_ + "/" + files[i]); //$NON-NLS-1$

    if (sub.isDirectory()){
      //directories are empty entries and have / at the end
      ZipEntry entry = new ZipEntry(nowfar + "/"); //$NON-NLS-1$
      zos_.putNextEntry(entry);
      zos_.closeEntry();
      zipFolder(sub, nowfar, zos_);

    } else {
      ZipEntry entry = new ZipEntry(nowfar);
      entry.setTime(sub.lastModified());
      zos_.putNextEntry(entry);
      zos_.write(loadBytesRaw(sub));
      zos_.closeEntry();
    }
  }
}

void zipFile(File inputFile_, ZipOutputStream zos_) throws IOException {
  ZipEntry entry = new ZipEntry(inputFile_.getName());
  entry.setTime(inputFile_.lastModified());
  zos_.putNextEntry(entry);
  zos_.write(loadBytesRaw(inputFile_));
  zos_.closeEntry();
}

byte[] loadBytesRaw(File file_) throws IOException {
  int size = int(file_.length());
  FileInputStream input = new FileInputStream(file_);
  byte buffer[] = new byte[size];
  int offset = 0;
  int bytesRead;
  while ((bytesRead = input.read(buffer, offset, size-offset)) != -1){
    offset += bytesRead;
    if (bytesRead == 0) break;
  }
  input.close();
  input = null;
  return buffer;
}