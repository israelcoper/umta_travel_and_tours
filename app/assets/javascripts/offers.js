$(document).on('turbolinks:load', function(e) {
  forms.validate_offer.init();

  tinyMCE.init({
    selector: "textarea:not(.mceNoEditor)",
    setup: function(editor) {
      editor.on('keyup', function(e) {
        $('#form-offer').bootstrapValidator('revalidateField', 'offer[detail]');
      });
    }
  });
});

