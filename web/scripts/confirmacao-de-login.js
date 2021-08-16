import {podeLogar} from '../../src/java/dominio/UsuarioFisico'

        function confirmaLogin() {
            const login = document.querySelector("#login");

            if (podeLogar === true) {
                    login.style.color = 'red';
            }
        }


