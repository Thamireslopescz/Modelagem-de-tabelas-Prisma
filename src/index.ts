import { PrismaClient } from "@prisma/client";

const repository = new PrismaClient();

repository.usuario.findMany().then(result => {
    console.log("Retorno do select");
    console.log(result);
    
});