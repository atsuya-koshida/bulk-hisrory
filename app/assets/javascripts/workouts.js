$(function() {
  var count = $('.set-box').length - 1;
  console.log(count);
    // フォームの追加ボタンのコード
    $('.addform-box').click(function() {
      if(count < 4 && count >= 0) {
        count += 1;
        // クローンを変数に格納
        var clonecode = $('.set-box:last').clone(true)
  
        clonecode.attr('data', count);
    
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
      var clonebox = $('.set-box:last');
      var hiddenform = clonebox.find('.hidden-id');
      hiddenform.attr('value', true);
      clonebox.remove();
    }
  });

  // 商品情報編集時(/training_menus/:id/workout_editページへリンクした際のアクション)
  if (window.location.href.match(/\/training_menus\/\d+\/workout_edit/)) {
    console.log(count);
    var set_box = $('.set-box');
    var set_boxno = set_box.find('.no');

    $(set_boxno).each(function(index, no) {
      $(no).html(index + 1);
    });
  }
});