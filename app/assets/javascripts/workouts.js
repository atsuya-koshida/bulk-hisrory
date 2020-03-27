$(function() {
  var count = $('.set-box').length - 1;
  console.log(count);
  // フォームの追加ボタンのコード
  $('.addform-box').click(function() {
    if(count < 4) {
      count += 1;
      console.log(count);
      // クローンを変数に格納
      var clonecode = $('.set-box:last').clone(true)
  
      // 何セット目かを表す数値を足す
      clonecode.find('.no').html(count + 1)
  
      // weightの入力フォームを取得
      cloneweight = clonecode.find('.weight')
  
      // weightの入力フォームのname属性を取得し、[]内の番号を+1する
      cloneweight.attr('name', `workout[workout_details_attributes][${count}][weight]`)
      // weightの入力フォームのid属性を取得し、[]内の番号を+1する
      cloneweight.attr('id', `workout_workout_details_attributes_${count}_weight`)
  
      // repsの入力フォームを取得
      clonereps = clonecode.find('.reps')
  
      // repsの入力フォームのname属性を取得し、[]内の番号を+1する
      clonereps.attr('name', `workout[workout_details_attributes][${count}][reps]`)
      // repsの入力フォームのid属性を取得し、[]内の番号を+1する
      clonereps.attr('id', `workout_workout_details_attributes_${count}_reps`)
      
      //HTMLに追加
      clonecode.insertAfter($('.set-box:last'));
    }
  });

  // 削除ボタンの実装
  $('.deleteform-box').click(function() {
    if(count > 0) {
      count -= 1
      console.log(count);
      var clonecode = $('.set-box:last');
      clonecode.remove();
    }
  });
});