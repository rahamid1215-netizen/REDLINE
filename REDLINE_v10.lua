-- REDLINE | WANTED v10
-- Created by RahamidAli

local Players = game:GetService('Players')
local RunService = game:GetService('RunService')
local UserInputService = game:GetService('UserInputService')
local HttpService = game:GetService('HttpService')
local player = Players.LocalPlayer
if not player then return end
if game.PlaceId ~= 14438406081 then warn('[REDLINE] Unsupported game.'); return end

if _G.REDLINEHubV10 and type(_G.REDLINEHubV10.close) == 'function' then pcall(_G.REDLINEHubV10.close) end
if _G.REDLINEHubV9 and type(_G.REDLINEHubV9.close) == 'function' then pcall(_G.REDLINEHubV9.close) end
if _G.REDLINEHubV8 and type(_G.REDLINEHubV8.close) == 'function' then pcall(_G.REDLINEHubV8.close) end
if _G.REDLINEHubV7 and type(_G.REDLINEHubV7.close) == 'function' then pcall(_G.REDLINEHubV7.close) end
if _G.WANTEDHubV6 and type(_G.WANTEDHubV6.close) == 'function' then pcall(_G.WANTEDHubV6.close) end

local approved = {
  ['1va_adrian051318']=true,
  ['1va_aiden051319']=true,
  ['1va_amelia031725']=true,
  ['1va_andre082309']=true,
  ['1va_aria052417']=true,
  ['1va_austin091824']=true,
  ['1va_avery061523']=true,
  ['1va_bennett100512']=true,
  ['1va_brandon120513']=true,
  ['1va_brielle121117']=true,
  ['1va_bryce072109']=true,
  ['1va_caleb080911']=true,
  ['1va_cameron073025']=true,
  ['1va_carter110586']=true,
  ['1va_celeste041217']=true,
  ['1va_chloe122607']=true,
  ['1va_clara073118']=true,
  ['1va_colton110317']=true,
  ['1va_connor112719']=true,
  ['1va_cooper061903']=true,
  ['1va_damian101305']=true,
  ['1va_declan050826']=true,
  ['1va_dylan032718']=true,
  ['1va_elena120923']=true,
  ['1va_elijah042716']=true,
  ['1va_emma041827']=true,
  ['1va_ethan091205']=true,
  ['1va_evan081416']=true,
  ['1va_gabriel091205']=true,
  ['1va_gavin052822']=true,
  ['1va_harper061209']=true,
  ['1va_hazel061923']=true,
  ['1va_hunter083106']=true,
  ['1va_jason122604']=true,
  ['1va_jasper102906']=true,
  ['1va_jordan042615']=true,
  ['1va_julian081106']=true,
  ['1va_landon020402']=true,
  ['1va_landon082714']=true,
  ['1va_leo110723']=true,
  ['1va_leon022298']=true,
  ['1va_lily030822']=true,
  ['1va_logan061421']=true,
  ['1va_madison071824']=true,
  ['1va_malcolm110614']=true,
  ['1va_marcus092814']=true,
  ['1va_mason071923']=true,
  ['1va_maya101205']=true,
  ['1va_miles092314']=true,
  ['1va_natalie042817']=true,
  ['1va_nolan112807']=true,
  ['1va_nora061105']=true,
  ['1va_owen042316']=true,
  ['1va_parker121409']=true,
  ['1va_quinn082315']=true,
  ['1va_ryan072621']=true,
  ['1va_scarlett051927']=true,
  ['1va_sienna062418']=true,
  ['1va_sophia042916']=true,
  ['1va_stella032721']=true,
  ['1va_tristan101217']=true,
  ['1va_vivian091824']=true,
  ['1va_wesley031726']=true,
  ['amigohelper3000']=true,
  ['amigohelper4000']=true,
  ['amigohelper5000']=true,
  ['amigohelper6000']=true,
  ['amigohelper7000']=true,
  ['anthonysonic11']=true,
  ['averyngakuran']=true,
  ['beastboyterrence']=true,
  ['damien132']=true,
  ['epicface409']=true,
  ['hardslayer']=true,
  ['kaelrixgakuran']=true,
  ['lypit145y4']=true,
  ['lypit171w7']=true,
  ['lypit284o7']=true,
  ['lypit3061x']=true,
  ['lypit35s93']=true,
  ['lypit5402m']=true,
  ['lypit5d285']=true,
  ['lypit629f3']=true,
  ['lypit6h909']=true,
  ['lypit83l37']=true,
  ['lypit8k359']=true,
  ['lypit9k789']=true,
  ['lypitk4718']=true,
  ['lypitn7120']=true,
  ['lypitt7633']=true,
  ['masterplayer707']=true,
  ['picklewellington']=true,
  ['ponygirlshadow']=true,
  ['ryvexgakuran']=true,
  ['shaunfootball']=true,
  ['stuffydog9']=true,
  ['toughkiller34']=true,
  ['velvetafterglow']=true,
  ['veylithgakuran']=true,
  ['zarviongakuran']=true,
}
local isListed = approved[player.Name:lower()] == true
local route = {['main']={['x']=-6724.72,['y']=43.09,['z']=735.3},['speaker']={['x']=-6590.67,['y']=101,['z']=3170},['ghosts']={{['x']=-6997.7,['y']=53,['z']=3108.19},{['x']=-4891.73,['y']=20.76,['z']=3727.33},{['x']=-4436.99,['y']=559.19,['z']=2353.31},{['x']=-1115.07,['y']=180.93,['z']=3288.3},{['x']=701.04,['y']=69.1,['z']=2820.37},{['x']=1138.87,['y']=104.64,['z']=1808.63},{['x']=-137.28,['y']=39.83,['z']=-1749.5},{['x']=-3473.01,['y']=345,['z']=103.77},{['x']=-6335.73,['y']=397.31,['z']=-844.99}}}
-- Item locations must be physically consistent with the quest giver.
-- This supplied speaker marker is ~2,439 studs from the main ghost. Do not trust it without validation.
local savedSpeakerPath = 'REDLINE_speaker_' .. tostring(game.PlaceId) .. '.json'
local function distanceBetween(a,b)
  return (Vector3.new(a.x,a.y,a.z)-Vector3.new(b.x,b.y,b.z)).Magnitude
end
local speedOptions = {75,80,85}
local settingsFile = 'REDLINE_v10_settings.json'
local checkpointFile = 'REDLINE_v10_checkpoint_' .. tostring(player.UserId) .. '.json'
local queueFile = 'REDLINE_v10_outbox_' .. tostring(player.UserId) .. '.json'
local state = {
  running=false, stopping=false, awaiting=false, token=0, connected={}, noclipConn=nil, collisionOriginal={},
  speed=80, noclip=true, paused=false, pauseEach=false, tutorialReady=false, missionStarted=false, confirmedGhost=0,
  attemptedGhost=0, amuletHeld=false, questCompleted=false, selectedPage='home', phase='waiting',
  retries=0, session=HttpService:GenerateGUID(false), networkError='', checkpointStamp=0, died=false, routeError='',
  url='', ingest='', status='Idle', history={},
}
_G.REDLINEHubV10=state
local ui={}
local gui
local function log(s)
  s=tostring(s)
  state.status=s
  if ui.status then ui.status.Text=s end
  print('[REDLINE] '..s)
end
local function readFile(path)
  if type(readfile)~='function' then return nil end
  local ok,txt=pcall(readfile,path)
  if not ok or type(txt)~='string' then return nil end
  local valid,obj=pcall(HttpService.JSONDecode,HttpService,txt)
  return valid and type(obj)=='table' and obj or nil
end
local function saveFile(path,data)
  if type(writefile)=='function' then
    pcall(writefile,path,HttpService:JSONEncode(data))
  end
end
local speakerOverride = readFile(savedSpeakerPath)
if speakerOverride and tonumber(speakerOverride.x) and tonumber(speakerOverride.y) and tonumber(speakerOverride.z) then
  route.speaker = {x=speakerOverride.x,y=speakerOverride.y,z=speakerOverride.z}
