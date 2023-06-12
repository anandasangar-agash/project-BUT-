let lis=document.querySelectorAll('#onglets-menu>li');
for(let i=0;i<lis.length;i++)
{
  let idx=i;
  lis[i].addEventListener('mousedown',function(){
    console.log('Click');
    document.querySelector('.menu-actif').className='';
    this.className='menu-actif';
    document.querySelector('.contenu-actif').className='';
    contenus[idx].className='contenu-actif';
  });
}