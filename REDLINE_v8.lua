-- REDLINE | WANTED v8
-- Created by RahamidAli

local Players = game:GetService('Players')
local RunService = game:GetService('RunService')
local UserInputService = game:GetService('UserInputService')
local HttpService = game:GetService('HttpService')
local player = Players.LocalPlayer
if not player then return end
if game.PlaceId ~= 14438406081 then warn('[REDLINE] Unsupported game.'); return end

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
local speedOptions = {75,80,85}
local settingsFile = 'REDLINE_v8_settings.json'
local checkpointFile = 'REDLINE_v8_checkpoint_' .. tostring(player.UserId) .. '.json'
local queueFile = 'REDLINE_v8_outbox_' .. tostring(player.UserId) .. '.json'
local state = {
  running=false, stopping=false, awaiting=false, token=0, connected={}, noclipConn=nil, collisionOriginal={},
  speed=80, noclip=true, paused=false, pauseEach=false, tutorialReady=false, missionStarted=false, confirmedGhost=0,
  attemptedGhost=0, amuletHeld=false, questCompleted=false, selectedPage='home', phase='waiting',
  retries=0, session=HttpService:GenerateGUID(false), networkError='', checkpointStamp=0, died=false,
  url='', ingest='', status='Idle', history={},
}
_G.REDLINEHubV8=state
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
local configSaved=readFile(settingsFile) or readFile('REDLINE_v7_settings.json') or readFile('WANTED_v6_settings.json')
if configSaved then
  if tonumber(configSaved.speed) and table.find(speedOptions,configSaved.speed) then state.speed=configSaved.speed end
  -- Staged pauses from early builds are no longer enabled by default.
  if type(configSaved.tutorialReady)=='boolean' then state.tutorialReady=configSaved.tutorialReady end
  if type(configSaved.noclip)=='boolean' then state.noclip=configSaved.noclip end
  if type(configSaved.url)=='string' then state.url=configSaved.url end
  if type(configSaved.ingest)=='string' then state.ingest=configSaved.ingest end