end
local configSaved=readFile(settingsFile) or readFile('REDLINE_v9_settings.json') or readFile('REDLINE_v8_settings.json') or readFile('REDLINE_v7_settings.json') or readFile('WANTED_v6_settings.json')
if configSaved then
  if tonumber(configSaved.speed) and table.find(speedOptions,configSaved.speed) then state.speed=configSaved.speed end
  -- Staged pauses from early builds are no longer enabled by default.
  -- Tutorial state is per Roblox account, not a global executor setting.
  if type(configSaved.noclip)=='boolean' then state.noclip=configSaved.noclip end
  if type(configSaved.url)=='string' then state.url=configSaved.url end
  if type(configSaved.ingest)=='string' then state.ingest=configSaved.ingest end
end
local progress=readFile(checkpointFile) or readFile('REDLINE_v9_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v8_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v7_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('WANTED_v6_checkpoint_' .. tostring(player.UserId) .. '.json')
if progress then
  state.missionStarted=progress.missionStarted==true
  state.confirmedGhost=math.clamp(tonumber(progress.confirmedGhost) or 0,0,9)
  state.attemptedGhost=math.clamp(tonumber(progress.attemptedGhost) or 0,0,9)
  state.questCompleted=progress.questCompleted==true
  state.tutorialReady=progress.tutorialReady==true
end
local outbox=readFile(queueFile) or readFile('REDLINE_v9_outbox_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v8_outbox_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v7_outbox_' .. tostring(player.UserId) .. '.json') or readFile('WANTED_v6_outbox_' .. tostring(player.UserId) .. '.json') or {}
if type(outbox)~='table' then outbox={} end
local function saveSettings()
  saveFile(settingsFile,{speed=state.speed,noclip=state.noclip,url=state.url,ingest=state.ingest})
end
local function checkpoint()
  saveFile(checkpointFile,{missionStarted=state.missionStarted,confirmedGhost=state.confirmedGhost,
    attemptedGhost=state.attemptedGhost,questCompleted=state.questCompleted,tutorialReady=state.tutorialReady})
end
local function safeUrl()
  return type(state.url)=='string' and state.url:match('^https://[%w%.%-]+')~=nil
    and not state.url:find('@',1,true)
end
local function transport()
  if type(request)=='function' then return request end
  if type(http_request)=='function' then return http_request end
  if type(syn)=='table' and type(syn.request)=='function' then return syn.request end
  if type(fluxus)=='table' and type(fluxus.request)=='function' then return fluxus.request end
  return nil
end
local function http(method,endpoint,body)
  local fn=transport()
  if not fn or not safeUrl() or #state.ingest<32 then return nil,'Backend connection is not configured' end
  local opts={Url=state.url:gsub('/+$','')..endpoint,Method=method,Headers={['Authorization']='Bearer '..state.ingest,['Content-Type']='application/json'}}
  if body then opts.Body=HttpService:JSONEncode(body) end
  local ok, res=pcall(fn,opts)
  if not ok or type(res)~='table' then return nil,tostring(res) end
  local status=tonumber(res.StatusCode or res.Status) or 0
  local decoded=nil
  pcall(function() decoded=HttpService:JSONDecode(res.Body or '{}') end)
  if status<200 or status>=300 then return nil,'HTTP '..status..' '..tostring((decoded and decoded.detail) or '') end
  return decoded or {},nil
end
local function flushOutbox()
  if not isListed or #outbox==0 then return end
  local nextQueue={}
  for i,entry in ipairs(outbox) do
    if i>40 then table.insert(nextQueue,entry)
    else
      local data,err=http('POST','/api/events',entry)
      if not data then table.insert(nextQueue,entry);state.networkError=err
      elseif data.tracked==false then state.networkError='Username not on tracker list' end
    end
  end
  outbox=nextQueue;saveFile(queueFile,outbox)
end
local function report(event,phase,ghost,detail,confirmed)
  if not isListed then return end
  local e={username=player.Name,user_id=player.UserId,event=event,event_id=HttpService:GenerateGUID(false),
    session_id=state.session,phase=phase or state.phase,ghost=ghost or 0,detail=tostring(detail or ''):sub(1,230),confirmed=confirmed==true}
  state.phase=e.phase
  local data,err=http('POST','/api/events',e)
  if data then
    if data.completed then state.questCompleted=true;checkpoint() end
    if #outbox>0 then flushOutbox() end
  else
    state.networkError=err or ''
    if #outbox<120 then table.insert(outbox,e);saveFile(queueFile,outbox) end
    if err and err:find('409',1,true) then
      state.stopping=true
      log('Account already active. Run stopped.')
    end
  end
end
local function syncExisting()
  if not isListed then return end
  local data,err=http('GET','/api/account/'..player.Name)
  if not data then state.networkError=err or '';return end
  if data.tracked then
    if data.quest_completed==1 or data.quest_completed==true then state.questCompleted=true end
    state.confirmedGhost=math.max(state.confirmedGhost,tonumber(data.ghost_count) or 0)
    state.attemptedGhost=math.max(state.attemptedGhost,tonumber(data.attempted_ghost) or 0)
    checkpoint()
  end
end
local function root()
  local ch=player.Character or player.CharacterAdded:Wait()
  return ch:FindFirstChild('HumanoidRootPart') or ch:WaitForChild('HumanoidRootPart',10)
end
local function characterAlive()
  local ch=player.Character
  local hum=ch and ch:FindFirstChildOfClass('Humanoid')
  return hum~=nil and hum.Health>0
end
local function valid(token)
  return state.running and state.token==token and not state.stopping
end
local function waitUntilActive(token)
  while valid(token) and state.paused do task.wait(.12) end
  return valid(token)
end
local function restoreCollision()
  if state.noclipConn then state.noclipConn:Disconnect();state.noclipConn=nil end
  for p,collide in pairs(state.collisionOriginal) do
    if p and p.Parent then pcall(function() p.CanCollide=collide end) end
  end
  state.collisionOriginal={}
end
local function applyNoclip()
  if not state.noclip then return end
  local ch=player.Character
  if not ch then return end
  for _,v in ipairs(ch:GetDescendants()) do
    if v:IsA('BasePart') then
      if state.collisionOriginal[v]==nil then state.collisionOriginal[v]=v.CanCollide end
      v.CanCollide=false
    end
  end
end
local function startNoclip()
  if not state.noclip or state.noclipConn then return end
  applyNoclip()
  state.noclipConn=RunService.Stepped:Connect(applyNoclip)
end
local function stopMotion()
  local r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
  if r then pcall(function() r.AssemblyLinearVelocity=Vector3.zero end) end
  restoreCollision()
end
local function stop()
  state.stopping=true;state.running=false;state.paused=false;state.token=state.token+1
  stopMotion();state.awaiting=false
  report('stop','waiting',0,'',false)
  log('Stopped')
end
local function objectWorldPosition(obj)
  if obj:IsA('BasePart') then return obj.Position end
  if obj:IsA('Attachment') then return obj.WorldPosition end
  if obj:IsA('Model') then
    local ok,cf=pcall(function() return obj:GetPivot() end)
    if ok then return cf.Position end
  end
  if obj:IsA('ProximityPrompt') or obj:IsA('ClickDetector') then
    local p=obj.Parent
    if p and p:IsA('BasePart') then return p.Position end
    if p and p:IsA('Attachment') then return p.WorldPosition end
    if p and p:IsA('Model') then return p:GetPivot().Position end
  end
  return nil
end
local function findSpeakerNearMain()
  local mainPos=Vector3.new(route.main.x,route.main.y,route.main.z)
  local best,bestDist=nil,math.huge
  for _,obj in ipairs(workspace:GetDescendants()) do
    -- Inspect named models, parts and prompts without guessing arbitrary positions.
    if (obj:IsA('BasePart') or obj:IsA('Model') or obj:IsA('ProximityPrompt') or obj:IsA('Attachment'))
      and not (player.Character and obj:IsDescendantOf(player.Character)) then
      local name=(obj.Name or ''):lower()
      local label=obj:IsA('ProximityPrompt') and (obj.ObjectText or ''):lower() or ''
      if name:find('speaker',1,true) or name:find('amulet',1,true) or label:find('speaker',1,true) or label:find('amulet',1,true) then
        local pos=objectWorldPosition(obj)
        if pos then
          local dist=(pos-mainPos).Magnitude
          if dist<170 and dist<bestDist then best,bestDist=pos,dist end
        end
      end
    end
  end
  if best then
    route.speaker={x=best.X,y=best.Y,z=best.Z}
    -- Only save a discovered item location when it is close to the quest giver.
    saveFile(savedSpeakerPath,route.speaker)
    log(('Found nearby Speaker item (%d studs from quest giver)'):format(math.floor(bestDist)))
    return true
  end
  return false
end
local function speakerDestinationValid()
  if distanceBetween(route.main,route.speaker) < 200 then state.routeError='';return true end
  if findSpeakerNearMain() then state.routeError='';return true end
  local dist=math.floor(distanceBetween(route.main,route.speaker))
  state.routeError='Speaker location needs correction ('..dist..' studs from main ghost)'
  log(state.routeError)
  report('error','speaker_pickup',state.confirmedGhost,'Invalid saved speaker marker ('..dist..' studs from main ghost). No reliable nearby object detected.',false)
  return false
end
local function flyTo(record,token,phase,ghost)
  local dest=Vector3.new(record.x,record.y,record.z)
  local tries=0
  report('phase',phase,ghost,'',false)
  while valid(token) do
    if not waitUntilActive(token) then break end
    if state.died or not characterAlive() then return false,'death' end
    local r=root()
    if not r then task.wait(1);tries=tries+1
    else
      if (r.Position-dest).Magnitude<=7 then
        task.wait(0.35)
        if (r.Position-dest).Magnitude<=10 then stopMotion();return true end
      end
      tries=tries+1;startNoclip()
      local previous=r.Position;local started=os.clock()
      local flightDeadline=os.clock()+math.max(15,(r.Position-dest).Magnitude/state.speed*3+12)
      local reason=''
      while valid(token) and not state.died do
        if state.paused then
          local pauseStarted=os.clock()
          r.AssemblyLinearVelocity=Vector3.zero
          if not waitUntilActive(token) then break end
          flightDeadline=flightDeadline+(os.clock()-pauseStarted)
          startNoclip()
          previous=r.Position
        end
        if not r.Parent or not characterAlive() then reason='death';break end
        local delta=dest-r.Position
        if delta.Magnitude<=5 then break end
        if os.clock()>flightDeadline then reason='Flight timed out';break end
        local v=delta.Unit*math.min(state.speed,math.max(10,delta.Magnitude*2))
        r.AssemblyLinearVelocity=v
        RunService.Heartbeat:Wait()
        local new=r.Position
        if (new-previous).Magnitude>math.max(35,state.speed*0.8) and (dest-new).Magnitude>(dest-previous).Magnitude+15 then
          reason='Position correction / rubberband';break
        end
        previous=new
      end
      stopMotion()
      if state.died or reason=='death' then return false,'death' end
      if valid(token) and (r.Position-dest).Magnitude<=10 then
        task.wait(0.45)
        if (r.Position-dest).Magnitude<=14 then return true end
      end
      state.retries=state.retries+1
      if tries==4 or tries==8 or tries==12 or tries%15==0 then
        report('error',phase,ghost,reason~='' and reason or 'Movement did not reach target',false)
      end
      log(('Retrying %s (%d) | %d studs left | %s'):format(phase,tries,math.floor((r.Position-dest).Magnitude),reason~='' and reason or 'Not at destination'))
      local delay=math.min(9,1+math.floor(tries/3))
      for i=1,delay*5 do if not valid(token) then break end;task.wait(.2) end
    end
  end
  return false,'stopped'
end
local VirtualInputManager
pcall(function() VirtualInputManager=game:GetService('VirtualInputManager') end)
local function inputKey(key,down)
  if not VirtualInputManager then return false end
  return pcall(function() VirtualInputManager:SendKeyEvent(down,key,false,game) end)
end
local function tap(key,token,hold)
  if token and not waitUntilActive(token) then return false end
  if not inputKey(key,true) then return false end
  task.wait(hold or .12)
  inputKey(key,false)
  return not token or valid(token)
end
local function vmove(x,y)
  if not VirtualInputManager then return false end
  return pcall(function() VirtualInputManager:SendMouseMoveEvent(math.floor(x),math.floor(y),game) end)
end
local function vclick(x,y)
  if not VirtualInputManager then return false end
  return pcall(function()
    VirtualInputManager:SendMouseButtonEvent(math.floor(x),math.floor(y),0,true,game,0)
    task.wait(.06)
    VirtualInputManager:SendMouseButtonEvent(math.floor(x),math.floor(y),0,false,game,0)
  end)
end
local function labelVisible(part)
  if not part:IsA('GuiObject') or not part.Visible then return false end
  local p=part.Parent
  while p and p~=player.PlayerGui do
    if p:IsA('GuiObject') and not p.Visible then return false end
    p=p.Parent
  end
  return true
end
local function visibleText(term)
  local gui=player.PlayerGui
  for _,obj in ipairs(gui:GetDescendants()) do
    if (obj:IsA('TextLabel') or obj:IsA('TextButton')) and labelVisible(obj) and (not _G.REDLINEHubV10.gui or not obj:IsDescendantOf(_G.REDLINEHubV10.gui)) then
      if type(obj.Text)=='string' and obj.Text:lower():find(term:lower(),1,true) then return true,obj end
    end
  end
  return false,nil
end
local function inspectWheelFor(term,selectOnRelease,token)
  if not VirtualInputManager then
    log('Inventory input unavailable')
    return false
  end
  if token and not waitUntilActive(token) then return false end
  if not inputKey(Enum.KeyCode.Tab,true) then return false end
  task.wait(.45)
  local viewport=(workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize) or Vector2.new(900,600)
  local found=false
  for ring=1,2 do
    for slice=0,23 do
      if token and not valid(token) then break end
      if token and state.paused then break end
      local rad=math.min(viewport.X,viewport.Y)*(ring==1 and .26 or .36)
      local angle=math.rad(-90+slice*15)
      if vmove(viewport.X*.53+rad*math.cos(angle),viewport.Y*.51+rad*math.sin(angle)) then
        task.wait(.075)
        if visibleText(term) then found=true;break end
      end
    end
    if found then break end
  end
  if found and not selectOnRelease then
    vmove(viewport.X*.5,viewport.Y*.5)
    task.wait(.12)
  end
  inputKey(Enum.KeyCode.Tab,false)
  task.wait(.28)
  if not found then log(term..' not found in inventory') end
  return found
end
local function equipNamedItem(names,token)
  if type(names)=='string' then names={names} end
  for _,name in ipairs(names) do
    if inspectWheelFor(name,true,token) then return true end
  end
  return false
end
local function equipAmulet(token)
  local ok=equipNamedItem({'Speakers Amulet',"Speaker's Amulet"},token)
  if ok then state.amuletHeld=true;report('phase','speaker_equipped',0,'',false) end
  return ok
end
local function attemptE(token,seconds)
  return tap(Enum.KeyCode.E,token,seconds or .22)
end
local function skipDialogue(token,times)
  local view=(workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize) or Vector2.new(900,600)
  for i=1,times do
    if not valid(token) then return end
    vclick(view.X*.33,view.Y*.17)
    task.wait(.28)
  end
end
local function beginMission(token)
  if not attemptE(token) then return false end
  task.wait(.8)
  if not tap(Enum.KeyCode.One,token) then return false end
  skipDialogue(token,9)
  for i=1,25 do if not valid(token) then return false end;task.wait(.2) end
  if not tap(Enum.KeyCode.One,token) then return false end
  skipDialogue(token,3)
  state.missionStarted=true;checkpoint()
  report('phase','quest_accepted',0,'Quest dialogue completed',false)
  return true
end
local function pickupSpeaker(token)
  if not attemptE(token,.30) then return false end
  task.wait(.7)
  report('phase','speaker_pickup',0,'E pickup attempted',false)
  return equipAmulet(token)
end
local function talkGhost(token,i)
  if not equipAmulet(token) then return false,'Speaker missing' end
  task.wait(.2)
  if not attemptE(token) then return false,'E input could not be sent' end
  task.wait(.8)
  local dialogSeen=visibleText('Nevermind')
  if not tap(Enum.KeyCode.Three,token) then return false,'Nevermind input could not be sent' end
  task.wait(.45)
  state.attemptedGhost=math.max(state.attemptedGhost,i)
  report('ghost_attempted','ghost_dialogue',i,dialogSeen and 'Nevermind option seen' or 'Dialogue unverified',false)
  if dialogSeen then
    state.confirmedGhost=math.max(state.confirmedGhost,i)
    -- A visible dialogue confirms the interaction UI, not a server quest counter.
  end
  checkpoint()
  return true,dialogSeen and 'dialogue seen' or 'dialogue unverified'
end
local function collectKey(token)
  if not attemptE(token) then return false end
  task.wait(.75)
  if not tap(Enum.KeyCode.One,token) then return false end
  task.wait(.6)
  if not attemptE(token,3.0) then return false end
  report('key_pickup_attempted','key_check',9,'E pickup attempted',false)
  task.wait(.6)
  if inspectWheelFor('Skeleton Key',false,token) then
    state.questCompleted=true;state.confirmedGhost=9;checkpoint()
    report('key_verified','key_check',9,'inventory_ui',true)
    log('Skeleton Key detected. Quest complete.')
    return true
  end
  log('Skeleton Key not found. Check inventory.')
  return false
end
local function clickHideout()
  local gui=player.PlayerGui
  for _,obj in ipairs(gui:GetDescendants()) do
    if obj:IsA('TextButton') and labelVisible(obj) and obj.Text and obj.Text:lower():find('hideout',1,true) then
      local xy=obj.AbsolutePosition+obj.AbsoluteSize*.5
      if vclick(xy.X,xy.Y) then return true end
    end
  end
  return false
end
local function waitRespawn(token)
  report('death','respawning',state.confirmedGhost,'Character died; waiting to respawn',false)
  stopMotion();state.amuletHeld=false
  for i=1,35 do if not valid(token) then return false end;task.wait(.2) end -- ≥7 seconds
  clickHideout()
  for i=1,160 do
    if not valid(token) then return false end
    if characterAlive() then task.wait(1);state.died=false;report('respawn','reacquire_speaker',state.confirmedGhost,'',false);return true end
    if i%25==0 then clickHideout() end
    task.wait(.5)
  end
  report('error','respawning',state.confirmedGhost,'Respawn not detected in 80 seconds',false)
  return false
end
local function pause(token,what)
  return waitUntilActive(token)
end
local function recoverIfDead(token)
  if not state.died and characterAlive() then return true end
  if not waitRespawn(token) then return false end
  while valid(token) do
    if not speakerDestinationValid() then return false end
    local reached,why=flyTo(route.speaker,token,'reacquire_speaker',state.confirmedGhost)
    if not reached then if why=='death' then if not waitRespawn(token) then return false end else return false end
    else
      if pickupSpeaker(token) then report('recovered','speaker_equipped',state.confirmedGhost,'Amulet reacquired after death',false);return true end
      report('error','reacquire_speaker',state.confirmedGhost,'Unable to reacquire amulet',false)
      task.wait(2)
    end
  end
  return false
end
local function doStage(token,target,phase,ghost,action)
  while valid(token) do
    if not waitUntilActive(token) then return false end
    if not recoverIfDead(token) then return false end
    local reached,why=flyTo(target,token,phase,ghost)
    if not reached and why=='death' then
      if not recoverIfDead(token) then return false end
    elseif not reached then return false
    else
      if not valid(token) then return false end
      local ok,reason=action()
      if ok then return pause(token,phase) end
      if reason=='Speaker missing' then
        report('phase','reacquire_speaker',state.confirmedGhost,'Equipping failed. Returning for item.',false)
        if not speakerDestinationValid() then return false end
        local back,backReason=flyTo(route.speaker,token,'reacquire_speaker',state.confirmedGhost)
        if back and pickupSpeaker(token) then
          report('recovered','speaker_equipped',state.confirmedGhost,'Speaker reacquired',false)
        elseif backReason=='death' then
          if not recoverIfDead(token) then return false end
        else
          report('error','reacquire_speaker',state.confirmedGhost,'Could not recover required item',false)
        end
      end
      state.retries=state.retries+1
      report('error',phase,ghost,reason or ('Interaction failed: '..phase),false)
      log('Retrying '..phase..' after interaction failure')
      task.wait(math.min(8,1+state.retries))
    end
  end
  return false
end
local function startQuest()
  if state.running then return end
  if state.questCompleted then log('Quest already completed') return end
  if not state.tutorialReady then log('Finish the bank tutorial first') return end
  if not VirtualInputManager then log('Virtual input unavailable') return end
  state.running=true;state.stopping=false;state.paused=false;state.died=false;state.token=state.token+1
  local token=state.token
  task.spawn(function()
    syncExisting()
    if state.questCompleted then state.running=false;log('Tracker says quest completed. Skipping.');return end
    report('start','main_ghost',0,'',false)
    local ok,err=pcall(function()
      if not state.missionStarted then
        if not doStage(token,route.main,'main_ghost',0,function() return beginMission(token) end) then return end
      end
      if not speakerDestinationValid() then return end
      if not doStage(token,route.speaker,'speaker_pickup',0,function() return pickupSpeaker(token) end) then return end
      local i=math.max(1,state.confirmedGhost+1)
      while valid(token) and i<=9 do
        if not doStage(token,route.ghosts[i],'ghost_travel',i,function()
          return talkGhost(token,i)
        end) then return end
        if state.confirmedGhost<i then
          report('error','ghost_dialogue',i,'Dialogue attempted; cannot verify Nevermind UI. Waiting/retrying ghost.',false)
          task.wait(1.4)
        else i=i+1 end
      end
      if valid(token) then
        if not doStage(token,route.main,'return_main',9,function() return collectKey(token) end) then return end
      end
    end)
    if not ok then report('error',state.phase,state.confirmedGhost,tostring(err):sub(1,220),false);log('Quest interrupted: '..tostring(err)) end
    if state.token==token then
      state.running=false;state.awaiting=false;stopMotion()
      if not state.questCompleted then log(state.routeError~='' and state.routeError or 'Progress saved. Check quest status.') end
    end
  end)
end
local function attachDeath(ch)
  local hum=ch:FindFirstChildOfClass('Humanoid') or ch:WaitForChild('Humanoid',12)
  if not hum then return end
  table.insert(state.connected,hum.Died:Connect(function()
    state.died=true;state.amuletHeld=false;stopMotion();log('Died; recovery will begin after respawn')
  end))
end
if player.Character then attachDeath(player.Character) end
table.insert(state.connected,player.CharacterAdded:Connect(function(ch)
  attachDeath(ch)
end))

task.spawn(function()
  while not state.closed do
    task.wait(25)
    if state.running and isListed then report('heartbeat',state.phase,state.confirmedGhost,'',false) end
    if isListed and #outbox>0 then flushOutbox() end
  end
end)


local sessionStarted=os.clock()
local function setPaused(paused)
  if not state.running then log('No quest running');return end
  state.paused=paused
  if paused then
    stopMotion()
    report('pause',state.phase,state.confirmedGhost,'',false)
    log('Paused')
  else
    report('recovered',state.phase,state.confirmedGhost,'Resumed',false)
    log('Resumed')
  end
end
local TweenService = game:GetService('TweenService')
local C = {
  canvas=Color3.fromRGB(31,23,29), side=Color3.fromRGB(41,29,37),
  surface=Color3.fromRGB(53,37,46), raised=Color3.fromRGB(67,46,56),
  darker=Color3.fromRGB(44,31,39), border=Color3.fromRGB(122,84,98),
  accent=Color3.fromRGB(144,59,81), bright=Color3.fromRGB(166,79,98),
  active=Color3.fromRGB(101,51,68), text=Color3.fromRGB(255,247,248),
  muted=Color3.fromRGB(223,196,205), dim=Color3.fromRGB(185,152,164),
  success=Color3.fromRGB(232,174,189), shadow=Color3.fromRGB(11,8,11)
}
local WIDTH, HEIGHT, SIDE, CONTENT_X, CONTENT_W = 820, 548, 203, 223, 576
local function animate(obj, duration, values, easing)
  if not obj or not obj.Parent then return nil end
  local t=TweenService:Create(obj,TweenInfo.new(duration or .18,easing or Enum.EasingStyle.Quad,Enum.EasingDirection.Out),values)
  t:Play()
  return t
end
local function corner(obj, radius)
  local c=Instance.new('UICorner');c.CornerRadius=UDim.new(0,radius or 10);c.Parent=obj
end
local function stroke(obj, color, alpha, thick)
  local s=Instance.new('UIStroke');s.Color=color or C.border;s.Transparency=alpha or .62;s.Thickness=thick or 1;s.Parent=obj
end
local function gradient(obj,a,b,rot)
  local g=Instance.new('UIGradient');g.Color=ColorSequence.new(a,b);g.Rotation=rot or 90;g.Parent=obj
end
local function panel(parent,name,x,y,w,h,color,r)
  local f=Instance.new('Frame');f.Name=name;f.BorderSizePixel=0
  f.Position=UDim2.fromOffset(x,y);f.Size=UDim2.fromOffset(w,h)
  f.BackgroundColor3=color or C.surface;f.Parent=parent
  if (r or 0)>0 then corner(f,r) end
  return f
end
local function text(parent,value,x,y,w,h,fontSize,color,weight)
  local o=Instance.new('TextLabel');o.BackgroundTransparency=1;o.BorderSizePixel=0
  o.Position=UDim2.fromOffset(x,y);o.Size=UDim2.fromOffset(w,h)
  o.Font=weight=='bold' and Enum.Font.GothamBold or weight=='medium' and Enum.Font.GothamMedium or Enum.Font.Gotham
  o.Text=value;o.TextSize=fontSize or 12;o.TextColor3=color or C.text
  o.TextXAlignment=Enum.TextXAlignment.Left;o.TextYAlignment=Enum.TextYAlignment.Center
  o.TextTruncate=Enum.TextTruncate.AtEnd;o.Parent=parent
  return o
end
local function action(parent,caption,x,y,w,h,fn,variant)
  local b=Instance.new('TextButton');b.Name='Button';b.BorderSizePixel=0;b.AutoButtonColor=false
  b.Position=UDim2.fromOffset(x,y);b.Size=UDim2.fromOffset(w,h)
  local initial=variant=='primary' and C.accent or variant=='quiet' and C.darker or C.raised
  b.BackgroundColor3=initial;b.Text=caption;b.TextSize=12;b.Font=Enum.Font.GothamMedium
  b.TextColor3=C.text;b.Parent=parent;corner(b,9)
  if variant=='primary' then stroke(b,C.bright,.25,1); b.TextColor3=Color3.fromRGB(255,255,255); b.TextStrokeTransparency=.85 end
  local sc=Instance.new('UIScale');sc.Parent=b
  table.insert(state.connected,b.MouseEnter:Connect(function()
    animate(b,.15,{BackgroundColor3=(variant=='primary' or b:GetAttribute('Selected')) and C.bright or C.active})
  end))
  table.insert(state.connected,b.MouseLeave:Connect(function()
    animate(b,.2,{BackgroundColor3=b:GetAttribute('Selected') and C.accent or initial})
  end))
  table.insert(state.connected,b.MouseButton1Down:Connect(function()animate(sc,.09,{Scale=.976}) end))
  table.insert(state.connected,b.MouseButton1Up:Connect(function()animate(sc,.12,{Scale=1}) end))
  if fn then table.insert(state.connected,b.Activated:Connect(function()
    animate(sc,.13,{Scale=1});fn()
  end)) end
  return b
end
local function card(parent,name,x,y,w,h,subtle)
  local f=panel(parent,name,x,y,w,h,subtle and C.darker or C.surface,11)
  stroke(f,C.border,.74)
  return f
end
local function twoColItem(parent,k,v,y)
  text(parent,k,17,y,230,24,12,C.muted)
  local val=text(parent,v,257,y,267,24,12,C.text,'medium')
  val.TextXAlignment=Enum.TextXAlignment.Right
  return val
end
local function sectionTitle(parent,title,desc)
  text(parent,title,1,0,540,35,25,C.text,'bold')
  text(parent,desc,2,34,540,20,11,C.muted)
end
local function smallHeading(parent,title,x,y)
  return text(parent,title,x,y,385,18,10,C.muted,'bold')
end
local function input(parent,caption,y,value,placeholder,cb,password)
  smallHeading(parent,caption,18,y)
  local field=Instance.new('TextBox');field.Name='Input';field.ClearTextOnFocus=false
  field.Position=UDim2.fromOffset(18,y+22);field.Size=UDim2.fromOffset(500,40)
  field.BorderSizePixel=0;field.BackgroundColor3=C.darker;field.TextColor3=C.text
  field.Font=Enum.Font.Gotham;field.TextSize=12;field.TextXAlignment=Enum.TextXAlignment.Left
  field.PlaceholderText=placeholder;field.PlaceholderColor3=C.dim
  field.Text=password and '' or (value or '');field.Parent=parent;corner(field,8);stroke(field,C.border,.7)
  local pad=Instance.new('UIPadding');pad.PaddingLeft=UDim.new(0,11);pad.PaddingRight=UDim.new(0,11);pad.Parent=field
  table.insert(state.connected,field.Focused:Connect(function()animate(field,.15,{BackgroundColor3=C.raised}) end))
  table.insert(state.connected,field.FocusLost:Connect(function()
    animate(field,.15,{BackgroundColor3=C.darker})
    if not password or #field.Text>0 then cb(field.Text) end
    if password then field.Text='' end
  end))
  return field
end
-- Replace the previous edition when a new edition loads.
for _,name in ipairs({'REDLINEv7UI','REDLINEv8UI','REDLINEv9UI','REDLINEv10UI','WANTEDHubV6UI'}) do
  local old=player.PlayerGui:FindFirstChild(name)
  if old then old:Destroy() end
end
local gui=Instance.new('ScreenGui');gui.Name='REDLINEv10UI';gui.ResetOnSpawn=false
-- Ignore the default HUD inset to keep the window centered on desktop and cloud phones.
gui.IgnoreGuiInset=true;gui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;gui.Parent=player.PlayerGui
state.gui=gui
local shadow=panel(gui,'DropShadow',0,0,WIDTH+14,HEIGHT+14,C.shadow,18)
shadow.BackgroundTransparency=.48;shadow.AnchorPoint=Vector2.new(.5,.5)
shadow.Position=UDim2.fromScale(.5,.5)
local main=panel(gui,'REDLINE',0,0,WIDTH,HEIGHT,C.canvas,17)
main.AnchorPoint=Vector2.new(.5,.5);main.Position=UDim2.fromScale(.5,.5)
main.ClipsDescendants=true;stroke(main,Color3.fromRGB(128,71,89),.27)
gradient(main,Color3.fromRGB(41,28,37),C.canvas,90)
local scale=Instance.new('UIScale');scale.Parent=main;state.scale=scale
local dropScale=Instance.new('UIScale');dropScale.Parent=shadow
local sidebar=panel(main,'Sidebar',0,0,SIDE,HEIGHT,C.side)
gradient(sidebar,Color3.fromRGB(49,33,44),C.side,90)
local sideLine=panel(sidebar,'Divider',SIDE-1,0,1,HEIGHT,C.border)
sideLine.BackgroundTransparency=.52
local brand=panel(sidebar,'Brand',0,0,SIDE,113,C.side)
brand.BackgroundTransparency=1
panel(brand,'Mark',19,29,4,48,C.bright,2)
text(brand,'REDLINE',34,23,165,33,24,C.text,'bold')
text(brand,'BY RAHAMIDALI',35,58,158,19,9,C.success,'bold')
local brandLine=panel(brand,'Rule',35,85,76,2,C.accent,1)
text(sidebar,'NAVIGATION',18,116,168,22,9,C.dim,'bold')
local nav=Instance.new('ScrollingFrame');nav.Name='Navigation';nav.BackgroundTransparency=1
nav.BorderSizePixel=0;nav.Position=UDim2.fromOffset(12,145)
nav.Size=UDim2.fromOffset(SIDE-24,HEIGHT-215)
nav.CanvasSize=UDim2.fromOffset(0,0);nav.AutomaticCanvasSize=Enum.AutomaticSize.Y
nav.ScrollingDirection=Enum.ScrollingDirection.Y;nav.ScrollBarThickness=2
nav.ScrollBarImageColor3=C.border;nav.Parent=sidebar
local navList=Instance.new('UIListLayout');navList.SortOrder=Enum.SortOrder.LayoutOrder
navList.Padding=UDim.new(0,6);navList.Parent=nav
local credit=panel(sidebar,'Credit',13,HEIGHT-63,SIDE-27,48,C.raised,8)
text(credit,'R  /  RAHAMIDALI',12,6,155,19,10,C.text,'bold')
text(credit,'REDLINE  ·  WANTED',12,24,154,15,9,C.dim)
local header=panel(main,'Topbar',CONTENT_X,12,CONTENT_W,56,C.canvas)
header.BackgroundTransparency=1
ui.headerTitle=text(header,'Home',2,0,355,27,17,C.text,'bold')
ui.headerSub=text(header,'Overview',2,26,355,22,10,C.dim)
local divider=panel(main,'TopDivider',CONTENT_X,77,CONTENT_W,1,C.border)
divider.BackgroundTransparency=.6
local versionBadge=panel(header,'Version',422,7,59,29,C.active,8)
text(versionBadge,'v10.0',0,0,59,29,11,C.text,'bold').TextXAlignment=Enum.TextXAlignment.Center
local minus=action(header,'—',489,7,34,29,function()
  main.Visible=false;shadow.Visible=false;ui.reopen.Visible=true
end,'quiet')
local close=action(header,'×',531,7,34,29,function() if state.close then state.close()end end,'quiet')
-- The titlebar, not the whole window, is the drag handle.
local handle=Instance.new('TextButton');handle.Name='DragTitlebar';handle.Text=''
handle.BackgroundTransparency=1;handle.BorderSizePixel=0;handle.Active=true
handle.Position=UDim2.fromOffset(0,0);handle.Size=UDim2.fromOffset(405,55);handle.Parent=header
local dragging=false;local dragStart;local dragWindow;local dragInput
local function clampPosition(proposed)
  -- Deliberately unrestricted: users can move REDLINE beyond the game viewport.
  return proposed
end
local function resetWindow()
  main.Position=UDim2.fromScale(.5,.5);shadow.Position=main.Position
  if ui.reopen then ui.reopen.Position=UDim2.fromOffset(18,94) end
end
table.insert(state.connected,handle.InputBegan:Connect(function(input_)
  if input_.UserInputType~=Enum.UserInputType.MouseButton1 and input_.UserInputType~=Enum.UserInputType.Touch then return end
  dragging=true;dragStart=input_.Position;dragWindow=main.Position;dragInput=input_
  local done
  done=input_.Changed:Connect(function()
    if input_.UserInputState==Enum.UserInputState.End then
      dragging=false
      if done then done:Disconnect() end
    end
  end)
  table.insert(state.connected,done)
end))
table.insert(state.connected,handle.InputChanged:Connect(function(input_)
  if input_.UserInputType==Enum.UserInputType.MouseMovement or input_.UserInputType==Enum.UserInputType.Touch then
    dragInput=input_
  end
end))
table.insert(state.connected,UserInputService.InputChanged:Connect(function(input_)
  if not dragging or not dragStart then return end
  if input_.UserInputType~=Enum.UserInputType.MouseMovement and input_~=dragInput then return end
  local diff=input_.Position-dragStart
  main.Position=clampPosition(UDim2.new(dragWindow.X.Scale,dragWindow.X.Offset+diff.X,dragWindow.Y.Scale,dragWindow.Y.Offset+diff.Y))
  shadow.Position=main.Position
end))
local reopenMoved=false
ui.reopen=action(gui,'REDLINE   •   OPEN',18,94,155,40,function()
  if reopenMoved then reopenMoved=false;return end
  main.Visible=true;shadow.Visible=true;ui.reopen.Visible=false
  local factor=state.targetScale or 1;scale.Scale=factor*.93
  animate(scale,.23,{Scale=factor},Enum.EasingStyle.Quart)
end,'quiet');ui.reopen.Visible=false
stroke(ui.reopen,C.bright,.48,1)
local draggingTab=false;local tabStart;local tabBase
local function stopTabDrag()
  draggingTab=false
  if reopenMoved then task.delay(.18,function() reopenMoved=false end) end
end
table.insert(state.connected,ui.reopen.InputBegan:Connect(function(inp)
  if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then
    draggingTab=true;tabStart=inp.Position;tabBase=ui.reopen.Position;reopenMoved=false
  end
end))
table.insert(state.connected,UserInputService.InputChanged:Connect(function(inp)
  if not draggingTab or not tabStart then return end
  if inp.UserInputType~=Enum.UserInputType.MouseMovement and inp.UserInputType~=Enum.UserInputType.Touch then return end
  local diff=inp.Position-tabStart
  if diff.Magnitude>7 then reopenMoved=true end
  if reopenMoved then
    ui.reopen.Position=UDim2.new(tabBase.X.Scale,tabBase.X.Offset+diff.X,tabBase.Y.Scale,tabBase.Y.Offset+diff.Y)
  end
end))
table.insert(state.connected,UserInputService.InputEnded:Connect(function(inp)
  if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then stopTabDrag() end
end))
local footer=panel(main,'Footer',CONTENT_X,HEIGHT-43,CONTENT_W,28,C.darker,8)
stroke(footer,C.border,.77)
local statusDot=panel(footer,'Dot',12,10,7,7,C.dim,4)
text(footer,'STATUS',27,0,52,28,9,C.muted,'bold')
ui.status=text(footer,'Ready',83,0,CONTENT_W-98,28,10,C.text)
local pages={}
for _,name in ipairs({'home','skeleton','general','movement','tracker'}) do
  local pg=Instance.new('CanvasGroup');pg.Name=name
  pg.Position=UDim2.fromOffset(CONTENT_X,95);pg.Size=UDim2.fromOffset(CONTENT_W,HEIGHT-149)
  pg.BackgroundTransparency=1;pg.BorderSizePixel=0;pg.Visible=false;pg.GroupTransparency=1
  pg.Parent=main;pages[name]=pg
end
local labels={home={'Home','Current session'},skeleton={'Skeleton Key','Events  /  Skeleton Key'},
 general={'General','Settings  /  General'},movement={'Movement','Settings  /  Movement'},
 tracker={'Tracker','Settings  /  Tracker'}}
local navButtons={}
local groups={}
local function navButton(parent,name,x,y,w,h,pageId,sub)
  local b=Instance.new('TextButton');b.Name=name;b.Text='';b.BorderSizePixel=0
  b.AutoButtonColor=false;b.BackgroundTransparency=1;b.BackgroundColor3=C.active
  b.Position=UDim2.fromOffset(x,y);b.Size=UDim2.fromOffset(w,h);b.Parent=parent;corner(b,7)
  local inset=sub and 18 or 14
  local ind=panel(b,'Indicator',0,sub and 6 or 7,3,h-(sub and 12 or 14),C.bright,2)
  ind.Visible=false
  local caption=text(b,name,inset,0,w-inset-8,h,sub and 11 or 13,sub and C.muted or C.text,sub and nil or 'medium')
  navButtons[pageId]={b=b,label=caption,ind=ind,sub=sub}
  table.insert(state.connected,b.MouseEnter:Connect(function()
    if state.selectedPage~=pageId then animate(b,.14,{BackgroundTransparency=.64})end
  end))
  table.insert(state.connected,b.MouseLeave:Connect(function()
    if state.selectedPage~=pageId then animate(b,.14,{BackgroundTransparency=1})end
  end))
  return b
end
local function selectNav(id)
  for name,item in pairs(navButtons) do
    local selected=name==id
    item.ind.Visible=selected
    animate(item.b,.17,{BackgroundTransparency=selected and .08 or 1})
    item.label.TextColor3=selected and C.text or (item.sub and C.muted or C.text)
  end
end
local showPage
showPage=function(id)
  if not pages[id] then return end
  state.selectedPage=id
  for name,pg in pairs(pages) do
    if name~=id then pg.Visible=false;pg.GroupTransparency=1 end
  end
  local pg=pages[id]
  pg.Position=UDim2.fromOffset(CONTENT_X+9,95);pg.GroupTransparency=1;pg.Visible=true
  animate(pg,.23,{Position=UDim2.fromOffset(CONTENT_X,95),GroupTransparency=0},Enum.EasingStyle.Quart)
  ui.headerTitle.Text=labels[id][1];ui.headerSub.Text=labels[id][2]
  selectNav(id)
end
local homeSlot=panel(nav,'HomeRow',0,0,176,42,C.side)
homeSlot.BackgroundTransparency=1;homeSlot.LayoutOrder=1
local homeNav=navButton(homeSlot,'Home',0,2,174,37,'home',false)
table.insert(state.connected,homeNav.Activated:Connect(function()showPage('home') end))
local function addGroup(name,order,items)
  local outer=panel(nav,name,0,0,176,43,C.side);outer.BackgroundTransparency=1;outer.LayoutOrder=order
  local hdr=Instance.new('TextButton');hdr.Text='';hdr.AutoButtonColor=false;hdr.BorderSizePixel=0
  hdr.BackgroundTransparency=1;hdr.BackgroundColor3=C.active
  hdr.Size=UDim2.fromOffset(174,38);hdr.Parent=outer;corner(hdr,7)
  text(hdr,name,14,0,126,38,13,C.text,'medium')
  local arrow=text(hdr,'›',149,0,18,38,18,C.muted,'medium')
  local children=panel(outer,'Submenu',0,41,176,0,C.side)
  children.BackgroundTransparency=1;children.ClipsDescendants=true
  for i,v in ipairs(items) do
    local b=navButton(children,v[1],13,(i-1)*34,160,29,v[2],true)
    table.insert(state.connected,b.Activated:Connect(function()showPage(v[2]) end))
  end
  local total=#items*34+4
  groups[name]={outer=outer,sub=children,arrow=arrow,total=total,opened=false}
  table.insert(state.connected,hdr.Activated:Connect(function()
    local g=groups[name]
    g.opened=not g.opened
    animate(g.sub,.2,{Size=UDim2.fromOffset(176,g.opened and g.total or 0)},Enum.EasingStyle.Quart)
    animate(g.outer,.2,{Size=UDim2.fromOffset(176,43+(g.opened and g.total or 0))},Enum.EasingStyle.Quart)
    animate(g.arrow,.2,{Rotation=g.opened and 90 or 0},Enum.EasingStyle.Quart)
    animate(hdr,.16,{BackgroundTransparency=g.opened and .65 or 1})
  end))
end
addGroup('Events',2,{{'Skeleton Key','skeleton'}})
addGroup('Settings',3,{{'General','general'},{'Movement','movement'},{'Tracker','tracker'}})
-- Open the relevant menu when someone switches pages.
local showPageOriginal=showPage
showPage=function(id)
  if id=='skeleton' and not groups.Events.opened then groups.Events.opened=true
    groups.Events.sub.Size=UDim2.fromOffset(176,groups.Events.total)
    groups.Events.outer.Size=UDim2.fromOffset(176,43+groups.Events.total)
    groups.Events.arrow.Rotation=90
  end
  if (id=='general' or id=='movement' or id=='tracker') and not groups.Settings.opened then
    groups.Settings.opened=true
    groups.Settings.sub.Size=UDim2.fromOffset(176,groups.Settings.total)
    groups.Settings.outer.Size=UDim2.fromOffset(176,43+groups.Settings.total)
    groups.Settings.arrow.Rotation=90
  end
  showPageOriginal(id)
end
-- HOME: account identity + session, with no quest or event controls.
local home=pages.home
sectionTitle(home,'Dashboard','Account and session overview')
local acct=card(home,'Account',1,58,555,114)
smallHeading(acct,'CURRENT ACCOUNT',19,15)
text(acct,'@'..player.Name,19,35,380,35,22,C.text,'bold')
text(acct,'USER ID  '..tostring(player.UserId),19,77,385,18,10,C.dim)
local accountTag=panel(acct,'AccountTag',420,27,116,28,C.active,7)
text(accountTag,isListed and 'LISTED' or 'NOT LISTED',0,0,116,28,10,C.text,'bold').TextXAlignment=Enum.TextXAlignment.Center
local gameC=card(home,'Game',1,184,271,94)
smallHeading(gameC,'GAME',16,12)
text(gameC,'WANTED',16,34,237,26,18,C.text,'bold')
text(gameC,'PLACE  '..tostring(game.PlaceId),16,67,238,17,10,C.dim)
local buildC=card(home,'Build',284,184,272,94)
smallHeading(buildC,'VERSION',16,12)
text(buildC,'REDLINE v10.0',16,34,241,26,18,C.text,'bold')
text(buildC,'RAHAMIDALI',16,67,242,17,10,C.dim)
local sessionC=card(home,'Session',1,289,555,97)
smallHeading(sessionC,'SESSION',17,9)
ui.homeRuntime=twoColItem(sessionC,'Uptime','00:00:00',30)
ui.homeSync=twoColItem(sessionC,'Tracker','Not configured',59)
-- EVENTS: only the quest. Equipment and death recovery are internal, not UI pages.
local event=pages.skeleton
sectionTitle(event,'Skeleton Key','Complete the one-time ghost quest.')
local quest=card(event,'Quest',1,58,555,204)
smallHeading(quest,'QUEST STATUS',17,13)
ui.questStatus=text(quest,'Idle',365,8,172,27,12,C.text,'bold');ui.questStatus.TextXAlignment=Enum.TextXAlignment.Right
ui.questStep=twoColItem(quest,'Current step','Waiting',48)
ui.questCount=twoColItem(quest,'Ghosts','0 / 9',83)
smallHeading(quest,'PROGRESS',17,128)
local rail=panel(quest,'Rail',17,158,521,9,C.raised,5)
ui.progressFill=panel(rail,'Fill',0,0,0,9,C.accent,5)
text(quest,'Automatically saves progress',17,176,520,20,10,C.dim)
ui.start=action(event,'START QUEST',1,276,555,49,startQuest,'primary')
ui.pause=action(event,'PAUSE',1,336,269,43,function()setPaused(not state.paused)end)
action(event,'STOP',287,336,269,43,stop)
-- SETTINGS: only things you can actually change.
local gen=pages.general
sectionTitle(gen,'General','A few essentials.')
local general=card(gen,'GeneralControls',1,58,555,200)
smallHeading(general,'TUTORIAL STATUS',18,14)
text(general,'Mark complete after finishing the bank tutorial.',18,39,516,32,12,C.muted)
ui.tutorial=action(general,'TUTORIAL FINISHED  /  '..(state.tutorialReady and 'YES' or 'NO'),18,92,519,47,function()
  state.tutorialReady=not state.tutorialReady;checkpoint()
  ui.tutorial.Text='TUTORIAL FINISHED  /  '..(state.tutorialReady and 'YES' or 'NO')
  log(state.tutorialReady and 'Tutorial marked complete' or 'Tutorial marked incomplete')
end,'primary')
text(general,'Temporary until tutorial automation is added.',18,152,519,23,10,C.dim)
local reset=card(gen,'WindowPosition',1,271,555,107)
text(reset,'WINDOW POSITION',17,11,280,22,11,C.text,'bold')
text(reset,'Move the window back to the middle of the screen.',17,36,521,20,11,C.muted)
action(reset,'CENTER WINDOW',17,64,520,33,resetWindow)
local mov=pages.movement
sectionTitle(mov,'Movement','Set the speed that works in-game.')
local speedCard=card(mov,'Speed',1,58,555,147)
smallHeading(speedCard,'FLIGHT SPEED',18,14)
text(speedCard,'Velocity',18,37,233,23,13,C.text,'medium')
ui.speedText=text(speedCard,tostring(state.speed)..' studs/s',314,37,222,23,13,C.text,'bold')
ui.speedText.TextXAlignment=Enum.TextXAlignment.Right
local speedBtns={}
for i,v in ipairs(speedOptions) do
  local b=action(speedCard,tostring(v),18+(i-1)*175,83,167,42,function()
    if state.running then log('Stop the quest before changing speed');return end
    state.speed=v;saveSettings();ui.speedText.Text=tostring(v)..' studs/s'
    for j,item in ipairs(speedBtns) do
      item:SetAttribute('Selected',j==i)
      animate(item,.16,{BackgroundColor3=j==i and C.accent or C.raised})
    end
  end,'normal')
  b:SetAttribute('Selected',v==state.speed)
  b.BackgroundColor3=v==state.speed and C.accent or C.raised
  speedBtns[i]=b
end
local noclipCard=card(mov,'Noclip',1,217,555,145)
text(noclipCard,'NOCLIP',18,15,285,25,12,C.text,'bold')
text(noclipCard,'Pass through obstacles while traveling.',18,39,490,25,11,C.muted)
ui.noclipToggle=action(noclipCard,'NOCLIP  /  '..(state.noclip and 'ON' or 'OFF'),18,85,519,43,function()
  if state.running then log('Stop the quest before changing noclip');return end
  state.noclip=not state.noclip;saveSettings()
  ui.noclipToggle.Text='NOCLIP  /  '..(state.noclip and 'ON' or 'OFF')
end,state.noclip and 'primary' or 'normal')
-- Tracker connection is optional for running a local quest; the tracker lives outside Roblox.
local tracker=pages.tracker
sectionTitle(tracker,'Tracker','Connect to your external dashboard.')
local trackerCard=card(tracker,'TrackerSettings',1,58,555,324)
input(trackerCard,'TRACKER URL',17,state.url,'https://your-tracker.example',function(v)
  state.url=v:gsub('%s+','');saveSettings();log('Tracker URL saved')
end,false)
input(trackerCard,'ACCESS TOKEN',103,'','Paste your private access token',function(v)
  state.ingest=v:gsub('%s+','');saveSettings();log('Access token saved locally')
end,true)
action(trackerCard,'TEST CONNECTION',18,191,519,46,function()
  log('Connecting to tracker...')
  task.spawn(function()
    local result,err=http('GET','/api/account/'..player.Name)
    if result then log(result.tracked and 'Tracker connected' or 'Account not listed')
    else log('Connection failed: '..tostring(err)) end
  end)
end,'primary')
text(trackerCard,'You can use the quest without connecting a tracker.',18,260,520,18,11,C.muted)
text(trackerCard,'Keep access tokens private.',18,282,520,18,10,C.dim)
-- Compact startup card. Opens first as a small brand card and expands into the dashboard.
local intro=panel(gui,'IntroCard',0,0,352,152,C.side,15)
intro.AnchorPoint=Vector2.new(.5,.5);intro.Position=UDim2.fromScale(.5,.5)
stroke(intro,C.border,.32,1)
gradient(intro,Color3.fromRGB(56,36,46),C.side,20)
local introMark=panel(intro,'Accent',17,24,3,58,C.accent,2)
local introTitle=text(intro,'REDLINE',34,20,240,38,27,C.text,'bold')
local introSub=text(intro,'BY RAHAMIDALI',35,56,245,18,10,C.success,'medium')
local introVersion=panel(intro,'VersionBadge',277,24,57,26,C.active,7)
text(introVersion,'v10.0',0,0,57,26,10,C.text,'bold').TextXAlignment=Enum.TextXAlignment.Center
local introRail=panel(intro,'Track',18,111,316,5,C.raised,3)
local introFill=panel(introRail,'Fill',0,0,1,5,C.accent,3)
local introStatus=text(intro,'INITIALIZING',18,88,260,20,10,C.muted,'medium')
local introScale=Instance.new('UIScale');introScale.Parent=intro
main.Visible=false;shadow.Visible=false
local function uptime(seconds)
  local n=math.max(0,math.floor(seconds))
  return ('%02d:%02d:%02d'):format(math.floor(n/3600),math.floor(n/60)%60,n%60)
end
local phaseLabels={waiting='Waiting',main_ghost='Main ghost',quest_accepted='Quest accepted',
 speaker_pickup='Picking up amulet',speaker_equipped='Amulet equipped',reacquire_speaker='Reacquiring amulet',
 ghost_travel='Traveling',ghost_dialogue='Talking',return_main='Returning to main ghost',
 key_check='Checking key',respawning='Respawning'}
task.spawn(function()
  while gui.Parent and not state.closed do
    ui.homeRuntime.Text=uptime(os.clock()-sessionStarted)
    ui.homeSync.Text=(not isListed) and 'Not listed' or (not safeUrl() or #state.ingest<32) and 'Not connected' or state.networkError~='' and 'Connection issue' or 'Configured'
    ui.questStatus.Text=state.questCompleted and 'Completed' or state.paused and 'Paused' or state.running and 'Running' or 'Idle'
    local stage=phaseLabels[state.phase] or tostring(state.phase)
    if state.phase=='ghost_travel' or state.phase=='ghost_dialogue' then
      stage=stage..' to Ghost '..tostring(math.min(9,state.confirmedGhost+1))
    end
    ui.questStep.Text=state.questCompleted and 'Complete' or stage
    ui.questCount.Text=tostring(state.confirmedGhost)..' / 9'
    animate(ui.progressFill,.3,{Size=UDim2.fromOffset(521*math.clamp(state.confirmedGhost/9,0,1),9)})
    ui.pause.Text=state.paused and 'RESUME' or 'PAUSE'
    ui.start.Text=state.questCompleted and 'QUEST COMPLETE' or 'START QUEST'
    statusDot.BackgroundColor3=state.running and C.bright or C.dim
    task.wait(.85)
  end
end)
local function rescale()
  local view=workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1200,720)
  local factor=math.min(1,math.max(.35,math.min((view.X-20)/WIDTH,(view.Y-20)/HEIGHT)))
  state.targetScale=factor
  scale.Scale=factor;dropScale.Scale=factor
  main.Position=clampPosition(main.Position);shadow.Position=main.Position
end
rescale()
local lastViewport
local resizeConn=RunService.RenderStepped:Connect(function()
  local current=workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1200,720)
  if current~=lastViewport then lastViewport=current;rescale()end
end)
table.insert(state.connected,resizeConn)
state.close=function()
  if state.closed then return end
  state.closed=true;stop()
  for _,conn in ipairs(state.connected) do pcall(function()conn:Disconnect()end)end
  if gui then gui:Destroy()end
end
showPage('home')
task.spawn(function()
  introScale.Scale=state.targetScale or 1
  animate(introFill,.7,{Size=UDim2.fromOffset(316,5)},Enum.EasingStyle.Quart)
  task.wait(.76)
  if state.closed or not intro.Parent then return end
  introStatus.Text='READY'
  animate(intro,.24,{Size=UDim2.fromOffset(WIDTH,HEIGHT)},Enum.EasingStyle.Quart)
  animate(introScale,.24,{Scale=state.targetScale or 1})
  animate(intro,.2,{BackgroundTransparency=.95})
  task.wait(.26)
  if state.closed then return end
  if intro.Parent then intro:Destroy() end
  -- Reveal the complete window in place; clipped during the unfolding transition.
  main.Size=UDim2.fromOffset(352,152)
  main.Visible=true;shadow.Visible=true
  animate(main,.3,{Size=UDim2.fromOffset(WIDTH,HEIGHT)},Enum.EasingStyle.Quart)
end)
task.spawn(function()syncExisting();if state.questCompleted then log('Quest already complete')end end)
log('REDLINE ready')
