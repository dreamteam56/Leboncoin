$(document).ready(function(){
  $('#sent').on("click", function(e){
    e.preventDefault();
    $.getJSON("/mailbox/sent", function(data){
      console.log(data)
      $.each( data, function(key,val){
        $('#contenu').append("<tr><td>" + val.subject + " </td><td> " + val.created_at + "</td><td><button class='btn'>Voir annonce</button><button class='btn'>Voir Message</button></td></tr>")
      })
      
    });
  });
});