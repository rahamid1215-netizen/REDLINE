-- REDLINE | WANTED v7
-- Created by RahamidAli

local Players = game:GetService('Players')
local RunService = game:GetService('RunService')
local UserInputService = game:GetService('UserInputService')
local HttpService = game:GetService('HttpService')
local player = Players.LocalPlayer
if not player then return end
if game.PlaceId ~= 14438406081 then warn('[REDLINE] Unsupported game.'); return end

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
local settingsFile = 'REDLINE_v7_settings.json'
local checkpointFile = 'REDLINE_v7_checkpoint_' .. tostring(player.UserId) .. '.json'
local queueFile = 'REDLINE_v7_outbox_' .. tostring(player.UserId) .. '.json'
local state = {
  running=false, stopping=false, awaiting=false, token=0, connected={}, noclipConn=nil, collisionOriginal={},
  speed=80, noclip=true, paused=false, pauseEach=false, tutorialReady=false, missionStarted=false, confirmedGhost=0,
  attemptedGhost=0, amuletHeld=false, questCompleted=false, selectedPage='home', phase='waiting',
  retries=0, session=HttpService:GenerateGUID(false), networkError='', checkpointStamp=0, died=false,
  url='', ingest='', status='Idle', history={},
}
_G.REDLINEHubV7=state
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
local configSaved=readFile(settingsFile) or readFile('WANTED_v6_settings.json')
if configSaved then
  if tonumber(configSaved.speed) and table.find(speedOptions,configSaved.speed) then state.speed=configSaved.speed end
  -- Staged pauses from early builds are no longer enabled by default.
  if type(configSaved.tutorialReady)=='boolean' then state.tutorialReady=configSaved.tutorialReady end
  if type(configSaved.noclip)=='boolean' then state.noclip=configSaved.noclip end
  if type(configSaved.url)=='string' then state.url=configSaved.url end
  if type(configSaved.ingest)=='string' then state.ingest=configSaved.ingest end
end
local progress=readFile(checkpointFile) or readFile('WANTED_v6_checkpoint_' .. tostring(player.UserId) .. '.json')
if progress then
  state.missionStarted=progress.missionStarted==true
  state.confirmedGhost=math.clamp(tonumber(progress.confirmedGhost) or 0,0,9)
  state.attemptedGhost=math.clamp(tonumber(progress.attemptedGhost) or 0,0,9)
  state.questCompleted=progress.questCompleted==true
end
local outbox=readFile(queueFile) or readFile('WANTED_v6_outbox_' .. tostring(player.UserId) .. '.json') or {}
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
    if (obj:IsA('TextLabel') or obj:IsA('TextButton')) and labelVisible(obj) and (not _G.REDLINEHubV7.gui or not obj:IsDescendantOf(_G.REDLINEHubV7.gui)) then
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
local C={bg=Color3.fromRGB(40,15,23),side=Color3.fromRGB(57,23,32),panel=Color3.fromRGB(66,27,39),
  border=Color3.fromRGB(100,48,59),highlight=Color3.fromRGB(146,49,74),accent=Color3.fromRGB(179,50,78),
  text=Color3.fromRGB(255,240,243),muted=Color3.fromRGB(207,155,166),danger=Color3.fromRGB(242,138,158)}
local function corner(obj,r)
  local c=Instance.new('UICorner');c.CornerRadius=UDim.new(0,r or 8);c.Parent=obj
end
local function box(parent,name,x,y,w,h,color)
  local o=Instance.new('Frame');o.Name=name;o.Position=UDim2.fromOffset(x,y);o.Size=UDim2.fromOffset(w,h)
  o.BorderSizePixel=0;o.BackgroundColor3=color or C.panel;o.Parent=parent;corner(o,8)
  return o
end
local function label(parent,title,x,y,w,h,size,color,bold)
  local o=Instance.new('TextLabel');o.BackgroundTransparency=1;o.Position=UDim2.fromOffset(x,y);o.Size=UDim2.fromOffset(w,h)
  o.Text=title;o.TextWrapped=true;o.TextXAlignment=Enum.TextXAlignment.Left;o.TextYAlignment=Enum.TextYAlignment.Center
  o.Font=bold and Enum.Font.GothamBold or Enum.Font.Gotham;o.TextColor3=color or C.text;o.TextSize=size or 12;o.Parent=parent
  return o
end
local function button(parent,title,x,y,w,h,onClick,primary)
  local o=Instance.new('TextButton');o.Name=title;o.Position=UDim2.fromOffset(x,y);o.Size=UDim2.fromOffset(w,h)
  o.BorderSizePixel=0;o.BackgroundColor3=primary and C.accent or C.panel;o.TextColor3=C.text
  o.TextSize=12;o.Font=Enum.Font.GothamMedium;o.Text=title;o.Parent=parent;corner(o,7)
  if onClick then table.insert(state.connected,o.MouseButton1Click:Connect(onClick)) end
  return o
