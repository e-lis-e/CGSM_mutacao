local composer = require("composer")
local scene = composer.newScene()

system.activate("multitouch");

-- Função de criação da cena
function scene:create(event)
    local sceneGroup = self.view

    -- Fundo
    local background = display.newImage(sceneGroup, "assets/background.png")
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    background.width = display.contentWidth
    background.height = display.contentHeight

    local group1 = display.newGroup()
    sceneGroup:insert(group1)

    local group2 = display.newGroup()
    sceneGroup:insert(group2)


    -- Adicionando o áudio
    local audioFile = audio.loadStream("audios/pagethree.mp3")
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
        composer.gotoScene("pages.pagetwo", { effect = "slideRight", time = 500 })
    end
    backButton:addEventListener("tap", backPage)

    -- Título
    local tituloPag = display.newImage(sceneGroup, "assets/titulo-aneuploidias.png")
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
        "Já na aneuploidia, não é alterado todo o conjunto de cromossomos, somente há o aumento ou diminuição de um cromossomo ou mais.",
        x = box1.x,
        y = box1.y - 300,
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
        "Quando um organismo possui um cromossomo a menos, chamamos de monossomia, com o contrário sendo chamado de trissomia.",
        x = box1.x,
        y = box1.y - 250,
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
        "Um exemplo conhecido da alteração numérica aneuploidia é a Síndrome de Down, onde existem três cromossomos no 21º lote ao invés de dois.",
        x = box1.x + 140,
        y = box1.y - 160,
        width = 250,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 16,
        align = "right"
    })
    cont2b:setFillColor(1, 1, 1)   -- Cor branca
    cont2b.strokeWidth = 2
    cont2b:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont2b:toFront()

    -- guia de interação
    local guide = display.newText({
        parent = sceneGroup,
        text = "Dê zoom (gesto de pinça) nos exemplos para destacar a aneuploidia!",
        x = box1.x,
        y = box1.y + 75,
        width = 500,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 14,
        align = "center"
    })
    guide:setFillColor(1, 1, 0)
    guide.strokeWidth = 2
    guide:setStrokeColor(1, 0, 0)
    guide:toFront()

    local cont3 = display.newText({
        parent = sceneGroup,
        text =
        "A síndrome tem como caracteristica o atraso no desenvolvimento, aumento no risco de doenças autoimunes  e diferenciais na aparência como baixa estatura, olhos com linha ascendente e dobras da pele nos cantos internos.",
        x = box1.x + 140,
        y = box1.y - 20,
        width = 260,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 16,
        align = "right"
    })
    cont3:setFillColor(1, 1, 1)   -- Cor branca
    cont3.strokeWidth = 2
    cont3:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont3:toFront()

    -- foto para zoom
    local aneuploidia1 = display.newImage(group1, "assets/down-zoom.png")
    aneuploidia1.width = 250
    aneuploidia1.height = 250
    aneuploidia1.x = 0
    aneuploidia1.y = 0

    group1.x = display.contentCenterX - 130
    group1.y = display.contentCenterY - 30

    local cont4 = display.newText({
        parent = sceneGroup,
        text = "Outro exemplo é a síndrome de turner, onde existe somente um cromossomo X, chamado de monossomia.",
        x = box1.x - 140,
        y = box1.y + 150,
        width = 220,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 16
    })
    cont4:setFillColor(1, 1, 1)   -- Cor branca
    cont4.strokeWidth = 2
    cont4:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont4:toFront()

    local cont5 = display.newText({
        parent = sceneGroup,
        text =
        "Turner comumente afeta no desenvolvimento da mulher, fazendo com que tenham, em sua maioria,  problemas na puberdade.",
        x = box1.x - 140,
        y = box1.y + 250,
        width = 220,
        font = "MavenPro-VariableFont_wght.ttf",
        fontSize = 16
    })
    cont5:setFillColor(1, 1, 1)   -- Cor amarela
    cont5.strokeWidth = 2
    cont5:setStrokeColor(1, 0, 0) -- Sombra vermelha
    cont5:toFront()

    local aneuploidia2 = display.newImage(group2, "assets/turner-zoom.png")
    aneuploidia2.width = 250
    aneuploidia2.height = 250
    aneuploidia2.x = 0
    aneuploidia2.y = 0

    group2.x = display.contentCenterX + 150
    group2.y = display.contentCenterY + 260

    -- Botão de passar página
    local nextButton = display.newImage(sceneGroup, "assets/icon-proximo.png")
    nextButton.width = 60
    nextButton.height = 60
    nextButton.x = display.contentWidth - nextButton.width / 2 - 10
    nextButton.y = display.contentHeight - nextButton.height / 2 - 10

    -- Função para passar página
    local function nextPage()
        stopAudio()
        composer.gotoScene("pages.pagefour", { effect = "slideLeft", time = 500 })
    end
    nextButton:addEventListener("tap", nextPage)

    -- Calcula a distância entre dois pontos
    local function calculateDistance(x1, y1, x2, y2)
        local dx = x2 - x1
        local dy = y2 - y1
        return math.sqrt(dx * dx + dy * dy)
    end

    local function enableZoom(group)
        local finger1, finger2
        local initialDistance
        local isZooming = false
        local originalScaleX, originalScaleY

        -- Define os limites de zoom
        local minScale, maxScale = 0.5, 2.0

        local function onGroupTouch(event)
            local phase = event.phase

            if phase == "began" then
                if not finger1 then
                    finger1 = event
                elseif not finger2 then
                    finger2 = event
                    isZooming = true
                    initialDistance = calculateDistance(finger1.x, finger1.y, finger2.x, finger2.y)
                    originalScaleX, originalScaleY = group.xScale, group.yScale
                end
            elseif phase == "moved" and isZooming then
                if event.id == finger1.id then
                    finger1 = event
                elseif event.id == finger2.id then
                    finger2 = event
                end

                if finger1 and finger2 then
                    local currentDistance = calculateDistance(finger1.x, finger1.y, finger2.x, finger2.y)
                    local scale = currentDistance / initialDistance

                    -- Calcula o novo tamanho com limites
                    local newScaleX = math.max(minScale, math.min(maxScale, originalScaleX * scale))
                    local newScaleY = math.max(minScale, math.min(maxScale, originalScaleY * scale))

                    group.xScale = newScaleX
                    group.yScale = newScaleY
                end
            elseif phase == "ended" or phase == "cancelled" then
                if event.id == finger1.id then
                    finger1 = nil
                elseif event.id == finger2.id then
                    finger2 = nil
                end

                if not finger1 or not finger2 then
                    isZooming = false
                end
            end

            return true
        end

        group:addEventListener("touch", onGroupTouch)
    end


    enableZoom(group1) -- Habilita zoom na primeira imagem
    enableZoom(group2) -- Habilita zoom na segunda imagem
end

-- Adiciona o listener para o evento "create" da cena
scene:addEventListener("create", scene)

return scene