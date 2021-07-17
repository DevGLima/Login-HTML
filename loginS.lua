function loginPlayer(username, password)
	local account = getAccount(username, password)
	if string.find(username, " ") then return end
	if string.find(password, " ") then return end
	if (account ~= false) then
		logIn(client, account, password)
		for i=1,30 do
			outputChatBox(" ", client)
		end
		triggerClientEvent(client, "onClientPlayerLogin", client)
		outputChatBox("Você está logado no servidor.", client)
	else
		outputChatBox("Conta não encontrada.", client)
	end
end
addEvent("login", true)
addEventHandler("login", root, loginPlayer)

function registerPlayer(username, password)
	if string.find(username, " ") then outputChatBox("Caracters Invalidos.") return end
	outputChatBox(username .. " " .. password, client)
	local accountAdded = addAccount(username, password)
	if (acconutAdded) then
		for i=1,30 do
			outputChatBox(" ", client)
		end
		outputChatBox("Você se registrou no servidor. Iniciar sessão.", client)
	else
		outputChatBox("Erro ao se registrar ou conta existe.", client)
	end
end
addEvent("register", true)
addEventHandler("register", root, registerPlayer)