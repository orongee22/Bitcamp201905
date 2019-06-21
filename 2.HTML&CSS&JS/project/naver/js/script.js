$(document).ready(function(){

    //            var inputBox = $('.input_box');
    var select = $('select');
    var input = $('input');
    //            var birthList = $('birth_list'); 
    
    
    // p태그 넣을 div
    var signupList = $('.signup_list');


    // focusin되면 bordercolor - green
    function setBorderGreen(e){
        $(e.target).parent().css('border-color','#09a600');
    }

    // focusout되면 bordercolor - gray
    function setBorderDefault(e){
        $(e.target).parent().css('border-color','#bbb');
    }


    // focusin / focusout 이벤트 처리
    input.on('focusin',function(e){
        setBorderGreen(e);
    });
    select.on('focusin',function(e){
        setBorderGreen(e);
    })

    input.on('focusout',function(e){
        setBorderDefault(e);  
        showMsg(e);
    });
    select.on('focusout',function(e){
        setBorderDefault(e); 
        showMsg(e);
    });



    // 필수 사항 메시지 뜨게 하는 함수
    function showMsg(e){
        console.log(e.target);
        if(e.target.value < 1){
            console.log(e.target.closest('.signup_list')); 
            e.target.closest('.signup_list').append($('p'));

        }
    }

});


    //        var inputBox = document.getElementsByClassName('input_box');
    //        var birthList = document.getElementsByClassName('birth_list');
    //        var signupList = document.getElementsByClassName('signup_list');
    //        var input = document.querySelectorAll('input');
    //        var select = document.querySelectorAll('select');
    //        
    //        // focusin 됐을 때 bordercolor - green
    //        function setBorderGreen(t){
    //            t.parentElement.style.borderColor = '#09a600';
    //        }
    //       
    //        // focusout 됐을 때 bordercolor - gray
    //        // this를 매개변수로 전달받아서 사용합니다. t = this
    //        function setBorderDefault(t){
    //            t.parentElement.style.borderColor = '#bbb';
    //        }
    //        
    //        // '필수 사항입니다' 메시지 띄우기
    //        function showMsg(e){
    //            if(e.value < 1){
    //                if(e.classList.contains('required')){
    //                e.parentElement.parentElement.innerHTML += '<p style="color: red; font-size: 12px">필수 사항입니다.</p>';
    //                    console.log('dkkgk');
    //                 
    //                }else if(document.getElementById('signup_year')){
    //                    e.parentElement.parentElement.parentElement.innerHTML += '<p style="color: red; font-size: 12px">태어난 년도를 기입하세요.</p>';
    //                } 
    //            } 
    //        }
    //        
    //        // 정규식 idCheck
    //        function idVal(t){
    ////            var userId = document.getElementById('signup_id');
    //            var userIdChk = /^[a-z0-9]{5,21}$/;
    //            
    //            // 5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.
    //            // 멋진 아이디네요!
    //            
    //            if(!userIdChk.test(t.value)){
    //                t.parentElement.parentElement.innerHTML += '<p style="color:red;font-size:12px;">5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.</p>';
    //            } else{
    //                t.parentElement.parentElement.innerHTML += '<p style="color:green;font-size:12px;">멋진 아이디네요.</p>';
    //            }
    //        }
    //        
    //        for(var i=0;i<input.length;i++){
    //            input[i].addEventListener('focusin', function(e){                       
    //               setBorderGreen(this); 
    //                e.preventDefault();
    //                
    //            });
    //            input[i].addEventListener('focusout', function(e){           setBorderDefault(this);
    //                showMsg(this);
    //                idVal(this);
    //                e.preventDefault();
    //            });
    //        }
    //        
    //        for(var i=0;i<select.length;i++){
    //            select[i].addEventListener('focusin', function(e){
    //                setBorderGreen(this);
    //                e.preventDefault() 
    //            });
    //            select[i].addEventListener('focusout', function(e){                                            
    //                setBorderDefault(this);
    //                e.preventDefault() 
    //            });
    //        }

