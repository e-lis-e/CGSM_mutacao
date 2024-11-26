local composer = require("composer")
local scene = composer.newScene()

-- Função de criação da cena
function scene:create(event)
    local sceneGroup = self.view

    -- Fundo
    local background = display.newImage(sceneGroup, "assets/background.png")
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    background.width = display.contentWidth
    background.height = display.contentHeight

    -- Botão de voltar
    local backButton = display.newImage(sceneGroup, "assets/icon-voltar.png")
    backButton.width = 60
    backButton.height = 60
    backButton.x = backButton.width / 2 + 10
    backButton.y = backButton.height / 2 + 10

    -- Função para passar página
    local function backPage()
        composer.gotoScene("pages.pagefive", { effect = "slideRight", time = 500 })
    end
    backButton:addEventListener("tap", backPage)

    -- Título
    local titulo = display.newImage(sceneGroup, "assets/titulo-mutacoes.png")
    titulo.width = 480
    titulo.height = 210
    titulo.x = display.contentCenterX
    titulo.y = display.contentCenterY - 100

    -- Nome
    local titulo = display.newText({
        parent = sceneGroup,
        text = "Autor: Elise Novaes",
        x = display.contentWidth - 130,
        y = display.contentCenterY + 100,
        width = 250,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 20,
        align = "right"
    })
    titulo:setFillColor(1, 1, 0) -- Cor amarela
    titulo.strokeWidth = 2
    titulo:setStrokeColor(1, 0, 0) -- Sombra vermelha
    titulo:toFront()

    -- Orientador
    local titulo = display.newText({
        parent = sceneGroup,
        text = "Orientador: Prof. Ewerton Mendonça",
        x = display.contentWidth - 130,
        y = display.contentCenterY + 140,
        width = 250,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 20,
        align = "right"
    })
    titulo:setFillColor(1, 1, 0) -- Cor amarela
    titulo.strokeWidth = 2
    titulo:setStrokeColor(1, 0, 0) -- Sombra vermelha
    titulo:toFront()

    -- Disciplina
    local titulo = display.newText({
        parent = sceneGroup,
        text = "Disciplina: Computação Gráfica e Sistemas Multimídia",
        x = display.contentWidth - 130,
        y = display.contentCenterY + 200,
        width = 250,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 20,
        align = "right"
    })
    titulo:setFillColor(1, 1, 0) -- Cor amarela
    titulo.strokeWidth = 2
    titulo:setStrokeColor(1, 0, 0) -- Sombra vermelha
    titulo:toFront()

    -- Ano
    local titulo = display.newText({
        parent = sceneGroup,
        text = "2024.2",
        x = display.contentCenterX,
        y = display.contentHeight - 20,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 20
    })
    titulo:setFillColor(1, 1, 1) -- Cor branca
    titulo.strokeWidth = 2
    titulo:setStrokeColor(1, 0, 0) -- Sombra vermelha
    titulo:toFront()

end

-- Adiciona o listener para o evento "create" da cena
scene:addEventListener("create", scene)

return scene
