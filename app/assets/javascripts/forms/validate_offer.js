var forms = forms || {};

forms.validate_offer = (function() {
  return {
    init: function() {
      var $form = $('#form-offer');

      if ( $form.length ) {
        $form.bootstrapValidator({
          framework: 'bootstrap',
          excluded: [':disabled'],
          fields: {
            'offer[location]': {
              validators: {
                notEmpty: {
                  message: 'The location is required'
                }
              }
            },
            'offer[detail]': {
              validators: {
                callback: {
                  message: 'The offer content must be atleast 10 characters long',
                  callback: function(value,validator,$field) {
                    // Get the plain text without HTML
                    var text = tinyMCE.activeEditor.getContent({ format: 'text' });
                    return text.length >= 10;
                  } 
                }
              }
            },
            'offer[rate]': {
              validators: {
                notEmpty: {
                  message: 'The location is required'
                },
                numeric: {
                  message: 'Please enter a valid integer',
                  decimalSeparator: '.'
                }
              }
            }
          }
        }).on('success.form.bv', function(e) {
        }).on('err.form.bv', function(e) {
        });
      }
    }
  }
}());