end
local function infoRow(parent,y,k,v)
  label(parent,k,14,y,224,27,12,C.muted)
  return label(parent,v,248,y,227,27,12,C.text,true)
end
local function headline(parent,title,sub)
  label(parent,title,3,1,487,39,23,C.text,true)
  label(parent,sub,3,39,490,27,11,C.muted)
end
local function textInput(parent,title,y,value,change,secret)
  label(parent,title,14,y,470,21,11,C.muted,true)
  local field=Instance.new('TextBox');field.Position=UDim2.fromOffset(14,y+22);field.Size=UDim2.fromOffset(462,32)
  field.BackgroundColor3=C.panel;field.BorderSizePixel=0;field.ClearTextOnFocus=false
  field.Font=Enum.Font.Code;field.TextSize=11;field.TextColor3=C.text;field.TextXAlignment=Enum.TextXAlignment.Left
  field.Text=secret and '' or (value or '');field.PlaceholderText=secret and 'Paste private token' or 'Enter HTTPS address'
  if secret then field.TextEditable=true end
  field.Parent=parent;corner(field,6)
  table.insert(state.connected,field.FocusLost:Connect(function()
    if not secret or field.Text~='' then change(field.Text) end
    if secret then field.Text='' end
  end))
end
local old=player.PlayerGui:FindFirstChild('REDLINEv7UI');if old then old:Destroy() end
old=player.PlayerGui:FindFirstChild('WANTEDHubV6UI');if old then old:Destroy() end
gui=Instance.new('ScreenGui');gui.Name='REDLINEv7UI';gui.ResetOnSpawn=false;gui.IgnoreGuiInset=true;gui.Parent=player.PlayerGui
state.gui=gui
local main=box(gui,'Window',20,40,760,550,C.bg)
local side=box(main,'Sidebar',0,0,207,550,C.side)
local header=box(main,'Header',221,10,524,66,C.bg)
label(side,'REDLINE',18,15,175,36,26,C.text,true)
label(side,'BY RAHAMIDALI',18,50,178,17,10,C.danger,true)
local line=Instance.new('Frame');line.BackgroundColor3=C.accent;line.BorderSizePixel=0;line.Position=UDim2.fromOffset(18,77);line.Size=UDim2.fromOffset(88,3);line.Parent=side
label(side,'NAVIGATION',14,105,180,20,10,C.muted,true)
ui.headerTitle=label(header,'Home',2,4,377,30,17,C.text,true)
ui.headerSub=label(header,'Overview',2,35,460,20,11,C.muted)
label(header,'v7',451,31,65,22,12,C.danger,true)
local pages={}
for _,name in ipairs({'home','skeleton','flight','items','respawn','general','alerts'}) do
  local page=box(main,name,222,86,524,397,C.bg);page.BackgroundTransparency=1;page.Visible=false;pages[name]=page
end
local titles={home={'Home','Overview'},skeleton={'Skeleton Key','Events / Skeleton Key'},flight={'Movement','Movement / Flight'},
  items={'Inventory','Inventory / Auto Equip'},respawn={'Recovery','Recovery / Respawn'},
  general={'General','Settings / General'},alerts={'Notifications','Settings / Notifications'}}
local entries={}
local function showPage(page)
  state.selectedPage=page
  for k,v in pairs(pages) do v.Visible=(k==page) end
  for k,v in pairs(entries) do v.BackgroundColor3=k==page and C.highlight or C.panel end
  ui.headerTitle.Text=titles[page][1];ui.headerSub.Text=titles[page][2]
end
local menus={
  {name='Home',id='home'},
  {name='Events',subs={{name='Skeleton Key',id='skeleton'}}},
  {name='Movement',subs={{name='Flight',id='flight'}}},
  {name='Inventory',subs={{name='Auto Equip',id='items'}}},
  {name='Recovery',subs={{name='Respawn',id='respawn'}}},
  {name='Settings',subs={{name='General',id='general'},{name='Notifications',id='alerts'}}},
}
local expanded={Events=true,Movement=false,Inventory=false,Recovery=false,Settings=false}
local menuHeads={};local menuSubs={}
local function layoutNav()
  local y=140
  for _,group in ipairs(menus) do
    local head=menuHeads[group.name]
    head.Position=UDim2.fromOffset(10,y);head.Size=UDim2.fromOffset(187,32)
    head.Text=(group.subs and (expanded[group.name] and '▾  ' or '▸  ') or '⌂  ')..group.name
    y=y+36
    if group.subs then
      for _,sub in ipairs(group.subs) do
        local child=menuSubs[sub.id]
        child.Visible=expanded[group.name]
        if expanded[group.name] then
          child.Position=UDim2.fromOffset(19,y);child.Size=UDim2.fromOffset(178,31)
          y=y+35
        end
      end
    end
    y=y+3
  end
