/* 
 * Página de Referência: Cadastrar e Consultar Midias (modal de cadastro de midias)
 * Dependencias: --
 * Desenvolvido por: Jefferson Teixeira
 * Documentado por: Izabela Maria Alves Soares
 * Data da ultima Revisão: 13/09/2021 
 */

/*Script para inserir imagem de perfil do Usuário Juridico*/

function imageData(url) {
  //recebe o input da imagem 
  const originalUrl = url || '';
  //retorna os dados da imagem e preview
  return {
    previewPhoto: originalUrl,
    fileName: null,
    emptyText: originalUrl ? 'Nenhum arquivo novo escolhido' : 'Nenhum arquivo escolhido',
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
    //limpa o preview de imagem
    clearPreview($refs) {
      $refs.input.value = null;
      this.previewPhoto = originalUrl;
      this.fileName = false;
    }
  };
}



