function removeSplashFromWeb() {
  document.getElementById("splash")?.remove();
  document.getElementById("splash-branding")?.remove();
  document.body.style.background = "transparent";
}

/* setTimeout(function(){
  console.log('19 seconds past??');
  removeSplashFromWeb();
},19000); */