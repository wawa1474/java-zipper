import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

void fileCopy(File inputDir_, File outputDir_, boolean move_) throws IOException {
  fileCopy(inputDir_, outputDir_.getAbsolutePath(), move_);
}

void fileCopy(File inputDir_, String sofar_, boolean move_) throws IOException {
  String files[] = inputDir_.list();
  
  for (int i = 0; i < files.length; i++){
    if (files[i].equals(".") || files[i].equals("..")) continue;

    File sub = new File(inputDir_, files[i]);
    String nowfar = (sofar_ == null) ?
      files[i] : (sofar_ + "/" + files[i]);
    
    if (sub.isDirectory()){
      fileCopy(sub, nowfar, move_);
    } else {
      Path oldFile = Paths.get(sub.getAbsolutePath());
      Path newFile = Paths.get(nowfar);
      new File(sofar_).mkdirs();
      
      if(move_){
        Files.move(oldFile, newFile);
      }else{
        Files.copy(oldFile, newFile);
      }
    }
  }
}