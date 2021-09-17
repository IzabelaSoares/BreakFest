<%-- 
    Document   : midias
    Created on : 17 de ago. de 2021, 16:08:52
    Author     : Ricardo.Schvambach
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Título -->
        <title>Break Fest</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <!-- Link do CloudFlare -->
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/1.7.3/tailwind.min.css'>
        <link rel="stylesheet" href="styles/midias.css">
        
        <!-- Imagem do Cuppa -->
        <link rel="shortcut icon" href="imagens/cuppa.ico" type="image/x-icon">
        
    </head>
    <body>
        <section class="container max-w-xl mx-auto flex flex-col py-8">
            <h1 class="text-xl font-black">Informações Adicionais</h1>
            <div class="py-8">
                
                <!-- Form com as informações -->
                <form action="RecebeImagemPerfil" method="post" enctype="multipart/form-data" >
                    <label for="instagram">Link para o Instagram</label>
                    <br>
                    <input type="text" name="instagram" placeholder="Instagram">
                    <br><br>
                    <label for="facebook">Link para o Facebook</label>
                    <br>
                    <input type="text" name="facebook" placeholder="Facebook" height="300px">
                    <br><br>
                    <label>Foto da padaria</label>
                    <br>
                    <div id="center">
                        <div x-data="imageData()" class="file-input flex items-center">

                            <!-- Preview da Imagem -->
                            <div class="h-12 w-12 rounded-full overflow-hidden bg-gray-100">
                                
                                <!-- Placeholder da Imagem -->
                                <div x-show="!previewPhoto" >
                                    <svg class="h-full w-full text-gray-300" fill="currentColor" viewBox="0 0 24 24"><path d="M24 20.993V24H0v-2.996A14.977 14.977 0 0112.004 15c4.904 0 9.26 2.354 11.996 5.993zM16.002 8.999a4 4 0 11-8 0 4 4 0 018 0z" /></svg>
                                </div>
                                
                                <!-- Preview da foto inserida -->
                                <div x-show="previewPhoto" class="h-12 w-12 rounded-full overflow-hidden">
                                    <img :src="previewPhoto" 
                                         alt="" 
                                         class="h-12 w-12 object-cover">
                                </div>
                            </div>
                            <div class="flex items-center">
                                
                                <!-- Input de foto -->
                                <div class="ml-5 rounded-md shadow-sm">
                                    <input @change="updatePreview($refs)" x-ref="input"
                                            type="file" 
                                            accept="image/*,capture=camera" 
                                            name="photo" id="photo" 
                                            class="custom">
                                    <label for="photo" 
                                           class="py-2 px-3 border border-gray-300 rounded-md text-sm leading-4 font-medium text-gray-700 hover:text-indigo-500 hover:border-indigo-300 focus:outline-none focus:border-indigo-300 focus:shadow-outline-indigo active:bg-gray-50 active:text-indigo-800 transition duration-150 ease-in-out">
                                        Adicionar
                                    </label>
                                </div>
                                <div class="flex items-center text-sm text-gray-500 mx-2">
                                    <span x-text="fileName || emptyText"></span>
                                   
                                    <!-- Remove a foto selecionada -->
                                    <button x-show="fileName"
                                            @click="clearPreview($refs)"
                                            type="button"
                                            aria-label="Remove image"
                                            class="mx-1 mt-1">
                                        <svg viewBox="0 0 20 20" fill="currentColor" class="x-circle w-4 h-4"
                                             aria-hidden="true" focusable="false"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"></path></svg>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    
                    <!-- Botão de enviar -->
                    <button type="submit" id="centro">Enviar</button>
                </form>
            </div>
            
            <!-- Script do Cloud Flare -->
            <script src='https://cdnjs.cloudflare.com/ajax/libs/alpinejs/2.6.0/alpine.js'></script>
            <script  src="scripts/midias.js"></script>

    </body>
</html>
