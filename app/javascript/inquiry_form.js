$(function() {
  //テキストボックス
  $('#inquiry_form_texts').on('cocoon:after-insert', function() {
    check_to_hide_or_show_add_link_text();
  });

  $('#inquiry_form_texts').on('cocoon:after-remove', function() {
    check_to_hide_or_show_add_link_text();
  });

  function check_to_hide_or_show_add_link_text() {
    if ($('#inquiry_form_texts .nested-fields').length >= 5) {
      $('#text_button').hide();
    } else {
      $('#text_button').show();
    }
  }

  //ラジオボックス
  $('#inquiry_form_radio_boxes').on('cocoon:after-insert', function() {
    check_to_hide_or_show_add_link_radio();
  });

  $('#inquiry_form_radio_boxes').on('cocoon:after-remove', function() {
    check_to_hide_or_show_add_link_radio();
  });

  function check_to_hide_or_show_add_link_radio() {
    if ($('#inquiry_form_radio_boxes .nested-fields').length >= 5) {
      $('#radio_button').hide();
    } else {
      $('#radio_button').show();
    }
  }

  //セレクトボックス
  $('#inquiry_form_selects').on('cocoon:after-insert', function() {
    check_to_hide_or_show_add_link_select();
  });

  $('#inquiry_form_selects').on('cocoon:after-remove', function() {
    check_to_hide_or_show_add_link_select();
  });

  function check_to_hide_or_show_add_link_select() {
    if ($('#inquiry_form_selects .nested-fields').length >= 5) {
      $('#select_button').hide();
    } else {
      $('#select_button').show();
    }
  }

  //テキストエリアボックス
  $('#inquiry_form_text_areas').on('cocoon:after-insert', function() {
    check_to_hide_or_show_add_link_area();
  });

  $('#inquiry_form_text_areas').on('cocoon:after-remove', function() {
    check_to_hide_or_show_add_link_area();
  });

  function check_to_hide_or_show_add_link_area() {
    if ($('#inquiry_form_text_areas .nested-fields').length >= 5) {
      $('#area_button').hide();
    } else {
      $('#area_button').show();
    }
  }
})