end
for _,group in ipairs(menus) do
  if group.subs then
    menuHeads[group.name]=button(side,group.name,10,0,187,32,function()
      local willOpen=not expanded[group.name]
      for k in pairs(expanded) do expanded[k]=false end
      expanded[group.name]=willOpen;layoutNav()
    end,false)
    menuHeads[group.name].BackgroundColor3=C.side
    for _,child in ipairs(group.subs) do
      local id=child.id
      menuSubs[id]=button(side,'   '..child.name,19,0,178,31,function() showPage(id) end,false)
      entries[id]=menuSubs[id]
    end
  else
    menuHeads[group.name]=button(side,'⌂  Home',10,0,187,32,function() showPage('home') end,false)
    entries.home=menuHeads[group.name]
  end
end
layoutNav()
label(side,'CREATED BY RAHAMIDALI',14,514,190,20,10,C.muted,true)
local footer=box(main,'Footer',221,495,524,42,C.panel)
label(footer,'STATUS',12,5,73,31,10,C.danger,true)
ui.status=label(footer,'Ready',80,4,430,33,11,C.muted)
button(header,'X',485,2,34,28,function()if state.close then state.close() end end,false)
button(header,'–',445,2,34,28,function()main.Visible=false;ui.reopen.Visible=true end,false)
ui.reopen=button(gui,'REDLINE',10,95,110,37,function()main.Visible=true;ui.reopen.Visible=false end,true)
ui.reopen.Visible=false

local h=pages.home
headline(h,'Dashboard','REDLINE • WANTED')
local accountCard=box(h,'Account',2,77,506,86,C.panel)
label(accountCard,'CURRENT ACCOUNT',13,8,310,23,10,C.muted,true)
label(accountCard,'@'..player.Name,13,29,350,28,17,C.text,true)
label(accountCard,'UserId: '..tostring(player.UserId),13,57,350,20,11,C.muted)
local gameCard=box(h,'Game',2,175,245,79,C.panel)
label(gameCard,'CURRENT GAME',12,9,208,20,10,C.muted,true)
label(gameCard,'WANTED',12,29,208,26,15,C.text,true)
label(gameCard,'PlaceId: '..tostring(game.PlaceId),12,58,228,17,10,C.muted)
local versionCard=box(h,'Build',263,175,245,79,C.panel)
label(versionCard,'VERSION',12,9,218,20,10,C.muted,true)
label(versionCard,'REDLINE v7.0',12,32,230,28,15,C.text,true)
local connectionCard=box(h,'Connection',2,266,506,115,C.panel)
label(connectionCard,'SESSION',13,6,250,23,11,C.text,true)
ui.homeRuntime=infoRow(connectionCard,30,'Uptime','00:00:00')
ui.homeSync=infoRow(connectionCard,60,'Tracker','Not connected')
ui.homeListed=infoRow(connectionCard,88,'Account',isListed and 'Listed' or 'Not listed')

local e=pages.skeleton
headline(e,'Skeleton Key','One-time quest • nine ghosts')
local questCard=box(e,'Progress',2,77,506,177,C.panel)
ui.questStatus=infoRow(questCard,10,'Status','Idle')
ui.questStep=infoRow(questCard,41,'Current step','Not started')
ui.questCount=infoRow(questCard,71,'Ghosts','0 / 9')
local questBar=box(questCard,'Track',14,112,477,8,C.border)
ui.progressFill=Instance.new('Frame');ui.progressFill.BorderSizePixel=0;ui.progressFill.BackgroundColor3=C.accent
ui.progressFill.Size=UDim2.fromScale(0,1);ui.progressFill.Parent=questBar;corner(ui.progressFill,6)
label(questCard,'Progress is saved automatically',14,133,470,28,11,C.muted)
ui.start=button(e,'START QUEST',2,272,506,43,startQuest,true)
ui.pause=button(e,'PAUSE',2,325,246,42,function()setPaused(not state.paused) end,false)
button(e,'STOP',262,325,246,42,stop,false)

