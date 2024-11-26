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

    -- Título
    local titulo = display.newImage(sceneGroup,"assets/titulo-mutacoes.png")
    titulo.width = 480
    titulo.height = 210
    titulo.x = display.contentCenterX
    titulo.y = display.contentCenterY - 100

    -- Nome
    local titulo = display.newText({
        parent = sceneGroup,
        text = "Autor: Elise Novaes",
        x = display.contentWidth - 100,
        y = display.contentCenterY + 100,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 20
    })
    titulo:setFillColor(1, 1, 0) -- Cor amarela
    titulo.strokeWidth = 20
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
    titulo:setFillColor(1, 1, 1) -- Cor amarela
    titulo.strokeWidth = 20
    titulo:setStrokeColor(1, 0, 0) -- Sombra vermelha
    titulo:toFront()

    -- Botão de passar página
    local nextButton = display.newImage(sceneGroup, "assets/icon-proximo.png")
    nextButton.width = 60
    nextButton.height = 60
    nextButton.x = display.contentWidth - nextButton.width / 2 - 10
    nextButton.y = display.contentHeight - nextButton.height / 2 - 10

    -- Função para passar página
    local function nextPage()
        composer.gotoScene("pages.pageone", {effect = "slideLeft", time = 500})
    end
    nextButton:addEventListener("tap", nextPage)
end

-- Adiciona o listener para o evento "create" da cena
scene:addEventListener("create", scene)

return scene
