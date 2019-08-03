console.log("wwwww")
// addScript("https://connect.facebook.net/en_US/sdk.js",function(){
//   // FB.init({
//   //   appId: '396560614313271',
//   //   version: 'v2.7'
//   // });
//
//   // FB.getLoginStatus(function(response){
//   //   console.log(response);
//   //
//   //   fetch("https://api.server.dev/auth/facebook", {mode: 'no-cors'})
//   //   .then(response => response.json())
//   //   .then(json => console.log(json));
//   //   // window.open(`https://api.server.dev/auth/facebook/callback?code=${response.authResponse.accessToken}`);
//   // });
//
//   // FB.login(function(response){
//   //   console.log(response)
//   //   window.open(`https://api.server.dev/auth/facebook/callback?code=${response.authResponse.accessToken}`);
//   // }, {
//   //   auth_type: 'rerequest'
//   // });
//
// });

function addScript( src,callback) {
  var s = document.createElement( 'script' );
  s.setAttribute( 'src', src );
  s.onload=callback;
  document.body.appendChild( s );
}


