

package mydb;

import java.lang.*;
import java.util.*;

public class deparsestr {
    

    public deparsestr() { }
     
    public int getCount(String str,String sign){ //get the num of sign
      
      if(str==null) return 0;
      StringTokenizer s=new StringTokenizer(str,sign);
      return s.countTokens();
      
  }   
  
	  public String[] getArray(String str,String sign){//get the array
	    int count=getCount(str,sign);
	    int j=0;
	    String[] arr=new String[count];
	    for(int i=0;i<count;i++){
	       if(str.indexOf(sign)!=-1){
	            j     =str.indexOf(sign);
	            arr[i]=str.substring(0,j);
	            str   =str.substring(j+1);
	        }else{
	            arr[i]=str;
	        }
	    }
	    return arr;
	
	}
  
    
}
    