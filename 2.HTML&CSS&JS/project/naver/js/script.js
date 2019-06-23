$(document).ready(function(){

    //            var inputBox = $('.input_box');
    
    //            var birthList = $('birth_list'); 
    
    
    // p태그 넣을 div
    var signupList = $('.signup_list');
    var form = $('#register_form');

    
    // focusin / focusout 이벤트 처리
    $('input, select').on('focusin',function(e){
        $(e.target).parent().css('border-color','#09a600');
        
        return false;
    });

    $('input, select').on('focusout',function(e){
        $(e.target).parent().css('border-color','#bbb'); 
//        showMsg(e);
        
        return false;
    });


    
    // 5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.
        var idCheck = /^[a-z0-9-_]{5,20}$/; 
        //8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.
        var pwCheck = /^[A-Za-z0-9가-힣]{8,16}$/;
        // 한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)
        var nameCheck = /^[가-힣A-Z]{0,30}$/;
        
        // 1900~2019 / 4자리 이상
        var yearCheck = /^(19[0-9][0-9]|20[0-1][0-9])$/;

        // 2자리 이상
        var dayCheck = /^(0*[0-9]|[1-2][0-9]|[3][0-1])$/;
        
        // @ / .com / .net / .co.kr
        var emailCheck = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
        
        // 010 시작
        var pNumCheck = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
        
        
        $('#signup_id').on('focusout',function(e){
            
            if($(this).val().length > 0){
                
                if(!idCheck.test($(this).val())){
                $('#id_error_msg').html('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.').css('color','red');
                } else {
                    $('#id_error_msg').html('멋진 아이디네요!').css('color','green');
                }
            } else{
                $('#id_error_msg').html('필수 사항입니다.').css('color','red');
            }
            
            return false;
        });
    
        $('#signup_pw').on('focusout',function(e){
            
            if($(this).val().length > 0){
                
                if(!pwCheck.test($(this).val())){
                    // 사용불가 메시지 띄우기
                    $('#pw_error_msg').html('8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.').css('color','red');
                } else {
                    // 안전 마크 바꾸기.
                }
            } else{
                $('#pw_error_msg').html('필수 사항입니다.').css('color','red');
            }
            
            return false;
        });
    
        $('#signup_repw').on('focusout',function(){
           if($(this).val() != $('#signup_pw').val()){
               $('#repw_error_msg').html('비밀번호가 일치하지 않습니다.').css('color','red');
           } else{
                $('#repw_error_msg').html('필수 사항입니다.').css('color','red');
            }
            return false;
        });
    
        $('#signup_name').on('focusout',function(e){
            
            if($(this).val().length > 0){
                
                if(!nameCheck.test($(this).val())){
                    // 사용불가 메시지 띄우기
                    $('#name_error_msg').html('한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)').css('color','red');
                } else {
                    $('#name_error_msg').html('');
                }
            } else{
                $('#name_error_msg').html('필수 사항입니다.').css('color','red');
            }
            
            return false;
        });
    
        $('#signup_year').on('focusout',function(e){
            
            if($(this).val().length > 0){
                
                if(!yearCheck.test($(this).val())){
                    // 사용불가 메시지 띄우기
                    $('#birth_error_msg').html('태어난 년도 4자리를 정확하게 입력하세요.').css('color','red');
                } else {
                    $('#birth_error_msg').html('');
                }
            } else{
                $('#birth_error_msg').html('필수 사항입니다.').css('color','red');
            }
            
            return false;
        });
    
    $('#signup_day').on('focusout',function(e){
            
            if($(this).val().length > 0){
                
                if(!dayCheck.test($(this).val())){
                    // 사용불가 메시지 띄우기
                    $('#birth_error_msg').html('태어난 일 2자를 정확하게 입력하세요.').css('color','red');
                } else {
                    $('#birth_error_msg').html('');
                }
            } else{
                $('#birth_error_msg').html('필수 사항입니다.').css('color','red');
            }
            
            return false;
    });
    
    $('#signup_email').on('focusout',function(e){
            
            if($(this).val().length > 0){
                
                if(!emailCheck.test($(this).val())){
                    // 사용불가 메시지 띄우기
                    $('#email_error_msg').html('이메일 주소를 다시 확인해주세요.').css('color','red');
                } else {
                    $('#email_error_msg').html('');
                }
            }
            
            return false;
    });
    
    $('#signup_number').on('focusout',function(e){
            
            if($(this).val().length > 0){
                
                if(!pNumCheck.test($(this).val())){
                    // 사용불가 메시지 띄우기
                    $('#num_error_msg').html('이메일 주소를 다시 확인해주세요.').css('color','red');
                } else {
                    $('#num_error_msg').html('');
                }
            } else{
                $('#num_error_msg').html('필수 사항입니다.').css('color','red');
            }
            
            return false;
    });
    
    form.on('submit',function(){

    });
    

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

