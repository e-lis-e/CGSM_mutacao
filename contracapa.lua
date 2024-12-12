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
    local audioFile = audio.loadStream("audios/capa.mp3")
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
        text = "Autor: Elise Parente",
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
