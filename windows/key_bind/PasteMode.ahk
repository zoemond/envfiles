 
IsPasteModeActive(){
  global PasteModeActive
  if (PasteModeActive = "") {
    return false
  }
  global pasteMode
  return pasteMode = PasteModeActive
}
ToPasteModeActive(){
  global PasteModeActive := "Active"
  global pasteMode
  pasteMode := PasteModeActive
  return pasteMode
}

ToPasteModeNormal(){
  global PasteModeNormal := "Normal"
  global pasteMode
  pasteMode := PasteModeNormal
  return pasteMode
}
