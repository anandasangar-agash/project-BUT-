let bouton=document.getElementById('bouton-ajouter');
bouton.addEventListener('click',function(){
  console.log('Click');
  let joueur={
    nom: document.getElementById('ajout-nom').value,
    score: document.getElementById('ajout-score').value
  };
  ajouter_joueur(joueur);
  document.getElementById('ajout-nom').value='';
  document.getElementById('ajout-score').value='';
  document.getElementById('total').textContent=calculer_total();
});

function calculer_total()
{
  let total=0;
  let tds=document.querySelectorAll('.score');
  for(let i=0;i<tds.length;i++){
    let score=parseInt(tds[i].textContent);
    total+=score;
  }
  return total;
}

function ajouter_joueur(joueur)
{
  console.log('ajouter_joueur',joueur);
  let ligne=document.createElement('tr');
  let nom  =document.createElement('td');
  let score=document.createElement('td');
  nom.textContent=joueur.nom;
  score.textContent=joueur.score;
  nom.className='nom';
  score.className='score';
  ligne.append(nom);
  ligne.append(score);
  document.getElementById('joueurs').append(ligne);
}