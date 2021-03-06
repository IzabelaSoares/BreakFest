function imageData(url) {
  const originalUrl = url || '';
  return {
    previewPhoto: originalUrl,
    fileName: null,
    emptyText: originalUrl ? 'Foto não selecionada' : 'Foto não selecionada',
    updatePreview($refs) {
      var reader,
          files = $refs.input.files;
      reader = new FileReader();
      reader.onload = (e) => {
        this.previewPhoto = e.target.result;
        this.fileName = files[0].name;
      };
      reader.readAsDataURL(files[0]);
    },
    clearPreview($refs) {
      $refs.input.value = null;
      this.previewPhoto = originalUrl;
      this.fileName = false;
    }
  };
}

$(document).ready(function() {
        $('#multiple-checkboxes').multiselect({
          includeSelectAllOption: true
        });
    });