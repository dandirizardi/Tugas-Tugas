function tambah(){
    var frm = document.getElementById('kalkulator');
    var a1 = parseFloat(frm.angka.value);
    var a2 = parseFloat(frm.angka2.value);
    
    var hasil = a1+a2;
    var notif ="Maaf angka belum terisi";
    
    if (a1 && a2 != ""){
        alert("Hasil : "+hasil);
    }else{
        
        alert("" +notif);
    }
   
    
}

function kurang(){
    var frm = document.getElementById('kalkulator');
    var a1 = parseFloat(frm.angka.value);
    var a2 = parseFloat(frm.angka2.value);

    var hasil = a1-a2;
    var notif ="Maaf angka belum terisi";
    
    if (a1 && a2 != ""){
        alert("Hasil : "+hasil);
    }else{
        
        alert("" +notif);
    }
}

function pembagian(){
    var frm = document.getElementById('kalkulator');
    var a1 = parseFloat(frm.angka.value);
    var a2 = parseFloat(frm.angka2.value);

    var hasil = a1/a2;
    var notif ="Maaf angka belum terisi";
    
    if (a1 && a2 != ""){
        alert("Hasil : "+hasil);
    }else{
        
        alert("" +notif);
    }
}

function perkalian(){
    var frm = document.getElementById('kalkulator');
    var a1 = parseFloat(frm.angka.value);
    var a2 = parseFloat(frm.angka2.value);

    var hasil = a1*a2;
    var notif ="Maaf angka belum terisi";
    
    if (a1 && a2 != ""){
        alert("Hasil : "+hasil);
    }else{
        
        alert("" +notif);
    }
}

function pangkat(){
    var frm = document.getElementById('kalkulator');
    var a1 = parseFloat(frm.angka.value);
    var a2 = parseFloat(frm.angka2.value);

    var hasil = a1 ** a2;
    var notif ="Maaf angka belum terisi";
    
    if (a1 && a2 != ""){
        
        alert("Hasil : "+hasil);
    }else{
        
        alert("" +notif);
    }
}


