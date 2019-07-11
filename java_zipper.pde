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
    File dir = new File(sketchPath());
    File sketchFolder = new File(dir + "/java_zipper.pde");
    //printArray(sketchFolder.list());
    File dest = new File(dir + "/res.zip");

    //FileOutputStream fos= new FileOutputStream(dest);
    //ZipOutputStream zos= new ZipOutputStream(fos);
    //zipFile(sketchFolder, zos);
    //zos.flush();
    //zos.close();
    
    //zip(dir, dest);//allows zipping a single file or a folder structure
    unzip(dest, new File(dir + "/test/test2"));//unzips a zip file, will make directories if they do not exist
    
    //selectFolder("","");//cant select single file
    //selectInput("","");//cant select folder
    
    //File dir = new File(sketchPath());
    //File sketchFolder = new File(dir + "/test/");
    //String dest=dir + "/res.zip";
    //File dfile= new File(dest);
    //FileOutputStream fos= new FileOutputStream(dfile);
    //ZipOutputStream zos= new ZipOutputStream(fos);
    //zipFolder(dir, dir.getName(), zos);
    //zos.flush();
    //zos.close();
  } catch (Exception e) {
    println("Exception caught in Setup");
    println(e);
  }
  exit();
}

void draw(){
  
}