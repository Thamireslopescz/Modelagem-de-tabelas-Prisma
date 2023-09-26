/*
  Warnings:

  - The primary key for the `usuario` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `ativo` on the `usuario` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `usuario` table. All the data in the column will be lost.
  - You are about to drop the column `dtNascimento` on the `usuario` table. All the data in the column will be lost.
  - You are about to drop the column `endereco` on the `usuario` table. All the data in the column will be lost.
  - The `id` column on the `usuario` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Made the column `idade` on table `usuario` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "usuario" DROP CONSTRAINT "usuario_pkey",
DROP COLUMN "ativo",
DROP COLUMN "createdAt",
DROP COLUMN "dtNascimento",
DROP COLUMN "endereco",
ADD COLUMN     "github" TEXT,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ALTER COLUMN "nome" SET DATA TYPE TEXT,
ALTER COLUMN "idade" SET NOT NULL,
ALTER COLUMN "email" SET DATA TYPE TEXT,
ADD CONSTRAINT "usuario_pkey" PRIMARY KEY ("id");

-- CreateTable
CREATE TABLE "produto" (
    "id" SERIAL NOT NULL,
    "descricao" TEXT NOT NULL,
    "valor" DOUBLE PRECISION NOT NULL,
    "quantidade" INTEGER NOT NULL,
    "tipoProduto" TEXT NOT NULL,
    "criacao" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "disponivel" BOOLEAN,

    CONSTRAINT "produto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "loja" (
    "cnpj" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "segmento" TEXT DEFAULT 'alimentação',
    "endereco" TEXT NOT NULL,
    "telefone" TEXT,
    "quantidadeFiliais" INTEGER NOT NULL,
    "abertura" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "loja_pkey" PRIMARY KEY ("cnpj")
);

-- CreateTable
CREATE TABLE "fornecedor" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "avaliacao" DOUBLE PRECISION NOT NULL,
    "criacao" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "atualizacao" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "fornecedor_pkey" PRIMARY KEY ("id")
);
