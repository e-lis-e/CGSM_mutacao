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
    local tituloPag = display.newImage(sceneGroup, "assets/titulo-resumo.png")
    tituloPag.width = 586
    tituloPag.height = 188
    tituloPag.x = display.contentCenterX
    tituloPag.y = display.contentCenterY - 360

    -- Adicionando o áudio
    local audioFile = audio.loadStream("audios/pageone.mp3")
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
        composer.gotoScene("capa", { effect = "slideRight", time = 500 })
    end
    backButton:addEventListener("tap", backPage)

    -- assunto da página
    local box1 = display.newRoundedRect(sceneGroup, display.contentCenterX, display.contentCenterY + 50, 600, 700, 25)
    box1:setFillColor(1, 1, 1, 0.2)   -- Preto com transparência
    box1.strokeWidth = 2
    box1:setStrokeColor(1, 0, 0, 0.2) -- Contorno vermelho

    local cont = display.newText({
        parent = sceneGroup,
        text =
        "A Mutação  é uma alteração que acontece no material genético, tanto de forma natural como de forma induzida por um agente mutagênico.",
        x = box1.x,
        y = box1.y - 290,
        width = 500,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 18,
        align = "center"
    })
    cont:setFillColor(1, 1, 1)   -- Cor branca
    cont.strokeWidth = 2
    cont:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont:toFront()

    local cont2 = display.newText({
        parent = sceneGroup,
        text =
        "Na forma natural, normalmente pode acontecer durante processos de mitose, meiose ou síntese proteica.",
        x = box1.x - 130,
        y = box1.y - 180,
        width = 250,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 18,
        align = "left"
    })
    cont2:setFillColor(1, 1, 1)   -- Cor branca
    cont2.strokeWidth = 2
    cont2:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont2:toFront()

    local cont2b = display.newText({
        parent = sceneGroup,
        text =
        "Na forma induzida, pode ocorrer por substâncias químicas ou físicas, como raios UV, raios X, álcool, tabaco e alguns tipos de medicamentos.",
        x = box1.x + 140,
        y = box1.y - 170,
        width = 260,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 18,
        align = "right"
    })
    cont2b:setFillColor(1, 1, 1)   -- Cor branca
    cont2b.strokeWidth = 2
    cont2b:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont2b:toFront()

    local fitaDNA = display.newImage(sceneGroup, "assets/dna-rna-clean.png")
    fitaDNA.width = 300
    fitaDNA.height = 300
    fitaDNA.rotation = 130
    fitaDNA.x = display.contentCenterX
    fitaDNA.y = display.contentCenterY + 15

    -- guia de interação
    local guide = display.newText({
        parent = sceneGroup,
        text = "toque na fita genética para aplicar raios ultravioleta.",
        x = box1.x,
        y = box1.y + 50,
        width = 400,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 14,
        align = "center"
    })
    guide:setFillColor(1, 1, 0)
    guide.strokeWidth = 2
    guide:setStrokeColor(1, 0, 0)
    guide:toFront()

    -- Variável para contar o número de toques na fita
    local dnaTouchCount = 0

    -- som de raio laser
    local raySound = audio.loadStream("audios/laser.mp3")

    -- Função para alterar a aparência da fita de DNA
    local function applyUVEffect(fitaDNA)
        dnaTouchCount = dnaTouchCount + 1

        audio.play(raySound)

        if dnaTouchCount == 5 then
            -- Alterar a imagem para mostrar danos iniciais
            fitaDNA.fill = { type = "image", filename = "assets/dna-rna-alterado1.png" }
            system.vibrate()
        elseif dnaTouchCount == 10 then
            -- Alterar a imagem para mostrar danos mais graves
            fitaDNA.fill = { type = "image", filename = "assets/dna-rna-alterado2.png" }
            system.vibrate()
        elseif dnaTouchCount == 15 then
            -- Alterar a imagem para mostrar a fita quebrada
            fitaDNA.fill = { type = "image", filename = "assets/dna-rna-alterado3.png" }
            system.vibrate()
        end
    end

    local function setupDNAInteraction(fitaDNA)
        local function onDNATouch(event)
            if event.phase == "ended" then
                applyUVEffect(fitaDNA)
            end
            return true 
        end

        fitaDNA:addEventListener("touch", onDNATouch)
    end

    setupDNAInteraction(fitaDNA)

    local cont3 = display.newText({
        parent = sceneGroup,
        text =
        "Mutações são as bases para variabilidade genética, por influenciar no processo de evolução dos seres vivos. Essa variabilidade amplia a capacidade das populações de lidarem com mudanças ambientais, se tornando um fator essencial no processo evolutivo. Essas alterações podem ser:",
        x = box1.x,
        y = box1.y + 120,
        width = 500,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 18
    })
    cont3:setFillColor(1, 1, 1)   -- Cor branca
    cont3.strokeWidth = 2
    cont3:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont3:toFront()

    local cont4Titulo = display.newText({
        parent = sceneGroup,
        text = "Numéricas",
        x = box1.x - 100,
        y = box1.y + 220,
        width = 280,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 20
    })
    cont4Titulo:setFillColor(1, 1, 0)   -- Cor amarela
    cont4Titulo.strokeWidth = 2
    cont4Titulo:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont4Titulo:toFront()

    local cont4 = display.newText({
        parent = sceneGroup,
        text = "afetam o número de cromossomos do indivíduo para mais ou para menos.",
        x = box1.x - 130,
        y = box1.y + 270,
        width = 220,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 16
    })
    cont4:setFillColor(1, 1, 1)   -- Cor branca
    cont4.strokeWidth = 2
    cont4:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont4:toFront()


    local cont5Titulo = display.newText({
        parent = sceneGroup,
        text = "Estruturais",
        x = box1.x + 150,
        y = box1.y + 220,
        width = 280,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 20
    })
    cont5Titulo:setFillColor(1, 1, 0)   -- Cor amarela
    cont5Titulo.strokeWidth = 2
    cont5Titulo:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont5Titulo:toFront()

    local cont5 = display.newText({
        parent = sceneGroup,
        text = "afetam a estrutura de um cromossomo e são resultado de rearranjos e quebras dessas estruturas.",
        x = box1.x + 150,
        y = box1.y + 280,
        width = 280,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 16
    })
    cont5:setFillColor(1, 1, 1)   -- Cor amarela
    cont5.strokeWidth = 2
    cont5:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont5:toFront()

    -- Botão de passar página
    local nextButton = display.newImage(sceneGroup, "assets/icon-proximo.png")
    nextButton.width = 60
    nextButton.height = 60
    nextButton.x = display.contentWidth - nextButton.width / 2 - 10
    nextButton.y = display.contentHeight - nextButton.height / 2 - 10

    -- Função para passar página
    local function nextPage()
        stopAudio()
        composer.gotoScene("pages.pagetwo", { effect = "slideLeft", time = 500 })
    end
    nextButton:addEventListener("tap", nextPage)

    self.soundButton = soundButton
    self.fitaDNA = fitaDNA
    self.dnaTouchCount = dnaTouchCount
end

function scene:show(event)
    local phase = event.phase
    if phase == "will" then
        -- Reinicia o estado da cena
        self.dnaTouchCount = 0
        self.fitaDNA.fill = { type = "image", filename = "assets/dna-rna-clean.png" }
        self.soundButton.fill = { type = "image", filename = "assets/sound-on.png" }
    end
end


-- Adiciona o listener para o evento "create" e "hide" da cena
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)

return scene
