filterText(String val, int length){
  if(val.length>length){
    return val.substring(0, length)+"...";
  }
  else{
    return val;
  }
}