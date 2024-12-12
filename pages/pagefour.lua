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
    local audioFile = audio.loadStream("audios/pagefour.mp3")
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
    backButton.width = 80
    backButton.height = 80
    backButton.x = backButton.width / 2 + 10
    backButton.y = backButton.height / 2 + 10

    -- Função para passar página
    local function backPage()
        stopAudio()
        composer.gotoScene("pages.pagethree", { effect = "slideRight", time = 500 })
    end
    backButton:addEventListener("tap", backPage)

    -- Título
    local tituloPag = display.newImage(sceneGroup, "assets/titulo-estruturais.png")
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
        "Alterações cromossômicas estruturais são mudanças que afetama morfologia do cromossomo, como perder partes do material genético ou mudança senquencial dos genes.",
        x = box1.x,
        y = box1.y - 290,
        width = 500,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 16,
    })
    cont:setFillColor(1, 1, 1)   -- Cor branca
    cont.strokeWidth = 2
    cont:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont:toFront()

    local cont2 = display.newText({
        parent = sceneGroup,
        text =
        "As alterações cromossômicas estruturais incluem deleção, duplicação, inversão e translocação.",
        x = box1.x + 15,
        y = box1.y - 230,
        width = 530,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 16
    })
    cont2:setFillColor(1, 1, 1)   -- Cor branca
    cont2.strokeWidth = 2
    cont2:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont2:toFront()

    local cont2b = display.newText({
        parent = sceneGroup,
        text =
        "Deleção é uma alteração estrutural em que ocorre a perda do material genético. Nesses casos, ocorre a quebra de uma parte do cromossomo que não é mais incorporada a ele. Nisso, ele não apresenta todos os genes e afeta de forma considerável o indivíduo.",
        x = box1.x,
        y = box1.y - 140,
        width = 500,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 16
    })
    cont2b:setFillColor(1, 1, 1)   -- Cor branca
    cont2b.strokeWidth = 2
    cont2b:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont2b:toFront()

    local cont3 = display.newText({
        parent = sceneGroup,
        text =
        "Duplicação é uma alteração em que o material genético é repetido. Normalmente, essa alteração ocorre após uma delação, pois o fragmento que foi perdido se liga à cromátide irmã, que forma uma porção extra",
        x = box1.x,
        y = box1.y - 50,
        width = 500,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 16
    })
    cont3:setFillColor(1, 1, 1)   -- Cor branca
    cont3.strokeWidth = 2
    cont3:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont3:toFront()

    local cont4 = display.newText({
        parent = sceneGroup,
        text = "Inversão é uma alteração onde uma parte do cromossomo se separa e se une, porém de forma invertida. Nesse caso, nada se perde, mas altera a ordem dos genes.",
            x = box1.x,
            y = box1.y + 30,
            width = 500,
            font = "MavenPro-VariableFont_wght.ttf",
            fontSize = 16
    })
    cont4:setFillColor(1, 1, 1)   -- Cor branca
    cont4.strokeWidth = 2
    cont4:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont4:toFront()

    local cont5 = display.newText({
        parent = sceneGroup,
        text = "existem dois tipos de inversão: a pericêntrica, onde a região invertida envolve o centrômero, e a paracêntrica, onde o centrômero não é envolvido.",
        x = box1.x,
            y = box1.y + 100,
            width = 500,
            font = "MavenPro-VariableFont_wght.ttf",
            fontSize = 16
    })
    cont5:setFillColor(1, 1, 1)   -- Cor amarela
    cont5.strokeWidth = 2
    cont5:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont5:toFront()

    local estrutural1 = display.newImage(sceneGroup, "assets/estruturais1.png")
    estrutural1.width = 300
    estrutural1.height = 200
    estrutural1.x = display.contentCenterX
    estrutural1.y = display.contentCenterY + 280

    -- Botão de passar página
    local nextButton = display.newImage(sceneGroup, "assets/icon-proximo.png")
    nextButton.width = 80
    nextButton.height = 80
    nextButton.x = display.contentWidth - nextButton.width / 2 - 10
    nextButton.y = display.contentHeight - nextButton.height / 2 - 10

    -- Função para passar página
    local function nextPage()
        stopAudio()
        composer.gotoScene("pages.pagefive", { effect = "slideLeft", time = 500 })
    end
    nextButton:addEventListener("tap", nextPage)
end

-- Adiciona o listener para o evento "create" da cena
scene:addEventListener("create", scene)

return scene