local m=pages.flight
headline(m,'Flight','Shared movement settings')
local flightCard=box(m,'Core',2,77,506,225,C.panel)
infoRow(flightCard,10,'Movement','Velocity')
ui.speedText=infoRow(flightCard,45,'Speed',tostring(state.speed)..' studs/s')
ui.noclipText=infoRow(flightCard,79,'Noclip',state.noclip and 'On' or 'Off')
infoRow(flightCard,113,'Rollback recovery','Automatic')
infoRow(flightCard,147,'Stuck detection','On')
button(m,'SLOWER',2,313,245,40,function()
  if state.running then log('Stop before changing flight speed');return end
  local i=table.find(speedOptions,state.speed) or 2;state.speed=speedOptions[math.max(i-1,1)];saveSettings()
  ui.speedText.Text=tostring(state.speed)..' studs/s'
end,false)
button(m,'FASTER',263,313,245,40,function()
  if state.running then log('Stop before changing flight speed');return end
  local i=table.find(speedOptions,state.speed) or 2;state.speed=speedOptions[math.min(i+1,#speedOptions)];saveSettings()
  ui.speedText.Text=tostring(state.speed)..' studs/s'
end,false)

local inv=pages.items
headline(inv,'Auto Equip','Shared inventory controls')
local itemCard=box(inv,'Inventory',2,77,506,244,C.panel)
infoRow(itemCard,9,'Selection','By item name')
infoRow(itemCard,47,'Input','Session-local')
infoRow(itemCard,85,'Equip','Automatic')
infoRow(itemCard,123,'Missing items','Reacquire when available')
ui.itemSupport=infoRow(itemCard,162,'Virtual input',VirtualInputManager and 'Available' or 'Unavailable')
label(inv,'Items are requested by the active module. No fixed wheel slots.',6,331,493,49,11,C.muted)

local rec=pages.respawn
headline(rec,'Recovery','Shared survival and retry system')
local respawnCard=box(rec,'RecoveryOptions',2,77,506,238,C.panel)
infoRow(respawnCard,10,'Death detection','Enabled')
infoRow(respawnCard,47,'Respawn wait','7 seconds')
infoRow(respawnCard,84,'Spawn preference','Hideout')
infoRow(respawnCard,121,'Checkpoint resume','Automatic')
infoRow(respawnCard,158,'Missing equipment','Reacquire')
infoRow(respawnCard,195,'Movement retries','Automatic')
label(rec,'A running module continues from its saved stage after recovery.',5,327,497,42,11,C.muted)

local gen=pages.general
headline(gen,'General','Interface and connection')
local generalCard=box(gen,'GeneralOptions',2,77,506,300,C.panel)
ui.tutorial=button(generalCard,'TUTORIAL COMPLETE: '..(state.tutorialReady and 'YES' or 'NO'),14,12,477,32,function()
  state.tutorialReady=not state.tutorialReady;saveSettings()
  ui.tutorial.Text='TUTORIAL COMPLETE: '..(state.tutorialReady and 'YES' or 'NO')
end,false)
textInput(generalCard,'TRACKER HTTPS URL',56,state.url,function(v)
  state.url=v:gsub('%s+','');saveSettings();log('Tracker URL saved')
end,false)
textInput(generalCard,'TRACKER TOKEN',131,'',function(v)
  state.ingest=v:gsub('%s+','');saveSettings();log('Tracker token saved')
end,true)
button(generalCard,'CHECK CONNECTION',14,221,477,37,function()
  local data,err=http('GET','/api/account/'..player.Name)
  log(data and (data.tracked and 'Tracker connected' or 'Account not listed') or ('No connection: '..tostring(err)))
end,false)
label(generalCard,'Game tutorial readiness is shared by all modules.',14,262,478,30,11,C.muted)

local a=pages.alerts
headline(a,'Notifications','Issue reports only')
local alertCard=box(a,'AlertOptions',2,77,506,220,C.panel)
infoRow(alertCard,11,'Stalled quest','35 minutes')
infoRow(alertCard,49,'Failed retries','Report error')
infoRow(alertCard,87,'Respawn failures','Report error')
infoRow(alertCard,125,'Repeat alerts','Cooldown on')
infoRow(alertCard,163,'Completed quest','No notification')
label(a,'Discord alerts are sent by the external tracker, not this script.',5,316,496,47,11,C.muted)

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
    ui.start.Text=state.questCompleted and 'QUEST COMPLETE' or 'START QUEST'
    task.wait(1)
  end
end)
local function rescale()
  local view=(workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize) or Vector2.new(1200,720)
  local v=math.min(1,math.max(.42,math.min((view.X-22)/785,(view.Y-22)/570)))
  if not state.scale then state.scale=Instance.new('UIScale');state.scale.Parent=main end
  state.scale.Scale=v;main.Position=UDim2.new(.5,-380*v,.5,-275*v)
end
rescale()
local conn=RunService.RenderStepped:Connect(function()
  local view=(workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize) or Vector2.new(1200,720)
  if state.lastViewport~=view then state.lastViewport=view;rescale() end
end)
table.insert(state.connected,conn)
state.close=function()
  if state.closed then return end
  state.closed=true;stop()
  for _,c in ipairs(state.connected) do pcall(function()c:Disconnect()end)end
  if gui then gui:Destroy()end
end
showPage('home')
task.spawn(function() syncExisting();if state.questCompleted then log('Quest already complete') end end)
log('REDLINE ready')
