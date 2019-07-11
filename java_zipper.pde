import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import java.io.BufferedOutputStream;
import java.io.BufferedInputStream;
import java.util.zip.ZipInputStream;

final int BUFFER_SIZE = 2048;
void setup(){
  try {
    File directory = new File(sketchPath());
    File singleFile = new File(directory + "/java_zipper.pde");
    File dest = new File(directory + "/res.zip");

    //zip(singleFile, dest);//allows zipping a single file or a whole directory
    //zip(directory, dest);//allows zipping a single file or a whole directory
    unzip(dest, new File(directory + "/test/test2"));//unzips a zip file, will make directories if they do not exist
    
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