end
local progress=readFile(checkpointFile) or readFile('REDLINE_v7_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('WANTED_v6_checkpoint_' .. tostring(player.UserId) .. '.json')
if progress then
  state.missionStarted=progress.missionStarted==true
  state.confirmedGhost=math.clamp(tonumber(progress.confirmedGhost) or 0,0,9)
  state.attemptedGhost=math.clamp(tonumber(progress.attemptedGhost) or 0,0,9)
  state.questCompleted=progress.questCompleted==true
end
local outbox=readFile(queueFile) or readFile('REDLINE_v7_outbox_' .. tostring(player.UserId) .. '.json') or readFile('WANTED_v6_outbox_' .. tostring(player.UserId) .. '.json') or {}
if type(outbox)~='table' then outbox={} end
local function saveSettings()
  saveFile(settingsFile,{speed=state.speed,noclip=state.noclip,tutorialReady=state.tutorialReady,url=state.url,ingest=state.ingest})
end
local function checkpoint()
  saveFile(checkpointFile,{missionStarted=state.missionStarted,confirmedGhost=state.confirmedGhost,
    attemptedGhost=state.attemptedGhost,questCompleted=state.questCompleted})
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
      log(('Retrying %s (%d) | %s'):format(phase,tries,reason~='' and reason or 'Not at destination'))
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
    if (obj:IsA('TextLabel') or obj:IsA('TextButton')) and labelVisible(obj) and (not _G.REDLINEHubV8.gui or not obj:IsDescendantOf(_G.REDLINEHubV8.gui)) then
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
      if not state.questCompleted then log('Progress saved. Check quest status.') end
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
local C={
  bg=Color3.fromRGB(26,13,20), side=Color3.fromRGB(36,18,27),
  panel=Color3.fromRGB(47,23,34), panelAlt=Color3.fromRGB(57,27,40),
  raised=Color3.fromRGB(70,32,48), border=Color3.fromRGB(98,49,66),
  highlight=Color3.fromRGB(117,36,62), accent=Color3.fromRGB(211,60,96),
  accentHover=Color3.fromRGB(234,78,114), text=Color3.fromRGB(255,242,245),
  muted=Color3.fromRGB(195,153,164), dim=Color3.fromRGB(157,113,128),
  danger=Color3.fromRGB(244,145,166), good=Color3.fromRGB(225,180,193)
}
local WIDTH, HEIGHT, SIDE, CONTENT_X, CONTENT_W = 858, 574, 216, 233, 607
local function tw(obj, seconds, props, style)
  local t=TweenService:Create(obj,TweenInfo.new(seconds or .2,style or Enum.EasingStyle.Quad,Enum.EasingDirection.Out),props)
  t:Play(); return t
end
local function corner(obj,r)
  local c=Instance.new('UICorner');c.CornerRadius=UDim.new(0,r or 9);c.Parent=obj;return c
end
local function stroke(obj,color,trans,width)
  local s=Instance.new('UIStroke');s.Color=color or C.border;s.Transparency=trans or .5;s.Thickness=width or 1;s.Parent=obj;return s
end
local function gradient(obj,c1,c2,rotation)
  local gr=Instance.new('UIGradient');gr.Color=ColorSequence.new(c1,c2);gr.Rotation=rotation or 90;gr.Parent=obj;return gr
end
local function box(parent,name,x,y,w,h,color,rad)
  local o=Instance.new('Frame');o.Name=name;o.Position=UDim2.fromOffset(x,y);o.Size=UDim2.fromOffset(w,h)
  o.BorderSizePixel=0;o.BackgroundColor3=color or C.panel;o.Parent=parent;corner(o,rad or 10)
  return o
end
local function label(parent,title,x,y,w,h,size,color,bold)
  local o=Instance.new('TextLabel');o.Name='Label';o.BackgroundTransparency=1
  o.Position=UDim2.fromOffset(x,y);o.Size=UDim2.fromOffset(w,h)
  o.Text=title;o.TextWrapped=false;o.TextTruncate=Enum.TextTruncate.AtEnd
  o.TextXAlignment=Enum.TextXAlignment.Left;o.TextYAlignment=Enum.TextYAlignment.Center
  o.Font=bold and Enum.Font.GothamBold or Enum.Font.Gotham
  o.TextColor3=color or C.text;o.TextSize=size or 12;o.Parent=parent
  return o
end
local function button(parent,title,x,y,w,h,onClick,primary,style)
  local o=Instance.new('TextButton');o.Name='Control';o.Position=UDim2.fromOffset(x,y);o.Size=UDim2.fromOffset(w,h)
  o.BorderSizePixel=0;o.AutoButtonColor=false
  local idle=primary and C.accent or C.raised
  o.BackgroundColor3=idle;o.TextColor3=C.text;o.TextSize=12
  o.Font=Enum.Font.GothamMedium;o.Text=title;o.Parent=parent;corner(o,8)
  if primary then gradient(o,C.accent,Color3.fromRGB(165,39,72),15) end
  local scale=Instance.new('UIScale');scale.Scale=1;scale.Parent=o
  table.insert(state.connected,o.MouseEnter:Connect(function()
    tw(o,.14,{BackgroundColor3=primary and C.accentHover or C.highlight})
  end))
  table.insert(state.connected,o.MouseLeave:Connect(function()tw(o,.16,{BackgroundColor3=idle})end))
  table.insert(state.connected,o.MouseButton1Down:Connect(function()tw(scale,.10,{Scale=.975})end))
  table.insert(state.connected,o.MouseButton1Up:Connect(function()tw(scale,.13,{Scale=1})end))
  if onClick then table.insert(state.connected,o.Activated:Connect(function()
    tw(scale,.16,{Scale=1});onClick()
  end)) end
  return o
end
local function card(parent,name,x,y,w,h)
  local o=box(parent,name,x,y,w,h,C.panel,12);stroke(o,C.border,.58)
  gradient(o,C.panelAlt,C.panel,90)
  return o
end
local function pill(parent,title,x,y,w,h)
  local frame=box(parent,'Pill',x,y,w,h,C.highlight,7)
  stroke(frame,C.accent,.63)
  local txt=label(frame,title,9,1,w-18,h-2,10,C.text,true)
  txt.TextXAlignment=Enum.TextXAlignment.Center
  return txt
end
local function infoRow(parent,y,k,v)
  label(parent,k,16,y,258,30,12,C.muted)
  local out=label(parent,v,277,y,278,30,12,C.text,true)
  out.TextXAlignment=Enum.TextXAlignment.Right
  return out
end
local function headline(parent,title,sub)
  label(parent,title,3,1,570,36,24,C.text,true)
  label(parent,sub,4,39,560,20,11,C.muted)
end
local function textInput(parent,title,y,value,change,secret)
  label(parent,title,16,y,490,18,10,C.muted,true)
  local field=Instance.new('TextBox')
  field.Position=UDim2.fromOffset(16,y+23);field.Size=UDim2.fromOffset(533,38)
  field.BackgroundColor3=C.bg;field.BorderSizePixel=0;field.ClearTextOnFocus=false
  field.Font=Enum.Font.Code;field.TextSize=12;field.TextColor3=C.text
  field.TextXAlignment=Enum.TextXAlignment.Left
  field.Text=secret and '' or (value or '')
  field.PlaceholderText=secret and 'Enter tracker access token' or 'https://...'
  field.PlaceholderColor3=C.dim;field.Parent=parent;corner(field,7);stroke(field,C.border,.5)
  local inset=Instance.new('UIPadding');inset.PaddingLeft=UDim.new(0,10);inset.PaddingRight=UDim.new(0,10);inset.Parent=field
  table.insert(state.connected,field.Focused:Connect(function()tw(field,.15,{BackgroundColor3=C.panelAlt})end))
  table.insert(state.connected,field.FocusLost:Connect(function()
    tw(field,.15,{BackgroundColor3=C.bg})
    if not secret or field.Text~='' then change(field.Text) end
    if secret then field.Text='' end
  end))
  return field
end
for _,name in ipairs({'REDLINEv7UI','REDLINEv8UI','WANTEDHubV6UI'}) do
  local previous=player.PlayerGui:FindFirstChild(name)
  if previous then previous:Destroy() end
end
gui=Instance.new('ScreenGui');gui.Name='REDLINEv8UI'
gui.ResetOnSpawn=false;gui.IgnoreGuiInset=true;gui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
gui.Parent=player.PlayerGui;state.gui=gui
local shadow=box(gui,'Shadow',0,0,WIDTH+12,HEIGHT+12,Color3.fromRGB(4,3,6),18)
shadow.BackgroundTransparency=.43
shadow.AnchorPoint=Vector2.new(.5,.5);shadow.Position=UDim2.fromScale(.5,.5)
local main=box(gui,'Window',0,0,WIDTH,HEIGHT,C.bg,16)
main.AnchorPoint=Vector2.new(.5,.5);main.Position=UDim2.fromScale(.5,.5)
main.ClipsDescendants=true;stroke(main,Color3.fromRGB(132,65,83),.26)
gradient(main,Color3.fromRGB(38,18,28),C.bg,10)
local scale=Instance.new('UIScale');scale.Scale=1;scale.Parent=main;state.scale=scale
local shadowScale=Instance.new('UIScale');shadowScale.Scale=1;shadowScale.Parent=shadow
local side=box(main,'Sidebar',0,0,SIDE,HEIGHT,C.side,0)
gradient(side,Color3.fromRGB(48,21,34),C.side,85)
local edge=box(main,'SidebarDivider',SIDE-1,0,1,HEIGHT,Color3.fromRGB(116,53,75),0)
edge.BackgroundTransparency=.44
local brand=box(side,'Brand',0,0,SIDE,111,C.side,0)
brand.BackgroundTransparency=1
local brandGlow=box(brand,'Signature',17,24,4,48,C.accent,2)
local brandName=label(brand,'REDLINE',31,18,170,39,25,C.text,true)
label(brand,'BY RAHAMIDALI',32,55,170,19,10,C.danger,true)
local accentLine=box(brand,'Accent',32,81,87,2,C.accent,1)
label(side,'NAVIGATION',18,115,172,24,9,C.dim,true)
local nav=Instance.new('ScrollingFrame');nav.Name='Navigation';nav.BackgroundTransparency=1
nav.Position=UDim2.fromOffset(10,148);nav.Size=UDim2.fromOffset(SIDE-20,HEIGHT-212)
nav.BorderSizePixel=0;nav.ScrollBarThickness=2;nav.ScrollBarImageColor3=C.border
nav.AutomaticCanvasSize=Enum.AutomaticSize.Y;nav.CanvasSize=UDim2.fromOffset(0,0)
nav.ScrollingDirection=Enum.ScrollingDirection.Y;nav.Parent=side
local navLayout=Instance.new('UIListLayout');navLayout.SortOrder=Enum.SortOrder.LayoutOrder
navLayout.Padding=UDim.new(0,6);navLayout.Parent=nav
local sideFoot=box(side,'Credit',11,HEIGHT-54,SIDE-22,41,C.panel,8)
label(sideFoot,'R   /   RAHAMIDALI',10,4,172,17,10,C.text,true)
label(sideFoot,'REDLINE  •  WANTED',10,21,175,15,9,C.dim)
local header=box(main,'Titlebar',CONTENT_X,13,CONTENT_W,65,C.bg,0)
header.BackgroundTransparency=1
ui.headerTitle=label(header,'Home',3,0,395,32,19,C.text,true)
ui.headerSub=label(header,'Overview',3,33,415,20,10,C.muted)
local versionBadge=pill(header,'v8.0',431,12,64,30)
local minimizeBtn=button(header,'—',502,12,36,30,function()
  tw(scale,.18,{Scale=math.max(.25,scale.Scale*.965)})
  task.delay(.13,function()
    main.Visible=false;shadow.Visible=false;ui.reopen.Visible=true
    local view=(workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize) or Vector2.new(1200,720)
    if scale then scale.Scale=state.targetScale or 1 end
  end)
end,false)
local closeBtn=button(header,'X',545,12,36,30,function()if state.close then state.close()end end,false)
local divider=box(main,'TopDivider',CONTENT_X,82,CONTENT_W,1,C.border,0)
divider.BackgroundTransparency=.57
local pages={}
for _,name in ipairs({'home','skeleton','flight','items','respawn','general','alerts'}) do
  local pg=Instance.new('CanvasGroup');pg.Name=name
  pg.Position=UDim2.fromOffset(CONTENT_X,101);pg.Size=UDim2.fromOffset(CONTENT_W,414)
  pg.BackgroundTransparency=1;pg.BorderSizePixel=0;pg.Visible=false
  pg.GroupTransparency=1;pg.Parent=main;pages[name]=pg
end
local titles={home={'Home','Your session at a glance'},skeleton={'Skeleton Key','Events  /  Skeleton Key'},
 flight={'Flight','Movement  /  Flight'},items={'Auto Equip','Inventory  /  Auto Equip'},
 respawn={'Respawn','Recovery  /  Respawn'},general={'General','Settings  /  General'},
 alerts={'Notifications','Settings  /  Notifications'}}
local menus={
 {name='Home',id='home',tag='01'},
 {name='Events',tag='02',subs={{name='Skeleton Key',id='skeleton'}}},
 {name='Movement',tag='03',subs={{name='Flight',id='flight'}}},
 {name='Inventory',tag='04',subs={{name='Auto Equip',id='items'}}},
 {name='Recovery',tag='05',subs={{name='Respawn',id='respawn'}}},
 {name='Settings',tag='06',subs={{name='General',id='general'},{name='Notifications',id='alerts'}}}
}
local expanded={Events=false,Movement=false,Inventory=false,Recovery=false,Settings=false}
local menuHeads,menuSubs,menuPanels={}, {}, {}
local function navButton(parent,text_,x,y,w,h,click,sub)
  local b=Instance.new('TextButton');b.Name='NavButton';b.Position=UDim2.fromOffset(x,y)
  b.Size=UDim2.fromOffset(w,h);b.Text='';b.AutoButtonColor=false
  b.BorderSizePixel=0;b.BackgroundColor3=C.side;b.BackgroundTransparency=1
  b.Parent=parent;corner(b,sub and 6 or 9)
  local txt=label(b,text_,sub and 21 or 40,0,w-(sub and 32 or 63),h,sub and 11 or 12,C.muted,not sub)
  local bullet=label(b,sub and '·' or '00',sub and 8 or 12,0,sub and 12 or 26,h,sub and 13 or 10,C.dim,true)
  if sub then
    local accent=box(b,'Indicator',1,9,2,h-18,C.accent,1)
    accent.Visible=false
    b:SetAttribute('Indicator','present')
  end
  table.insert(state.connected,b.MouseEnter:Connect(function()
    if not b:GetAttribute('Selected') then
      tw(b,.14,{BackgroundColor3=C.panelAlt,BackgroundTransparency=.35})
      tw(txt,.13,{TextColor3=C.text})
    end
  end))
  table.insert(state.connected,b.MouseLeave:Connect(function()
    if not b:GetAttribute('Selected') then
      tw(b,.18,{BackgroundColor3=C.side,BackgroundTransparency=1})
      tw(txt,.15,{TextColor3=C.muted})
    end
  end))
  table.insert(state.connected,b.Activated:Connect(click))
  return b,txt,bullet
end
local function animateGroup(name,openIt)
  local data=menuPanels[name];if not data then return end
  expanded[name]=openIt
  local to=openIt and data.subHeight or 0
  local base=44
  tw(data.sub,.25,{Size=UDim2.fromOffset(192,to)},Enum.EasingStyle.Quart)
  tw(data.group,.25,{Size=UDim2.fromOffset(192,base+to)},Enum.EasingStyle.Quart)
  tw(data.arrow,.20,{Rotation=openIt and 90 or 0})
end
local function setSelection(id)
  for key,rec in pairs(menuHeads) do
    local selected=key==id
    rec.button:SetAttribute('Selected',selected)
    tw(rec.button,.17,{BackgroundColor3=selected and C.highlight or C.side,BackgroundTransparency=selected and 0 or 1})
    tw(rec.text,.16,{TextColor3=selected and C.text or C.muted})
  end
  for key,rec in pairs(menuSubs) do
    local selected=key==id
    rec.button:SetAttribute('Selected',selected)
    tw(rec.button,.17,{BackgroundColor3=selected and C.highlight or C.side,BackgroundTransparency=selected and .18 or 1})
    tw(rec.text,.16,{TextColor3=selected and C.text or C.muted})
    rec.bar.Visible=selected
  end
end
local function showPage(id)
  if not pages[id] then return end
  state.selectedPage=id
  for pageName,pg in pairs(pages) do
    if pageName~=id then pg.Visible=false;pg.GroupTransparency=1 end
  end
  local pg=pages[id]
  pg.Position=UDim2.fromOffset(CONTENT_X+12,101)
  pg.GroupTransparency=1;pg.Visible=true
  tw(pg,.28,{Position=UDim2.fromOffset(CONTENT_X,101),GroupTransparency=0},Enum.EasingStyle.Quart)
  tw(ui.headerTitle,.12,{TextTransparency=.4})
  ui.headerTitle.Text=titles[id][1];ui.headerSub.Text=titles[id][2]
  tw(ui.headerTitle,.24,{TextTransparency=0})
  setSelection(id)
end
for i,group in ipairs(menus) do
  local outer=Instance.new('Frame');outer.Name=group.name;outer.LayoutOrder=i
  outer.BackgroundTransparency=1;outer.BorderSizePixel=0
  outer.Size=UDim2.fromOffset(192,44);outer.Parent=nav
  if group.id then
    local b,t,num=navButton(outer,'Home',0,0,192,40,function()showPage('home')end,false)
    num.Text='01';menuHeads.home={button=b,text=t}
  else
    local b,t,num=navButton(outer,group.name,0,0,192,40,function()
      local willOpen=not expanded[group.name]
      for other in pairs(expanded) do
        if other~=group.name and expanded[other] then animateGroup(other,false) end
      end
      animateGroup(group.name,willOpen)
    end,false)
    num.Text=group.tag
    local arrow=label(b,'>',171,0,12,40,13,C.dim,true)
    arrow.Rotation=0
    local sub=Instance.new('Frame');sub.Name='Children';sub.BackgroundTransparency=1
    sub.Position=UDim2.fromOffset(0,44);sub.Size=UDim2.fromOffset(192,0)
    sub.ClipsDescendants=true;sub.Parent=outer
    local subHeight=#group.subs*31+2
    menuPanels[group.name]={group=outer,sub=sub,subHeight=subHeight,arrow=arrow}
    for j,child in ipairs(group.subs) do
      local sb,st=navButton(sub,child.name,21,(j-1)*31,171,28,function()showPage(child.id)end,true)
      local sbar=sb:FindFirstChild('Indicator')
      menuSubs[child.id]={button=sb,text=st,bar=sbar}
    end
  end
end
local footer=card(main,'Statusbar',CONTENT_X,529,CONTENT_W,34)
footer.BackgroundColor3=C.panel
local statusDot=box(footer,'Dot',12,13,8,8,C.accent,4)
label(footer,'STATUS',28,1,60,32,9,C.danger,true)
ui.status=label(footer,'REDLINE ready',94,2,480,30,11,C.muted)
ui.reopen=button(gui,'REDLINE  /  OPEN',12,100,149,39,function()
  main.Visible=true;shadow.Visible=true;ui.reopen.Visible=false
  scale.Scale=math.max(.3,(state.targetScale or 1)*.94)
  tw(scale,.25,{Scale=state.targetScale or 1},Enum.EasingStyle.Back)
end,true)
ui.reopen.Visible=false

-- Window dragging is independent of the current page and viewport scaling.
local dragging,dragInput,dragStart,dragWindow=false,nil,nil,nil
local function dragBegin(input)
  if input.UserInputType~=Enum.UserInputType.MouseButton1 and input.UserInputType~=Enum.UserInputType.Touch then return end
  dragging=true;dragInput=input;dragStart=input.Position;dragWindow=main.Position
  table.insert(state.connected,input.Changed:Connect(function()
    if input.UserInputState==Enum.UserInputState.End then dragging=false;dragInput=nil end
  end))
end
local function makeDragHandle(parent,w,h)
  local handle=Instance.new('TextButton')
  handle.Name='DragArea';handle.Position=UDim2.fromOffset(0,0)
  handle.Size=UDim2.fromOffset(w,h);handle.Text=''
  handle.BackgroundTransparency=1;handle.AutoButtonColor=false
  handle.BorderSizePixel=0;handle.ZIndex=20;handle.Parent=parent
  table.insert(state.connected,handle.InputBegan:Connect(dragBegin))
  return handle
end
makeDragHandle(brand,SIDE,106)
makeDragHandle(header,420,65)
table.insert(state.connected,UserInputService.InputChanged:Connect(function(input)
  if not dragging or not dragStart then return end
  if input.UserInputType~=Enum.UserInputType.MouseMovement and input~=dragInput then return end
  local change=input.Position-dragStart
  local nextX=dragWindow.X.Offset+change.X
  local nextY=dragWindow.Y.Offset+change.Y
  local cam=workspace.CurrentCamera
  if cam then
    local vp=cam.ViewportSize
    local halfW=WIDTH*(state.targetScale or 1)*.5
    local halfH=HEIGHT*(state.targetScale or 1)*.5
    local centerX=dragWindow.X.Scale*vp.X+nextX
    local centerY=dragWindow.Y.Scale*vp.Y+nextY
    centerX=math.clamp(centerX,math.min(halfW+10,vp.X*.5),math.max(vp.X-halfW-10,vp.X*.5))
    centerY=math.clamp(centerY,math.min(halfH+10,vp.Y*.5),math.max(vp.Y-halfH-10,vp.Y*.5))
    nextX=centerX-dragWindow.X.Scale*vp.X
    nextY=centerY-dragWindow.Y.Scale*vp.Y
  end
  main.Position=UDim2.new(dragWindow.X.Scale,nextX,dragWindow.Y.Scale,nextY)
  shadow.Position=main.Position
end))

local h=pages.home
headline(h,'Dashboard','A quick look at your current session')
local account=card(h,'Account',3,73,587,103)
local monogram=box(account,'Monogram',16,20,53,53,C.highlight,14)
label(monogram,'R',17,3,33,46,26,C.text,true)
label(account,'CURRENT ACCOUNT',84,13,340,20,9,C.muted,true)
label(account,'@'..player.Name,84,35,375,32,19,C.text,true)
label(account,'USER ID  /  '..tostring(player.UserId),84,71,405,19,10,C.dim)
ui.accountBadge=pill(account,isListed and 'LISTED' or 'UNLISTED',473,23,99,27)
local gameCard=card(h,'Game',3,187,284,88)
label(gameCard,'CURRENT GAME',15,11,240,20,9,C.muted,true)
label(gameCard,'WANTED',15,31,249,27,17,C.text,true)
label(gameCard,'PLACE ID  /  '..tostring(game.PlaceId),15,64,253,14,10,C.dim)
local buildCard=card(h,'Build',301,187,289,88)
label(buildCard,'SCRIPT VERSION',15,11,252,20,9,C.muted,true)
label(buildCard,'REDLINE  v8.0',15,31,253,27,17,C.text,true)
label(buildCard,'CREATED BY RAHAMIDALI',15,64,255,14,10,C.dim)
local sessionCard=card(h,'Session',3,286,587,113)
label(sessionCard,'SESSION',15,7,260,20,10,C.text,true)
ui.homeRuntime=infoRow(sessionCard,29,'Uptime','00:00:00')
ui.homeSync=infoRow(sessionCard,55,'Tracker','Not configured')
ui.homeListed=infoRow(sessionCard,80,'Account',isListed and 'Listed' or 'Not listed')

local e=pages.skeleton
headline(e,'Skeleton Key','One-time event quest')
local questCard=card(e,'Progress',3,73,587,198)
ui.questStatus=infoRow(questCard,7,'Status','Idle')
ui.questStep=infoRow(questCard,42,'Current step','Not started')
ui.questCount=infoRow(questCard,77,'Ghosts','0 / 9')
label(questCard,'QUEST PROGRESS',16,116,320,21,10,C.muted,true)
local questTrack=box(questCard,'ProgressRail',16,146,554,10,C.raised,5)
ui.progressFill=box(questTrack,'Fill',0,0,0,10,C.accent,5)
label(questCard,'Progress saves between sessions',16,165,550,21,11,C.dim)
ui.start=button(e,'START QUEST',3,282,587,48,startQuest,true)
ui.pause=button(e,'PAUSE',3,342,285,45,function()setPaused(not state.paused)end,false)
button(e,'STOP',305,342,285,45,stop,false)

local m=pages.flight
headline(m,'Flight','Shared movement controls')
local flightCard=card(m,'FlightControls',3,73,587,234)
infoRow(flightCard,13,'Movement method','Velocity')
ui.speedText=infoRow(flightCard,52,'Travel speed',tostring(state.speed)..' studs/s')
ui.noclipText=infoRow(flightCard,91,'Noclip',state.noclip and 'Enabled' or 'Disabled')
infoRow(flightCard,130,'Rollback retries','Automatic')
infoRow(flightCard,169,'Stuck detection','Enabled')
button(m,'-   SLOWER',3,320,285,44,function()
  if state.running then log('Stop before changing flight speed');return end
  local i=table.find(speedOptions,state.speed) or 2
  state.speed=speedOptions[math.max(1,i-1)];saveSettings()
  ui.speedText.Text=tostring(state.speed)..' studs/s'
end,false)
button(m,'+   FASTER',305,320,285,44,function()
  if state.running then log('Stop before changing flight speed');return end
  local i=table.find(speedOptions,state.speed) or 2
  state.speed=speedOptions[math.min(#speedOptions,i+1)];saveSettings()
  ui.speedText.Text=tostring(state.speed)..' studs/s'
end,false)
ui.noclipToggle=button(m,'NOCLIP  /  '..(state.noclip and 'ON' or 'OFF'),3,374,587,33,function()
  if state.running then log('Stop before changing noclip');return end
  state.noclip=not state.noclip;saveSettings()
  ui.noclipText.Text=state.noclip and 'Enabled' or 'Disabled'
  ui.noclipToggle.Text='NOCLIP  /  '..(state.noclip and 'ON' or 'OFF')
end,false)

local inv=pages.items
headline(inv,'Auto Equip','Shared inventory handling')
local itemCard=card(inv,'Inventory',3,73,587,240)
infoRow(itemCard,12,'Item matching','Name-based')
infoRow(itemCard,56,'Input handling','Per session')
infoRow(itemCard,100,'Equip actions','Automatic')
infoRow(itemCard,144,'Lost equipment','Reacquire when needed')
ui.itemSupport=infoRow(itemCard,188,'Virtual input',VirtualInputManager and 'Available' or 'Unavailable')
label(inv,'Items are selected by the active module, not a fixed wheel slot.',8,330,568,28,11,C.muted)

local rec=pages.respawn
headline(rec,'Respawn','Shared recovery controls')
local recoverCard=card(rec,'Recover',3,73,587,267)
infoRow(recoverCard,12,'Death detection','Enabled')
infoRow(recoverCard,53,'Respawn delay','7 seconds')
infoRow(recoverCard,94,'Preferred spawn','Hideout')
infoRow(recoverCard,135,'Checkpoint resume','Automatic')
infoRow(recoverCard,176,'Missing equipment','Reacquire')
infoRow(recoverCard,217,'Failed movement','Retry')
label(rec,'Active modules resume from their last saved checkpoint.',8,353,560,26,11,C.muted)

local gen=pages.general
headline(gen,'General','Interface and tracker connection')
local generalCard=card(gen,'General',3,73,587,320)
ui.tutorial=button(generalCard,'TUTORIAL COMPLETE  /  '..(state.tutorialReady and 'YES' or 'NO'),16,12,554,40,function()
  state.tutorialReady=not state.tutorialReady;saveSettings()
  ui.tutorial.Text='TUTORIAL COMPLETE  /  '..(state.tutorialReady and 'YES' or 'NO')
end,false)
textInput(generalCard,'TRACKER ADDRESS',63,state.url,function(v)
  state.url=v:gsub('%s+','');saveSettings();log('Tracker address saved')
end,false)
textInput(generalCard,'TRACKER ACCESS TOKEN',142,'',function(v)
  state.ingest=v:gsub('%s+','');saveSettings();log('Tracker token saved')
end,true)
button(generalCard,'CHECK CONNECTION',16,245,554,42,function()
  local data,err=http('GET','/api/account/'..player.Name)
  log(data and (data.tracked and 'Tracker connected' or 'Account not listed') or ('Connection failed: '..tostring(err)))
end,true)
label(generalCard,'Use a private backend. Do not publish access tokens.',16,290,545,22,10,C.dim)

local a=pages.alerts
headline(a,'Notifications','Error reporting')
local alertCard=card(a,'Alerts',3,73,587,238)
infoRow(alertCard,13,'Stall threshold','35 minutes')
infoRow(alertCard,60,'Failed attempts','Report error')
infoRow(alertCard,107,'Respawn issues','Report error')
infoRow(alertCard,154,'Repeat alerts','Cooldown enabled')
infoRow(alertCard,201,'Quest completion','No alert')
label(a,'Discord alerts are handled by the private tracker backend.',8,334,566,24,11,C.muted)

local splash=Instance.new('CanvasGroup');splash.Name='Startup';splash.Position=UDim2.fromScale(0,0)
splash.Size=UDim2.fromScale(1,1);splash.BackgroundColor3=C.bg;splash.BorderSizePixel=0
splash.ZIndex=70;splash.Parent=main;splash.Active=true
local splashStripe=box(splash,'Stripe',0,0,9,HEIGHT,C.accent,0);splashStripe.ZIndex=71
local splashTitle=label(splash,'REDLINE',WIDTH*.5-170,174,340,84,52,C.text,true);splashTitle.ZIndex=71
splashTitle.TextXAlignment=Enum.TextXAlignment.Center
local splashBy=label(splash,'BY RAHAMIDALI',WIDTH*.5-155,257,310,34,12,C.danger,true);splashBy.ZIndex=71
splashBy.TextXAlignment=Enum.TextXAlignment.Center
local splashTrack=box(splash,'LoadingRail',WIDTH*.5-115,328,230,4,C.raised,2);splashTrack.ZIndex=71
local splashFill=box(splashTrack,'Loading',0,0,1,4,C.accent,2);splashFill.ZIndex=72
local splashState=label(splash,'INITIALIZING',WIDTH*.5-150,343,300,25,10,C.muted,true);splashState.ZIndex=71
splashState.TextXAlignment=Enum.TextXAlignment.Center

local phaseLabels={waiting='Waiting',main_ghost='Main ghost',quest_accepted='Quest accepted',
  speaker_pickup='Picking up item',speaker_equipped='Item equipped',reacquire_speaker='Recovering item',
  ghost_travel='Traveling to ghost',ghost_dialogue='Talking to ghost',return_main='Returning to main ghost',
  key_check='Checking reward',respawning='Respawning'}
local function uptime(seconds)
  local n=math.floor(seconds)
  return ('%02d:%02d:%02d'):format(math.floor(n/3600),math.floor(n/60)%60,n%60)
end
task.spawn(function()
  while gui.Parent and not state.closed do
    ui.homeRuntime.Text=uptime(os.clock()-sessionStarted)
    ui.homeSync.Text=(not isListed) and 'Not linked' or (not safeUrl() or #state.ingest<32) and 'Not configured' or state.networkError~='' and 'Connection issue' or 'Configured'
    ui.homeListed.Text=isListed and 'Listed' or 'Not listed'
    ui.questStatus.Text=state.questCompleted and 'Completed' or state.paused and 'Paused' or state.running and 'Running' or 'Idle'
    local phase=phaseLabels[state.phase] or state.phase
    if state.phase=='ghost_travel' or state.phase=='ghost_dialogue' then phase=phase..' '..tostring(math.min(9,state.confirmedGhost+1)) end
    ui.questStep.Text=state.questCompleted and 'Complete' or phase
    ui.questCount.Text=tostring(state.confirmedGhost)..' / 9'
    ui.progressFill.Size=UDim2.fromScale(math.clamp(state.confirmedGhost/9,0,1),1)
    ui.pause.Text=state.paused and 'RESUME' or 'PAUSE'
    tw(statusDot,.25,{BackgroundColor3=state.running and C.accent or C.dim})
    ui.start.Text=state.questCompleted and 'QUEST COMPLETE' or 'START QUEST'
    task.wait(1)
  end
end)
local function rescale()
  local vp=(workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize) or Vector2.new(1200,720)
  local factor=math.min(1, math.max(.36, math.min((vp.X-24)/WIDTH,(vp.Y-24)/HEIGHT)))
  state.targetScale=factor
  if main.Visible then
    tw(scale,.16,{Scale=factor})
    tw(shadowScale,.16,{Scale=factor})
  else
    scale.Scale=factor;shadowScale.Scale=factor
  end
  if not state.lastViewport then
    main.Position=UDim2.fromScale(.5,.5)
    shadow.Position=main.Position
  end
end
rescale()
local resizeConn=RunService.RenderStepped:Connect(function()
  local vp=(workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize) or Vector2.new(1200,720)
  if state.lastViewport~=vp then state.lastViewport=vp;rescale()end
end)
table.insert(state.connected,resizeConn)
state.close=function()
  if state.closed then return end
  state.closed=true;stop()
  for _,c in ipairs(state.connected) do pcall(function()c:Disconnect()end)end
  if gui then gui:Destroy()end
end
showPage('home')
task.spawn(function()
  splashFill.Size=UDim2.fromOffset(1,4)
  tw(splashFill,.9,{Size=UDim2.fromOffset(230,4)},Enum.EasingStyle.Quart)
  tw(splashTitle,.4,{TextTransparency=0})
  task.wait(1)
  if state.closed or not splash.Parent then return end
  splashState.Text='READY'
  task.wait(.2)
  if state.closed or not splash.Parent then return end
  local done=tw(splash,.35,{GroupTransparency=1})
  done.Completed:Wait()
  if splash.Parent then splash:Destroy() end
end)
task.spawn(function() syncExisting();if state.questCompleted then log('Quest already complete') end end)
log('REDLINE ready')
