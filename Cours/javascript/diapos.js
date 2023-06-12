let diaImages=document.getElementById('dia-images');
diaImages.style.left='0px';
let pos=parseInt(diaImages.style.left);

let diaDroite=document.getElementById('dia-droite');
diaDroite.addEventListener('click',function(){
  console.log('Flèche droite'); 
  pos-=600;
  if(pos<-600*3){pos=-600*3;}
  diaImages.style.left=pos+'px'
});

let diaGauche=document.getElementById("dia-gauche");
diaGauche.addEventListener('click', function(){
  console.log('Flèche gauche');
  pos+=600;
  if(pos>0){pos=0;}
  diaImages.style.left=pos+'px';
});