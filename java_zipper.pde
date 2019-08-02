//import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
//import java.io.IOException;
import java.util.zip.ZipEntry;
//import java.io.BufferedInputStream;

final int BUFFER_SIZE = 2048;

final boolean _MOVE_ = true;
final boolean _COPY_ = false;

void setup(){
  try {
    File directory = new File(sketchPath());
    File multiFile = new File(directory + "/testing/");
    File singleFile = new File(directory + "/testing/java_zipper.pde");
    File dest = new File(directory + "/res.zip");
    File dest2 = new File(directory + "/res2.zip");
    File testTop = new File(directory + "/test");
    File test = new File(testTop + "/test2");
    File test2 = new File(directory + "/test2/test");
    
    //zip(singleFile, dest2);//allows zipping a single file or a whole directory
    //zip(multiFile, dest);//allows zipping a single file or a whole directory
    //unzip(dest, test);//unzips a zip file, will make directories if they do not exist
    //unzip(dest2, test2);//unzips a zip file, will make directories if they do not exist
    //fileCopy(testTop, test2, _MOVE_);//allows copying/moving a single file or a whole directory
    
    //selectFolder("","");//cant select single file
    //selectInput("","");//cant select folder
  } catch (Exception e) {
    println("Exception caught in Setup");
    println(e);
  }
  exit();
}

void draw(){
  
}