package Varios;

import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Base64;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

/**
 *
 * @author aguare
 */
public class Encriptar {

    public String encriptarPass(String password) {
        String nuevoPass = "";
        String clave = "ipc";
        try {
            MessageDigest tipoEncriptacion = MessageDigest.getInstance("MD5");
            byte[] llaveContra = tipoEncriptacion.digest(clave.getBytes("utf-8"));
            byte[] llaveByte = Arrays.copyOf(llaveContra, 24);
            SecretKey llave = new SecretKeySpec(llaveByte, "DESede");
            Cipher cifrado = Cipher.getInstance("DESede");
            cifrado.init(Cipher.ENCRYPT_MODE, llave);
            byte[] textoPlano = password.getBytes("utf-8");
            byte[] buffer = cifrado.doFinal(textoPlano);
            byte[] base64Bytes = Base64.getEncoder().encode(buffer);
            nuevoPass = new String(base64Bytes);
        } catch (Exception e) {
        }
        return nuevoPass;
    }

    public String desencriptarPass(String password, String clave) {
        String pass = "";
        try {
            byte[] entrada = Base64.getDecoder().decode(password.getBytes("utf-8"));
            MessageDigest tipoEncriptacion = MessageDigest.getInstance("MD5");
            byte[] claveProcesada = tipoEncriptacion.digest(clave.getBytes("utf-8"));
            byte[] llaveByte = Arrays.copyOf(claveProcesada, 24);
            SecretKey llave = new SecretKeySpec(llaveByte, "DESede");
            Cipher descifrar = Cipher.getInstance("DESede");
            descifrar.init(Cipher.DECRYPT_MODE, llave);
            byte[] textoPlano = descifrar.doFinal(entrada);
            pass = new String(textoPlano, "UTF-8");
                    
        } catch (Exception e) {
        }
        return pass;
    }
}
