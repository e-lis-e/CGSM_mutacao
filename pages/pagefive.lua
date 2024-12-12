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
    local audioFile = audio.loadStream("audios/pagefive.mp3")
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
        composer.gotoScene("pages.pagefour", { effect = "slideRight", time = 500 })
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
        "Por fim, a translocação é uma alteração onde ocorre a incorporação de uma porção cromossômica a um cromossomo não homologo (que não são geneticamente iguais, não possuem a mesma estrutura).",
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

    -- guia de interação
    local guide = display.newText({
        parent = sceneGroup,
        text = "arraste os cromossomos para ver a translocação recíproca",
        x = box1.x,
        y = box1.y - 65,
        width = 500,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 14,
        align = "center"
    })
    guide:setFillColor(1, 1, 0)
    guide.strokeWidth = 2
    guide:setStrokeColor(1, 0, 0)
    guide:toFront()

    local trans1 = display.newImage(sceneGroup,"assets/translocacao1.png")
    trans1.x = display.contentCenterX - 50
    trans1.y = display.contentCenterY - 110
    trans1.width = 300
    trans1.height = 180

    local trans2 = display.newImage(sceneGroup, "assets/translocacao2.png")
    trans2.x = display.contentCenterX + 50
    trans2.y = display.contentCenterY - 110
    trans2.width = 300
    trans2.height = 180
    trans2.alpha = 0 -- Invisível

     -- Função para arrastar imagem
     local function onTrans1Touch(event)
        local phase = event.phase
        if phase == "began" then
            display.getCurrentStage():setFocus(trans1)
            trans1.isFocus = true
            trans1.startX = event.x - trans1.x
            trans1.startY = event.y - trans1.y

        elseif phase == "moved" and trans1.isFocus then
            trans1.x = event.x - trans1.startX
            trans1.y = event.y - trans1.startY

            -- Verifica se trans1 foi movido para a posição alvo
            if trans1.x > display.contentCenterX + 100 then
                trans2.alpha = 1
                trans1.alpha = 0 
                trans1:removeEventListener("touch", onTrans1Touch)
                display.getCurrentStage():setFocus(nil) -- Libera o foco após completar
            end

        elseif (phase == "ended" or phase == "cancelled") and trans1.isFocus then
            display.getCurrentStage():setFocus(nil)
            trans1.isFocus = false
        end
        return true
    end
    trans1:addEventListener("touch", onTrans1Touch)

    local cont2 = display.newText({
        parent = sceneGroup,
        text =
        "O exemplo acima mostra a translocação recíproca, onde os dois fazem uma troca de igual para igual. ´também existe a translocação não recíproca, onde o cromossomo só passa a porção cromossômica sem receber nenhuma porção em troca.",
        x = box1.x,
        y = box1.y,
        width = 500,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 16,
    })
    cont2:setFillColor(1, 1, 1)   -- Cor branca
    cont2.strokeWidth = 2
    cont2:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont2:toFront()

    local cont2b = display.newText({
        parent = sceneGroup,
        text =
        "Além dessas, existe a translocação Robertsoniana, onde:",
        x = box1.x,
        y = box1.y + 60,
        width = 500,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 16,
    })
    cont2b:setFillColor(1, 1, 1)   -- Cor branca
    cont2b.strokeWidth = 2
    cont2b:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont2b:toFront()

    local cont3 = display.newText({
        parent = sceneGroup,
        text =
        " * um cromossomo possui o braço muito maior do que o outro;",
            x = box1.x,
            y = box1.y + 80,
            width = 500,
            font = "MavenPro-VariableFont_wght.ttf",
            fontSize = 16,
    })
    cont3:setFillColor(1, 1, 1)   -- Cor branca
    cont3.strokeWidth = 2
    cont3:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont3:toFront()

    local cont4 = display.newText({
        parent = sceneGroup,
        text = "* essa translocação causa a perda do braço curto de um e do braço longo do outro.",
            x = box1.x,
            y = box1.y + 110,
            width = 500,
            font = "MavenPro-VariableFont_wght.ttf",
            fontSize = 16,
    })
    cont4:setFillColor(1, 1, 1)   -- Cor branca
    cont4.strokeWidth = 2
    cont4:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont4:toFront()

    -- guia de interação
    local guide2 = display.newText({
        parent = sceneGroup,
        text = "arraste os cromossomos para ver a translocação robertsoniana",
        x = box1.x,
        y = box1.y + 280,
        width = 500,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 14,
        align = "center"
    })
    guide2:setFillColor(1, 1, 0)
    guide2.strokeWidth = 2
    guide2:setStrokeColor(1, 0, 0)
    guide2:toFront()

    local trans3 = display.newImage(sceneGroup,"assets/robertsoniana.png")
    trans3.x = display.contentCenterX - 50
    trans3.y = display.contentCenterY + 250
    trans3.width = 300
    trans3.height = 180

    local trans4 = display.newImage(sceneGroup, "assets/robertsoniana2.png")
    trans4.x = display.contentCenterX + 50
    trans4.y = display.contentCenterY + 250
    trans4.width = 200
    trans4.height = 180
    trans4.alpha = 0

    local function onTrans3Touch(event)
        local phase = event.phase
        if phase == "began" then
            display.getCurrentStage():setFocus(trans3)
            trans3.isFocus = true
            trans3.startX = event.x - trans3.x
            trans3.startY = event.y - trans3.y

        elseif phase == "moved" and trans3.isFocus then
            trans3.x = event.x - trans3.startX
            trans3.y = event.y - trans3.startY

            -- Verifica se trans1 foi movido para a posição alvo
            if trans3.x > display.contentCenterX + 100 then
                trans4.alpha = 1
                trans3.alpha = 0 
                trans3:removeEventListener("touch", onTrans1Touch)
                display.getCurrentStage():setFocus(nil) -- Libera o foco após completar
            end

        elseif (phase == "ended" or phase == "cancelled") and trans3.isFocus then
            display.getCurrentStage():setFocus(nil)
            trans3.isFocus = false
        end
        return true
    end
    trans3:addEventListener("touch", onTrans3Touch)


    -- Botão de passar página
    local nextButton = display.newImage(sceneGroup, "assets/icon-proximo.png")
    nextButton.width = 80
    nextButton.height = 80
    nextButton.x = display.contentWidth - nextButton.width / 2 - 10
    nextButton.y = display.contentHeight - nextButton.height / 2 - 10

    -- Função para passar página
    local function nextPage()
        stopAudio()
        composer.gotoScene("contracapa", { effect = "slideLeft", time = 500 })
    end
    nextButton:addEventListener("tap", nextPage)
end

-- Adiciona o listener para o evento "create" da cena
scene:addEventListener("create", scene)

return scene
