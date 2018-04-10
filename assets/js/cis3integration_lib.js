(function(window){
  function ciS3Integration(){
    var _ciS3IntegrationObject = {};
    
    var config = {
        // Place any uploads within the descending folders
        // so ['test1', 'test2'] would become /test1/test2/filename
        upload_path:['videos'],
        allowed_types: ['jpeg', 'jpg', 'png', 'gif', 'bmp', 'pdf', 'doc', 'docs', 'zip'],
        max_size:5120,
        make_unique_filename:true,
        s3_key_field:"key",
        progress_loader_div:"progress-bar-area",
        uploaded_files_field_id:"uploaded"
    };
    
    _ciS3IntegrationObject.setConfig = function(localConfig){
        for(var i in localConfig){
            if(i){
              config[i] = localConfig[i];
            }      
        }
        return config;
   };

    _ciS3IntegrationObject.doFileValidation = function(fileField){
        var fileInput = $(fileField);
        var fileSize = $(fileField)[0].files[0].size;
        if ($.inArray($(fileField).val().split('.').pop().toLowerCase(), config.allowed_types) == -1) {
            alert("Please upload file type:" +" "+config.allowed_types.join(', ')+" "+"only");
            fileInput.val(null);
            return false;
        }
        var finalSize = parseFloat(fileSize/1024).toFixed(2);
        if(finalSize >= config.max_size) // in MB
        {
            alert("Please upload file size less than "+parseFloat(config.max_size/1024).toFixed(2)+" MB");
            fileInput.val(null);
            return false;
        }
        return true;
    };
    
    _ciS3IntegrationObject.s3Upload = function(uploadFieldFormClass){
         // Assigned to variable for later use.
        var form = $('.'+uploadFieldFormClass);
        var filesUploaded = [];
        var folders = config.upload_path;
        form.fileupload({
            url: form.attr('action'),
            type: form.attr('method'),
            datatype: 'xml',
            add: function (event, data) {
                // Show warning message if your leaving the page during an upload.
                window.onbeforeunload = function () {
                    return 'You have unsaved changes.';
                };

                // Give the file which is being uploaded it's current content-type (It doesn't retain it otherwise)
                // and give it a unique name (so it won't overwrite anything already on s3).
                var file = data.files[0];
                if(config.make_unique_filename){
                    var filename = Date.now() + '.' + file.name.split('.').pop();
                } else {
                    var filename = file.name;
                }                
                form.find('input[name="'+config.s3_key_field+'"]').val((folders.length ? folders.join('/') + '/' : '') + filename);

                // Actually submit to form to S3.
                data.submit();

                // Show the progress bar
                // Uses the file size as a unique identifier
                var bar = $('<div class="progress" data-mod="'+file.size+'"><div class="bar"></div></div>');
                $('.'+config.progress_loader_div).append(bar);
                bar.slideDown('fast');
            },
            progress: function (e, data) {
                // This is what makes everything really cool, thanks to that callback
                // you can now update the progress bar based on the upload progress.
                var percent = Math.round((data.loaded / data.total) * 100);
                $('.progress[data-mod="'+data.files[0].size+'"] .bar').css('width', percent + '%').html(percent+'%');
            },
            fail: function (e, data) {
                // Remove the 'unsaved changes' message.
                window.onbeforeunload = null;
                $('.progress[data-mod="'+data.files[0].size+'"] .bar').css('width', '100%').addClass('red').html('');
            },
            done: function (event, data) {
                window.onbeforeunload = null;

                // Upload Complete, show information about the upload in a textarea
                // from here you can do what you want as the file is on S3
                // e.g. save reference to your server using another ajax call or log it, etc.
                var original = data.files[0];
                var s3Result = data.result.documentElement.children;                
                filesUploaded.push({
                    "original_name": original.name,
                    "s3_name": s3Result[2].innerHTML,
                    "size": original.size,
                    "url": s3Result[0].innerHTML
                });
                $('#'+config.uploaded_files_field_id).html(JSON.stringify(filesUploaded, null, 2));
                // $('#uploaded_files').submit();
            }
        });
        
        return config.mute;
    };
    return _ciS3IntegrationObject;
  }

  // We need that our library is globally accesible, then we save in the window
  if(typeof(window.ciS3Integration) === 'undefined'){
    window.ciS3Integration = ciS3Integration();
  }
})(window); // We send the window variable withing our function
