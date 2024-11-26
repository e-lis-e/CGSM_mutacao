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

    -- Adicionando o áudio
    local audioFile = audio.loadStream("audios/pagetwo.mp3")
        local audioChannel
    
        local function playAudio()
            audioChannel = audio.play(audioFile, { loops = -1 })
        end
    
        local function stopAudio()
            if audioChannel then
                audio.stop(audioChannel)
                audioChannel = nil
            end
        end
    
        -- Botão de som
        local isAudioPlaying = true
        local soundButton = display.newImage(sceneGroup, "assets/sound-on.png") 
        soundButton.width = 50
        soundButton.height = 50
        soundButton.x = display.contentWidth - soundButton.width - 20
        soundButton.y = soundButton.height + 20
    
        local function toggleAudio()
            if isAudioPlaying then
                stopAudio()
                soundButton.fill = { type = "image", filename = "assets/sound-off.png" } 
            else
                playAudio()
                soundButton.fill = { type = "image", filename = "assets/sound-on.png" } 
            end
            isAudioPlaying = not isAudioPlaying
        end
        soundButton:addEventListener("tap", toggleAudio)
    
        -- Reproduz o áudio automaticamente ao entrar na página
        playAudio()

    -- Botão de voltar
    local backButton = display.newImage(sceneGroup, "assets/icon-voltar.png")
    backButton.width = 60
    backButton.height = 60
    backButton.x = backButton.width / 2 + 10
    backButton.y = backButton.height / 2 + 10

    -- Função para passar página
    local function backPage()
        stopAudio()
        composer.gotoScene("pages.pageone", { effect = "slideRight", time = 500 })
    end
    backButton:addEventListener("tap", backPage)

    -- Título
    local tituloPag = display.newImage(sceneGroup, "assets/titulo-euploidias.png")
    tituloPag.width = 586
    tituloPag.height = 188
    tituloPag.x = display.contentCenterX
    tituloPag.y = display.contentCenterY - 360

    -- assunto da página
    local box1 = display.newRoundedRect(sceneGroup, display.contentCenterX, display.contentCenterY + 50, 600, 700, 25)
    box1:setFillColor(1, 1, 1, 0.2)   -- Preto com transparência
    box1.strokeWidth = 2
    box1:setStrokeColor(1, 0, 0, 0.2) -- Contorno vermelho

    local cont = display.newText({
        parent = sceneGroup,
        text =
        "Uma alteração cromossômica numérica acontece quando o  número de cromossomos cresce ou diminui",
        x = box1.x - 130,
        y = box1.y - 290,
        width = 250,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 16,
        align = "left"
    })
    cont:setFillColor(1, 1, 1)   -- Cor branca
    cont.strokeWidth = 2
    cont:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont:toFront()

    local cont2 = display.newText({
        parent = sceneGroup,
        text =
        "Por exemplo, o ser humano possui 46 pares de cromossomos, com 22 sendo autossomos e um par sendo de cromossomos sexuais. ",
        x = box1.x + 130,
        y = box1.y - 290,
        width = 280,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 16,
        align = "right"
    })
    cont2:setFillColor(1, 1, 1)   -- Cor branca
    cont2.strokeWidth = 2
    cont2:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont2:toFront()

    local cont2b = display.newText({
        parent = sceneGroup,
        text =
        "Porém, podem ocorrer mudanças na quantidade de cromossomos de um indivíduo, levando à alteração numérica.",
        x = box1.x,
        y = box1.y - 200,
        width = 500,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 16
    })
    cont2b:setFillColor(1, 1, 1)   -- Cor branca
    cont2b.strokeWidth = 2
    cont2b:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont2b:toFront()

    -- guia de interação
    local guide = display.newText({
        parent = sceneGroup,
        text = "As alterações numéricas podem ser classificadas em euploidias e aneuploidias.",
        x = box1.x,
        y = box1.y - 125,
        width = 500,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 20,
        align = "center"
    })
    guide:setFillColor(1, 1, 0)
    guide.strokeWidth = 2
    guide:setStrokeColor(1, 0, 0)
    guide:toFront()

    local cont3 = display.newText({
        parent = sceneGroup,
        text =
        "Na Euploidia, existe a alteração completa  dos conjuntos cromossômicos.",
        x = box1.x + 10,
        y = box1.y - 60,
        width = 550,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 16
    })
    cont3:setFillColor(1, 1, 1)   -- Cor branca
    cont3.strokeWidth = 2
    cont3:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont3:toFront()

    local cont4Titulo = display.newText({
        parent = sceneGroup,
        text = "A euploidia normalmente não é compatível com a vida, porém é possível em abelhas.",
        x = box1.x - 130,
        y = box1.y,
        width = 250,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 16
    })
    cont4Titulo:setFillColor(1, 1, 1)   -- Cor branca
    cont4Titulo.strokeWidth = 2
    cont4Titulo:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont4Titulo:toFront()

    local cont4 = display.newText({
        parent = sceneGroup,
        text = "Isso acontece nos zangões,pois eles se desenvolvem por partenogênese (possuem apenas um conjunto cromossômico).",
        x = box1.x - 130,
        y = box1.y + 90,
        width = 250,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 16
    })
    cont4:setFillColor(1, 1, 1)   -- Cor branca
    cont4.strokeWidth = 2
    cont4:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont4:toFront()

    local bee = display.newImage(sceneGroup, "assets/bee.png")
    bee.width = 280
    bee.height = 160
    bee.x = display.contentCenterX + 140
    bee.y = display.contentCenterY + 100

    local cont5 = display.newText({
        parent = sceneGroup,
        text = "Na euploidia, o número de genomas é alterado e um conjunto diploide pode, nesse caso, originar um organismo haploide ou poliploide (conjunto cromossômico acima do nível diploide).",
        x = box1.x,
        y = box1.y + 180,
        width = 550,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 16
    })
    cont5:setFillColor(1, 1, 1)   -- Cor branca
    cont5.strokeWidth = 2
    cont5:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont5:toFront()

    local euploidia = display.newImage(sceneGroup, "assets/euploidia-transformed.png")
    euploidia.width = 260
    euploidia.height = 130
    euploidia.x = display.contentCenterX
    euploidia.y = display.contentCenterY + 330

    -- Botão de passar página
    local nextButton = display.newImage(sceneGroup, "assets/icon-proximo.png")
    nextButton.width = 60
    nextButton.height = 60
    nextButton.x = display.contentWidth - nextButton.width / 2 - 10
    nextButton.y = display.contentHeight - nextButton.height / 2 - 10

    -- Função para passar página
    local function nextPage()
        stopAudio()
        composer.gotoScene("pages.pagethree", { effect = "slideLeft", time = 500 })
    end
    nextButton:addEventListener("tap", nextPage)
end

-- Adiciona o listener para o evento "create" da cena
scene:addEventListener("create", scene)

return scene
