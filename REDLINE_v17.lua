-- REDLINE | WANTED v17
-- Created by RahamidAli

local Players = game:GetService('Players')
local RunService = game:GetService('RunService')
local UserInputService = game:GetService('UserInputService')
local HttpService = game:GetService('HttpService')
local player = Players.LocalPlayer
if not player then return end
if game.PlaceId ~= 14438406081 then warn('[REDLINE] Unsupported game.'); return end

if _G.REDLINEHubV16 and type(_G.REDLINEHubV16.close) == 'function' then pcall(_G.REDLINEHubV16.close) end
if _G.REDLINEHubV15 and type(_G.REDLINEHubV15.close) == 'function' then pcall(_G.REDLINEHubV15.close) end
if _G.REDLINEHubV17 and type(_G.REDLINEHubV17.close) == 'function' then pcall(_G.REDLINEHubV17.close) end
if _G.REDLINEHubV14 and type(_G.REDLINEHubV14.close) == 'function' then pcall(_G.REDLINEHubV14.close) end
if _G.REDLINEHubV13 and type(_G.REDLINEHubV13.close) == 'function' then pcall(_G.REDLINEHubV13.close) end
if _G.REDLINEHubV12 and type(_G.REDLINEHubV12.close) == 'function' then pcall(_G.REDLINEHubV12.close) end
if _G.REDLINEHubV11 and type(_G.REDLINEHubV11.close) == 'function' then pcall(_G.REDLINEHubV11.close) end
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
local route = {['main']={['x']=-6724.72,['y']=43.09,['z']=735.3},['speaker']={['x']=-6713.94,['y']=45.09,['z']=715.24},['ghosts']={{['x']=-6997.7,['y']=53,['z']=3108.19},{['x']=-4891.73,['y']=20.76,['z']=3727.33},{['x']=-4436.99,['y']=559.19,['z']=2353.31},{['x']=-1115.07,['y']=180.93,['z']=3288.3},{['x']=701.04,['y']=69.1,['z']=2820.37},{['x']=1138.87,['y']=104.64,['z']=1808.63},{['x']=-137.28,['y']=39.83,['z']=-1749.5},{['x']=-3473.01,['y']=345,['z']=103.77},{['x']=-6335.73,['y']=397.31,['z']=-844.99}}}
-- Item locations must be physically consistent with the quest giver.
-- Corrected pickup is about 23 studs from the quest giver.
local savedSpeakerPath = 'REDLINE_speaker_' .. tostring(game.PlaceId) .. '.json'
local function distanceBetween(a,b)
  return (Vector3.new(a.x,a.y,a.z)-Vector3.new(b.x,b.y,b.z)).Magnitude
end
local speedOptions = {75,80,85}
local settingsFile = 'REDLINE_v17_settings.json'
local checkpointFile = 'REDLINE_v17_checkpoint_' .. tostring(player.UserId) .. '.json'
local queueFile = 'REDLINE_v17_outbox_' .. tostring(player.UserId) .. '.json'
local state = {
  running=false, stopping=false, awaiting=false, token=0, connected={}, noclipConn=nil, collisionOriginal={},
  speed=80, noclip=true, paused=false, pauseEach=false, tutorialReady=false, missionStarted=false, confirmedGhost=0,
  attemptedGhost=0, amuletHeld=false, questCompleted=false, selectedPage='home', phase='waiting',
  retries=0, session=HttpService:GenerateGUID(false), networkError='', checkpointStamp=0, died=false, routeError='',
  url='', ingest='', status='Idle', history={}, errors={}, missionVerified=false, verificationSource='Unknown',
}
_G.REDLINEHubV17=state
local ui={}
local gui
local function note(level,message)
  local entry=('[%s] %s | %s'):format(os.date('!%H:%M:%S'),level,tostring(message))
  table.insert(state.history,entry)
  while #state.history>130 do table.remove(state.history,1) end
  if level=='ERROR' or level=='WARN' then
    table.insert(state.errors,entry)
    while #state.errors>80 do table.remove(state.errors,1) end
  end
  print('[REDLINE] '..entry)
end
local function log(s)
  s=tostring(s)
  state.status=s
  if ui.status then ui.status.Text=s end
  note('INFO',s)
end
local function warning(s) note('WARN',s);state.status=s;if ui.status then ui.status.Text=s end end
local function copyDiagnostics()
  local lines={'REDLINE v17 | RahamidAli','Account: '..player.Name,'UserId: '..tostring(player.UserId),
    'PlaceId: '..tostring(game.PlaceId),'Quest phase: '..tostring(state.phase),
    'Confirmed ghosts: '..tostring(state.confirmedGhost),'Attempted ghosts: '..tostring(state.attemptedGhost),
    'Mission verified: '..tostring(state.missionVerified),'Amulet equipped: '..tostring(state.amuletHeld),
    'Key verified: '..tostring(state.questCompleted),'Last network issue: '..tostring(state.networkError),
    '--- LOG ---'}
  for _,entry in ipairs(state.history) do table.insert(lines,entry) end
  local output=table.concat(lines,'\n')
  local clip=setclipboard or toclipboard
  if type(clip)=='function' then
    local ok=pcall(clip,output)
    if ok then log('Error log copied to clipboard');return true,output end
  end
  warning('Clipboard unavailable. Use the selectable log box in Settings.')
  return false,output
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
-- The speaker waypoint is embedded from the user's in-game measurement.
-- Old executor overrides are ignored because earlier releases saved an incorrect location.

-- Airdrop filtering: unidentified sealed crates must NOT be guessed to contain selected loot.
local airdropCatalog = {"Airdrop Marker","Airstrike Marker","AK-47","Amethyst","Amethyst Egg","Amethyst Ring","Apple","ARX-160","AUG A1","AWM","Ballistic Shield","Barrett M82","Batteries","Benelli M1014","Big Red Egg","Bitcoin","Black Boots","Blazing Arm","Blazing Head","Bloater Arm","Bloater Head","Blue Ornament","Brown Boots","Buzzsaw","C4","Candy Cane","Capacitors","Cargo Card","Cargo Egg","Carnival Egg","Cash","Cash Bundle","Cheap Black Sneakers","Cheap Brown Sneakers","Cheap Laptop","Cheap White Sneakers","Construction Egg","CPU Fan","Crypt Keeper Arm","Crypt Keeper Head","Crypto Egg","Data Disk","Deagle","Diamond","Diamond Egg","Diamond Ring","Easter Basket","Emerald","Emerald Ring","Firework","Flamethrower","Flash Drive","Flashbang","FN FAL","Future Sneaks","Ghost Bag","Glass Egg","Glock 18c","Gold Bar","Gold Brick","Gold Bricks","Gold Chain","Gold Ornament","Gold Ring","GoldBook","Golden AK-47","Golden Barrett M82","Golden Deagle","Golden Egg","GoldPad","GoldPhone","GoldPods","GoldWatch","GPU","Green Ornament","Grenade Launcher","HDD","Hundred Bag","Hunter Arm","Hunter Head","Jack O Lantern","Kriss Vector","Large Present","Light Carbine","Loot Bag","Luxury Slides","M4A1","M60","M67","M9","Medium Present","Model 870","Money Printer","MP5K","Mutant Arm","Mutant Head","Mystery Gift","Nuclear Arm","Nuclear Head","Nutcracker","P90","Parachute Egg","Pear Egg","PearBook","Pearl Necklace","PearPad","PearPhone","PearPods","PearWatch","Planetary Egg","Plasma Arm","Plasma Head","Priceless Watch","Prisoner Egg","PSU","Radioactive Arm","Radioactive Head","RAM","Raygun","Red Ornament","Ritual Skull","Rollie","RPG-7","Ruby","Ruby Ring","Santa Bag","Sapphire","Sapphire Ring","Sawn Off","Screamer Arm","Screamer Head","Secret Files","Secure Egg","Silver Bar","Silver Chain","Silver Ring","Skeleton Key","Skorpion","Sky James Golds","Sky James Reds","Small Present","Snowglobe","Soldier Arm","Soldier Egg","Soldier Head","Solid Gold Slides","Sparkler","SPAS-12","Speakers Amulet","Streamer Head","Striped Ornament","SVD","Syndicate Egg","TPU","UMP 45","USA Flag","Uzi","Vault Cracker","Void Egg","Waterfall Egg","White Ornament","Wires"}
local af={pending={},running=false,token=0,mode='exclude',selected={},status='Idle',currentCrate=nil,seen={},lastError='',attempts=0}
af.openCount=0;af.goldenCount=0;af.goldenSeen={}
state.airdrop=af
local bag={status='Idle',selling=false,token=0,enabled=true,earlyMinutes=15,aboveSince=nil,lastFail=0,items={},weight=0,capacity=0,value=0,percent=0,remaining=nil,seller='Unknown',error='',lastSold=0,informationReady=false}
state.bag=bag
local bank={steps={
  {'bank_entrance','Fly into bank entrance','Stand just inside the bank where the flight path should enter.'},
  {'bank_upper','Fly up inside bank','Stand where the script should fly upward toward the free C4.'},
  {'free_c4','Collect free C4','Stand by the free C4 pickup, in interaction range.'},
  {'vault_throw','Throw C4 at vault','Stand at throw range and AIM THE CAMERA AT THE VAULT DOOR.'},
  {'retreat_detonate','Back up and detonate','Stand at a safe retreat point where X should detonate C4.'},
  {'vault_enter','Enter opened vault','Stand just inside the opened vault.'},
  {'cash_pickup','Collect bank cash','Stand at the main cash pile for repeated E interactions.'},
  {'escape_exit','Fly out of the bank','Stand on the path leaving the building.'},
  {'escape','Complete escape outside','Stand far enough away for the tutorial completion to register.'},
},index=1,points={},done=false,status='Not checked',cashStolen=0}
state.bankRoute=bank
local bankRouteFile='REDLINE_bank_route_'..tostring(player.UserId)..'.json'
local priorRoute=readFile(bankRouteFile)
if priorRoute and type(priorRoute.points)=='table' then bank.points=priorRoute.points end
local function filterMatches(item)
  if type(item)~='string' or item=='' then return nil end
  local selected=af.selected[item:lower()]==true
  return af.mode=='include' and selected or not selected
end
local function readCrateContents(crate)
  -- Only a COMPLETE disclosed bundle supports pre-loot filtering.
  -- A single itemName attribute would not prove that other rewards are absent.
  local raw=crate:GetAttribute('completeLootList')
  if type(raw)~='string' or raw=='' then return nil end
  local ok,items=pcall(function() return HttpService:JSONDecode(raw) end)
  if not ok or type(items)~='table' or #items==0 then return nil end
  for _,item in ipairs(items) do if type(item)~='string' then return nil end end
  return items
end

local configSaved=readFile(settingsFile) or readFile('REDLINE_v16_settings.json') or readFile('REDLINE_v15_settings.json') or readFile('REDLINE_v14_settings.json') or readFile('REDLINE_v13_settings.json') or readFile('REDLINE_v12_settings.json') or readFile('REDLINE_v11_settings.json') or readFile('REDLINE_v10_settings.json') or readFile('REDLINE_v9_settings.json') or readFile('REDLINE_v8_settings.json') or readFile('REDLINE_v7_settings.json') or readFile('WANTED_v6_settings.json')
if configSaved then
  if tonumber(configSaved.speed) and table.find(speedOptions,configSaved.speed) then state.speed=configSaved.speed end
  -- Staged pauses from early builds are no longer enabled by default.
  -- Tutorial state is per Roblox account, not a global executor setting.
  if type(configSaved.noclip)=='boolean' then state.noclip=configSaved.noclip end
  if type(configSaved.url)=='string' then state.url=configSaved.url end
  if type(configSaved.ingest)=='string' then state.ingest=configSaved.ingest end
  if configSaved.airdropMode=='include' or configSaved.airdropMode=='exclude' then af.mode=configSaved.airdropMode end
  if type(configSaved.airdropSelected)=='table' then for _,n in ipairs(configSaved.airdropSelected) do if type(n)=='string' then af.selected[n:lower()]=true end end end
  if configSaved.earlyMinutes==10 or configSaved.earlyMinutes==15 then bag.earlyMinutes=configSaved.earlyMinutes end
end
local progress=readFile(checkpointFile) or readFile('REDLINE_v16_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v15_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v14_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v13_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v12_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v11_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v10_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v9_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v8_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v7_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('WANTED_v6_checkpoint_' .. tostring(player.UserId) .. '.json')
if progress then
  state.missionStarted=progress.missionStarted==true
  state.confirmedGhost=math.clamp(tonumber(progress.confirmedGhost) or 0,0,9)
  state.attemptedGhost=math.clamp(tonumber(progress.attemptedGhost) or 0,0,9)
  state.questCompleted=progress.questCompleted==true
  state.tutorialReady=progress.tutorialReady==true
end
local outbox=readFile(queueFile) or readFile('REDLINE_v16_outbox_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v15_outbox_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v14_outbox_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v13_outbox_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v12_outbox_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v10_outbox_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v9_outbox_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v8_outbox_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v7_outbox_' .. tostring(player.UserId) .. '.json') or readFile('WANTED_v6_outbox_' .. tostring(player.UserId) .. '.json') or {}
if type(outbox)~='table' then outbox={} end
local function saveSettings()
  local sels={};for n,on in pairs(af.selected) do if on then table.insert(sels,n) end end
  saveFile(settingsFile,{speed=state.speed,noclip=state.noclip,url=state.url,ingest=state.ingest,airdropMode=af.mode,airdropSelected=sels,earlyMinutes=bag.earlyMinutes})
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
  if event=='error' then note('ERROR',e.phase..': '..e.detail) end
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
    if (obj:IsA('TextLabel') or obj:IsA('TextButton')) and labelVisible(obj) and (not _G.REDLINEHubV17.gui or not obj:IsDescendantOf(_G.REDLINEHubV17.gui)) then
      if type(obj.Text)=='string' and obj.Text:lower():find(term:lower(),1,true) then return true,obj end
    end
  end
  return false,nil
end
-- Verified against the client-visible modules in the supplied WANTED place export.
-- The live game might differ; every module operation is protected and has a fallback.
local liveModuleCache={}
local function liveModule(name)
  if liveModuleCache[name] then return liveModuleCache[name] end
  local ok,loaded=pcall(function()
    local entry=game:GetService('ReplicatedStorage'):FindFirstChild('Devv')
    if not entry then return nil end
    local root=require(entry)
    if type(root)~='table' or type(root.load)~='function' then return nil end
    return root.load(name)
  end)
  if ok and type(loaded)=='table' then liveModuleCache[name]=loaded;return loaded end
  return nil
end
-- Shared bag manager: common to ALL Auto Farm modules. No fictional bag fullness estimates.
function bag.read()
  local data,objects,upgrades,dialogs=liveModule('ClientData'),liveModule('Objects'),liveModule('UpgradeUtil'),liveModule('DialogUtil')
  if not data or not objects or not upgrades or type(data.Get)~='function' or type(upgrades.GetBagCapacity)~='function' then
    bag.informationReady=false;return false,'Bag modules unavailable'
  end
  local ok,bagData=pcall(data.Get,'bag')
  if not ok or type(bagData)~='table' or type(bagData.contents)~='table' then
    bag.informationReady=false;return false,'Bag data not available'
  end
  local capOK,capacity=pcall(upgrades.GetBagCapacity,player)
  if not capOK or type(capacity)~='number' or capacity<=0 then
    bag.informationReady=false;return false,'Bag capacity not available'
  end
  local rows,totalWeight,calculatedValue={},0,0
  for _,name in pairs(bagData.contents) do
    if type(name)=='string' then
      local got,w=pcall(objects.GetDataProperty,name,'weight')
      if got and type(w)=='number' then totalWeight=totalWeight+w end
      local gotV,v=pcall(objects.GetDataProperty,name,'sellValue')
      if gotV and type(v)=='number' then calculatedValue=calculatedValue+v end
      local row=rows[name] or {name=name,count=0,value=0,weight=0}
      row.count=row.count+1
      if gotV and type(v)=='number' then row.value=row.value+v end
      if got and type(w)=='number' then row.weight=row.weight+w end
      rows[name]=row
    end
  end
  local sorted={}
  for _,row in pairs(rows) do table.insert(sorted,row) end
  table.sort(sorted,function(a,b) return a.value>b.value end)
  local sellValue=calculatedValue
  if dialogs and type(dialogs.GetBagSellValue)=='function' then
    local good,actual=pcall(dialogs.GetBagSellValue)
    if good and type(actual)=='number' then sellValue=actual end
  end
  bag.items=sorted;bag.weight=totalWeight;bag.capacity=capacity
  bag.value=sellValue;bag.percent=math.clamp(totalWeight/capacity,0,1)
  bag.informationReady=true
  local maxSell,already=nil,0
  if type(upgrades.GetValue)=='function' then
    local good,limit=pcall(upgrades.GetValue,player,'blackMarketLevel','maxSellAmount')
    if good and type(limit)=='number' then maxSell=limit end
  end
  if dialogs and type(dialogs.GetBlackMarketValues)=='function' then
    local good,amount=pcall(dialogs.GetBlackMarketValues)
    if good and type(amount)=='number' then already=amount end
  end
  bag.remaining=maxSell and math.max(0,maxSell-already) or nil
  bag.seller=(bag.remaining~=nil and bag.remaining>0 and (2*sellValue)<=bag.remaining) and 'Sir B' or 'Ofy'
  return true
end
function bag.findSellerPosition(name)
  local tagger=liveModule('Tagger')
  if tagger and type(tagger.Get)=='function' then
    local ok,obj=pcall(tagger.Get,name)
    if ok and type(obj)=='table' then
      if typeof(obj.cframe)=='CFrame' then return obj.cframe.Position end
      if typeof(obj.position)=='Vector3' then return obj.position end
      if typeof(obj.model)=='Instance' then return objectWorldPosition(obj.model) end
    end
  end
  -- Never guess an NPC's coordinates: sell remotely only when an actual NPC is located.
  local obj=workspace:FindFirstChild(name,true)
  if obj then return objectWorldPosition(obj) end
  return nil
end
function bag.travel(point,token)
  local rootPart=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
  if not rootPart then return false,'Character unavailable' end
  local deadline=os.clock()+math.max(14,(rootPart.Position-point).Magnitude/state.speed*3+12)
  local previousDistance=math.huge;local lastProgress=os.clock()
  while bag.selling and bag.token==token and not state.closed and not state.running do
    if not characterAlive() then stopMotion();return false,'Character died' end
    rootPart=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
    if not rootPart then stopMotion();return false,'Lost character' end
    local delta=point-rootPart.Position
    if delta.Magnitude<=9 then stopMotion();return true end
    if delta.Magnitude<previousDistance-2 then previousDistance=delta.Magnitude;lastProgress=os.clock() end
    if os.clock()>deadline or os.clock()-lastProgress>12 then stopMotion();return false,'Could not reach seller' end
    startNoclip()
    rootPart.AssemblyLinearVelocity=delta.Unit*math.min(state.speed,math.max(10,delta.Magnitude*2))
    RunService.Heartbeat:Wait()
  end
  stopMotion();return false,'Stopped'
end
function bag.sell()
  if bag.selling or state.closed or state.running or not af.running then return end
  if not bag.informationReady or bag.value<=0 then return end
  bag.selling=true;bag.token=bag.token+1;local token=bag.token
  task.spawn(function()
    local success,why=pcall(function()
      -- Re-read right before choosing the seller, including any allowance changes.
      local good,err=bag.read()
      if not good then error(err) end
      if bag.value<=0 then error('Nothing to sell') end
      local seller=bag.seller
      bag.status='Selling to '..seller
      local point=bag.findSellerPosition(seller)
      if not point then error(seller..' position unavailable in live game') end
      local reached,movement=bag.travel(point,token)
      if not reached then error(movement) end
      if not bag.selling or bag.token~=token then error('Canceled') end
      local network=liveModule('Network')
      if not network or type(network.InvokeServer)~='function' then error('Network.InvokeServer unavailable') end
      -- Mirrors the game's legitimate dialogue callback, within NPC interaction range.
      local invoked,result=pcall(network.InvokeServer,'sellLoot',seller,seller=='Sir B' and true or nil)
      if not invoked or result~=true then error('Server refused '..seller..' sale: '..tostring(result)) end
      local previousValue=bag.value;local accepted=false
      for _=1,35 do
        if not bag.selling or bag.token~=token then break end
        task.wait(.2)
        bag.read()
        if bag.value<previousValue then accepted=true;break end
      end
      if not accepted then error('Sale response received, but bag contents did not change') end
      bag.lastSold=os.clock();bag.aboveSince=nil
      bag.status='Returning to Farm'
      note('INFO','Bag: '..seller..' sale verified')
      task.wait(.5)
      bag.status='Farming'
    end)
    if not success then
      bag.lastFail=os.clock();bag.error=tostring(why)
      bag.status='Sell Failed'
      note('WARN','Bag: '..bag.error)
    end
    if bag.token==token then bag.selling=false;stopMotion() end
  end)
end
function bag.tick()
  if state.closed then return end
  local good,err=bag.read()
  if not good then bag.status='Bag unavailable';bag.error=err;return end
  if bag.selling then return end
  if bag.percent>0.25 then
    if not bag.aboveSince then bag.aboveSince=os.clock() end
  else bag.aboveSince=nil end
  if not af.running or state.running then
    bag.status='Idle';return
  end
  if os.clock()-bag.lastFail<60 then bag.status='Sell Failed';return end
  if bag.value<=0 then bag.status='Farming';return end
  if bag.percent>=.999 or (bag.aboveSince and os.clock()-bag.aboveSince>=bag.earlyMinutes*60) then
    bag.sell()
  else bag.status='Farming' end
end
function bank.capture()
  local r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
  if not r then warning('Bank recorder: character position unavailable');return end
  local key=bank.steps[bank.index][1]
  local p=r.Position;local d=r.CFrame.LookVector
  local cam=workspace.CurrentCamera
  local look=cam and cam.CFrame.LookVector or d
  local function rd(v) return math.floor(v*100+.5)/100 end
  bank.points[key]={x=rd(p.X),y=rd(p.Y),z=rd(p.Z),lookX=rd(look.X),lookY=rd(look.Y),lookZ=rd(look.Z)}
  saveFile(bankRouteFile,{placeId=game.PlaceId,points=bank.points})
  log('Bank recorded: '..bank.steps[bank.index][2])
  if bank.index<#bank.steps then bank.index=bank.index+1 end
end
function bank.export()
  local result={source='REDLINE v17 manual route',placeId=game.PlaceId,bankCashRequired=5000,elevatorRequired=false,steps={}}
  for _,step in ipairs(bank.steps) do
    local record=bank.points[step[1]]
    table.insert(result.steps,{id=step[1],label=step[2],action=step[3],position=record or 'NOT RECORDED'})
  end
  local txt=HttpService:JSONEncode(result)
  local clip=setclipboard or toclipboard
  if type(clip)=='function' then
    local ok=pcall(clip,txt)
    if ok then log('Bank route copied ('..tostring(#bank.steps)..' steps)');return true,txt end
  end
  warning('Clipboard not supported: select route text from the box')
  return false,txt
end
function bank.check()
  local tasks=liveModule('ClientTasks')
  if not tasks then bank.status='Task system unavailable';return end
  local verified=false
  if type(tasks.HasCompletedTutorial)=='function' then
    local ok,done=pcall(tasks.HasCompletedTutorial)
    if ok and done==true then verified=true end
  end
  if not verified and type(tasks.IsTaskComplete)=='function' then
    local ok,done=pcall(tasks.IsTaskComplete,'BankTutorial')
    if ok and done==true then verified=true end
  end
  if verified then
    if not bank.done then
      log('Bank tutorial completion verified by game')
      state.tutorialReady=true
      checkpoint()
    end
    bank.done=true;bank.status='Tutorial complete (game verified)'
    return
  end
  if type(tasks.GetTaskData)=='function' then
    local ok,data=pcall(tasks.GetTaskData,'BankTutorial')
    if ok and type(data)=='table' then
      bank.cashStolen=tonumber(data.bankCashStolen) or 0
      bank.status='Bank stage '..tostring(data.currentStep or '?')..'/3  |  $'..tostring(bank.cashStolen)..' / $5000'
      return
    end
  end
  bank.status='Not active or not yet verified'
end
local function itemClient()
  return liveModule('ClientTools')
end
local function toolIdNamed(name)
  local tools=itemClient()
  if not tools or type(tools.GetLocalToolNamed)~='function' then return nil end
  local ok,id,data=pcall(tools.GetLocalToolNamed,name)
  if ok and id and type(data)=='table' and data.name==name then return id,data end
  return nil
end
local function toolEquipped(name)
  local tools=itemClient()
  if not tools or type(tools.GetLocalEquippedTool)~='function' then return false end
  local ok,equipped=pcall(tools.GetLocalEquippedTool)
  if not ok or type(equipped)~='table' then return false end
  if equipped.name==name then return true end
  local stateData=equipped.toolState
  if type(stateData)=='table' and stateData.name==name then return true end
  local id=toolIdNamed(name)
  return id~=nil and equipped.toolId==id
end
local function localNamedItem(name)
  return toolIdNamed(name)~=nil
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
  local name='Speakers Amulet'
  if toolEquipped(name) then
    state.amuletHeld=true
    return true
  end
  local tools=itemClient()
  local itemId=toolIdNamed(name)
  if itemId and tools and type(tools.ToggleEquip)=='function' then
    local ok,equipped=pcall(tools.ToggleEquip,itemId)
    if ok and equipped~=false then
      for attempt=1,14 do
        if token and not waitUntilActive(token) then return false end
        if toolEquipped(name) then
          state.amuletHeld=true
          report('phase','speaker_equipped',state.confirmedGhost,'Equipped by item ID',false)
          return true
        end
        task.wait(.15)
      end
    end
    warning('Amulet ID located but equip not confirmed; trying UI input')
  elseif tools and not itemId then
    state.amuletHeld=false
    return false -- No speaker in inventory: do not pick an arbitrary wheel slot.
  end
  local selected=equipNamedItem({'Speakers Amulet',"Speaker's Amulet"},token)
  if selected and (not tools or toolEquipped(name)) then
    state.amuletHeld=true
    report('phase','speaker_equipped',state.confirmedGhost,'Inventory equipped',false)
    return true
  end
  state.amuletHeld=false
  return false
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
-- Only game-owned UI and replicated values count as evidence. Never use REDLINE's labels.
local ghostIds={GhostScientist=true,GhostFisherman=true,GhostGeologist=true,GhostAstronomer=true,GhostFarmer=true,GhostMrPepper=true,GhostVortexSoldier=true,GhostVortexPilot=true,GhostBellhopper=true,GhostCultist=true}
local function readQuestEvidence()
  local result={mission=false,progress=nil,source='none',found=nil,completed=false,tutorialComplete=nil}
  local clientTasks=liveModule('ClientTasks')
  if clientTasks then
    if type(clientTasks.HasCompletedTutorial)=='function' then
      local ok,yes=pcall(clientTasks.HasCompletedTutorial)
      if ok then result.tutorialComplete=yes==true; state.tutorialReady=result.tutorialComplete end
    end
    if type(clientTasks.IsTaskComplete)=='function' then
      local ok,yes=pcall(clientTasks.IsTaskComplete,'SpeakerForTheDead')
      if ok and yes==true then result.completed=true;result.progress=9;result.source='ClientTasks.IsTaskComplete' end
    end
    if type(clientTasks.GetTaskStatus)=='function' then
      local ok,taskObject,taskData=pcall(clientTasks.GetTaskStatus,'SpeakerForTheDead')
      if ok and taskObject then result.mission=true end
      if ok and type(taskData)=='table' then
        result.mission=true
        result.currentStep=tonumber(taskData.currentStep)
        if type(taskData.found)=='table' then
          local found={};local count=0
          for name,value in pairs(taskData.found) do
            if ghostIds[name] and value then found[name]=true;count=count+1 end
          end
          result.found=found
          result.progress=math.min(count,9)
          result.source='ClientTasks.GetTaskStatus().found'
        end
      end
    end
    if result.progress~=nil or result.completed or result.mission then
      return result
    end
  end
  local function consider(name,value,source)
    local n=tostring(name or ''):lower()
    local v=tostring(value or ''):lower()
    local related=n:find('speaker for the dead',1,true) or v:find('speaker for the dead',1,true)
      or n:find('ghost quest',1,true) or v:find('ghost quest',1,true)
    if related and (v:find('active',1,true) or v:find('started',1,true)
      or v:find('in progress',1,true) or v:find('complete',1,true)) then
      result.mission=true
    end
    if n:find('questactive',1,true) or n:find('missionstarted',1,true) then
      if value==true or value==1 or value=='true' then result.mission=true end
    end
    if (n:find('ghost') or n:find('soul') or n:find('spirit')) then
      local count=tonumber(value)
      if count and count>=0 and count<=9 then
        result.progress=math.floor(count);result.source=source
        result.mission=true
      end
    end
    local text=n..' '..v
    local a,b=text:match('([0-9]+)%s*/%s*(9)')
    if a and (text:find('ghost',1,true) or text:find('soul',1,true) or text:find('speaker',1,true) or text:find('dead',1,true)) then
      result.progress=tonumber(a);result.source=source;result.mission=true
    end
  end
  for _,owner in ipairs({player,player:FindFirstChild('PlayerGui'),player:FindFirstChild('PlayerScripts')}) do
    if owner then
      for attr,val in pairs(owner:GetAttributes()) do consider(attr,val,'attribute:'..attr) end
    end
  end
  for _,obj in ipairs(player.PlayerGui:GetDescendants()) do
    if not (state.gui and obj:IsDescendantOf(state.gui)) then
      if (obj:IsA('TextLabel') or obj:IsA('TextButton')) and labelVisible(obj) then
        local parentName=obj.Parent and obj.Parent.Name or ''
        local grandName=obj.Parent and obj.Parent.Parent and obj.Parent.Parent.Name or ''
        local context=obj.Name..' '..parentName..' '..grandName
        consider(context,obj.Text,'ui:'..obj.Name)
        -- Some quest interfaces render "Ghosts" and "4/9" in sibling labels.
        if obj.Text:match('^%s*%d+%s*/%s*9%s*$') and obj.Parent then
          for _,sibling in ipairs(obj.Parent:GetChildren()) do
            if sibling~=obj and (sibling:IsA('TextLabel') or sibling:IsA('TextButton')) then
              local description=tostring(sibling.Text or ''):lower()
              if description:find('ghost',1,true) or description:find('soul',1,true)
                 or description:find('speaker',1,true) then
                consider('ghost progress',obj.Text,'ui:sibling-counter')
                break
              end
            end
          end
        end
      elseif obj:IsA('IntValue') or obj:IsA('NumberValue') or obj:IsA('StringValue') then
        consider(obj.Name,obj.Value,'value:'..obj.Name)
      end
    end
  end
  return result
end
local function refreshQuestEvidence()
  local evidence=readQuestEvidence()
  if evidence.tutorialComplete~=nil then state.tutorialReady=evidence.tutorialComplete end
  if evidence.mission then state.missionVerified=true end
  if evidence.found then state.foundGhosts=evidence.found end
  if evidence.completed then state.serverQuestComplete=true end
  if evidence.progress~=nil then
    if evidence.progress>state.confirmedGhost then
      state.confirmedGhost=evidence.progress;state.attemptedGhost=math.max(state.attemptedGhost,evidence.progress)
      checkpoint()
      note('INFO','Quest counter verified: '..tostring(evidence.progress)..'/9 via '..evidence.source)
    elseif evidence.progress<state.confirmedGhost then
      -- Old local checkpoints are not proof of the actual game's progress.
      warning('Game counter ('..evidence.progress..') differs from saved count ('..state.confirmedGhost..'); using game value')
      state.confirmedGhost=evidence.progress;checkpoint()
    end
  end
  return evidence
end
local function ensureMissionEvidence(token)
  if not waitUntilActive(token) then return false end
  local evidence=refreshQuestEvidence()
  if evidence.mission or evidence.completed then return true end
  state.routeError='Quest status unverified: game mission marker or ghost counter not found'
  warning(state.routeError)
  report('error','main_ghost',state.confirmedGhost,'Game quest marker not detected; saved flag is insufficient',false)
  return false
end
local function beginMission(token)
  if not attemptE(token) then return false end
  task.wait(.8)
  if not tap(Enum.KeyCode.One,token) then return false end
  skipDialogue(token,9)
  for i=1,25 do if not valid(token) then return false end;task.wait(.2) end
  if not tap(Enum.KeyCode.One,token) then return false end
  skipDialogue(token,3)
  local evidence=refreshQuestEvidence()
  if not evidence.mission then return false,'Mission not verified in ClientTasks or UI' end
  state.missionStarted=true;state.missionVerified=true;checkpoint()
  report('phase','quest_accepted',0,'Game quest marker detected',false)
  return true
end
local function pickupSpeaker(token)
  if toolEquipped('Speakers Amulet') then return true end
  if localNamedItem('Speakers Amulet') then return equipAmulet(token) end
  if not attemptE(token,.30) then return false end
  task.wait(.7)
  report('phase','speaker_pickup',0,'E pickup attempted',false)
  if not equipAmulet(token) then return false,'Amulet not found in inventory wheel' end
  return true
end
local function ghostNameAtPoint(point)
  if type(point)~='table' then return nil end
  local pos=Vector3.new(point.x,point.y,point.z)
  local best,bestDistance=nil,85
  for _,obj in ipairs(workspace:GetDescendants()) do
    if obj:IsA('Model') and ghostIds[obj.Name] then
      local primary=obj.PrimaryPart or obj:FindFirstChildWhichIsA('BasePart',true)
      if primary then
        local dist=(primary.Position-pos).Magnitude
        if dist<bestDistance then best=obj.Name;bestDistance=dist end
      end
    end
  end
  return best
end
local function dismissGhostDialogue(token)
  -- NPC abort wording varies: most ghosts use "I have to go." rather than "Nevermind".
  for _,phrase in ipairs({'I have to go','Nevermind','Goodbye'}) do
    local seen,obj=visibleText(phrase)
    if seen and obj and obj:IsA('GuiObject') then
      local pos=obj.AbsolutePosition+obj.AbsoluteSize*.5
      if vclick(pos.X,pos.Y) then return true end
    end
  end
  -- Fallback for numbered dialogue where option 3 is the exit option.
  return tap(Enum.KeyCode.Three,token)
end
local function ghostNameAtPoint(point)
  if type(point)~='table' then return nil end
  local pos=Vector3.new(point.x,point.y,point.z)
  local best,bestDistance=nil,85
  for _,obj in ipairs(workspace:GetDescendants()) do
    if obj:IsA('Model') and ghostIds[obj.Name] then
      local primary=obj.PrimaryPart or obj:FindFirstChildWhichIsA('BasePart',true)
      if primary then
        local dist=(primary.Position-pos).Magnitude
        if dist<bestDistance then best=obj.Name;bestDistance=dist end
      end
    end
  end
  return best
end
local function talkGhost(token,i)
  local ghostName=ghostNameAtPoint(route.ghosts[i])
  local known=refreshQuestEvidence()
  if ghostName and known.found and known.found[ghostName] then
    log('Already credited: '..ghostName)
    return true,'Already counted by quest'
  end
  local startingCount=known.progress or 0
  if startingCount>=9 then return true,'All nine ghosts credited' end
  if not equipAmulet(token) then return false,'Speaker missing' end
  if not attemptE(token) then return false,'Ghost E input unavailable' end
  state.attemptedGhost=math.max(state.attemptedGhost,i)
  checkpoint()
  report('ghost_attempted','ghost_dialogue',i,'NPC interaction initiated',false)
  -- The extracted ghost dialogue calls meetNPC on opening, before choices.
  -- We still need replicated task progress to prove it was accepted by the server.
  for attempt=1,18 do
    if not waitUntilActive(token) then return false,'Stopped' end
    task.wait(.22)
    local evidence=refreshQuestEvidence()
    if (evidence.progress and evidence.progress>startingCount)
      or (ghostName and evidence.found and evidence.found[ghostName]) then
      dismissGhostDialogue(token)
      report('ghost_verified','ghost_dialogue',evidence.progress or 0,'NPC credited: '..tostring(ghostName or 'unknown')..' '..tostring(evidence.source),true)
      return true,'Verified in mission data'
    end
  end
  dismissGhostDialogue(token)
  return false,'Ghost dialogue opened, but ClientTasks did not confirm a new ghost (step '..i..')'
end
local function collectKey(token)
  if not attemptE(token) then return false end
  task.wait(.75)
  if not tap(Enum.KeyCode.One,token) then return false end
  task.wait(.6)
  if not attemptE(token,3.0) then return false end
  report('key_pickup_attempted','key_check',9,'E pickup attempted',false)
  task.wait(.6)
  local keyFound=localNamedItem('Skeleton Key')
  if not keyFound and not itemClient() then
    keyFound=inspectWheelFor('Skeleton Key',false,token)
  end
  if keyFound then
    state.questCompleted=true;state.confirmedGhost=9;checkpoint()
    report('key_verified','key_check',9,'client_inventory',true)
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
  local attempts=0
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
      state.retries=state.retries+1;attempts=attempts+1
      report('error',phase,ghost,reason or ('Interaction failed: '..phase),false)
      if attempts>=4 and (phase=='main_ghost' or phase=='ghost_travel' or phase=='speaker_pickup') then
        warning('Paused after 4 interaction failures at '..phase..'; copy error log under Settings')
        state.paused=true
      end
      log('Retrying '..phase..' after interaction failure')
      task.wait(math.min(8,1+state.retries))
    end
  end
  return false
end
local function startQuest()
  if af.running then warning('Stop Auto Airdrop before starting Skeleton Key');return end
  if state.running then return end
  local preflight=refreshQuestEvidence()
  if state.questCompleted then log('Quest already completed') return end
  if preflight.completed then
    -- The game's completed-task flag is authoritative for the one-time quest.
    -- The key is independent and may already have been used, so do not replay it.
    local hasKey=localNamedItem('Skeleton Key')
    state.questCompleted=true;state.serverQuestComplete=true;state.confirmedGhost=9;checkpoint()
    if hasKey then
      report('key_verified','key_check',9,'Key present in ClientTools inventory',true)
      log('Mission complete; Skeleton Key in inventory. Skipping.')
    else
      log('Mission already completed; Skeleton Key not currently in inventory (possibly used). Skipping replay.')
    end
    return
  end
  if not state.tutorialReady then log('Finish the bank tutorial first') return end
  if not VirtualInputManager then log('Virtual input unavailable') return end
  state.running=true;state.stopping=false;state.paused=false;state.died=false;state.token=state.token+1
  local token=state.token
  task.spawn(function()
    syncExisting()
    if state.questCompleted then state.running=false;log('Tracker says quest completed. Skipping.');return end
    report('start','main_ghost',0,'',false)
    local liveEvidence=refreshQuestEvidence()
    if liveEvidence.mission then state.missionStarted=true;state.missionVerified=true;checkpoint() end
    if isListed and liveEvidence.progress and liveEvidence.progress>0 then
      -- Resynchronize the separate tracker using the currently visible quest counter.
      for verified=1,liveEvidence.progress do
        report('ghost_verified','ghost_dialogue',verified,'Observed game counter',true)
      end
    end
    if state.confirmedGhost>0 and liveEvidence.progress==nil then
      state.routeError='Saved ghost progress could not be checked in-game. No ghosts will be skipped.'
      report('error','ghost_dialogue',state.confirmedGhost,state.routeError,false)
      state.running=false;warning(state.routeError);return
    end
    local ok,err=pcall(function()
      if not state.missionStarted and not liveEvidence.mission and not liveEvidence.completed then
        if not doStage(token,route.main,'main_ghost',0,function() return beginMission(token) end) then return end
      end
      if not ensureMissionEvidence(token) then return end
      local speakerReady=equipAmulet(token)
      if not speakerReady then
        if not speakerDestinationValid() then return end
        if not doStage(token,route.speaker,'speaker_pickup',0,function() return pickupSpeaker(token) end) then return end
      else
        report('phase','speaker_equipped',state.confirmedGhost,'Speaker already in inventory; pickup skipped',false)
      end
      -- A count such as 4/9 does not identify which four waypoints were visited.
      -- Check each waypoint against the source-backed found set instead of jumping to #5.
      for i=1,#route.ghosts do
        if not valid(token) then return end
        local evidence=refreshQuestEvidence()
        if evidence.progress and evidence.progress>=9 then break end
        local matchedName=ghostNameAtPoint(route.ghosts[i])
        if matchedName and evidence.found and evidence.found[matchedName] then
          log('Skipping credited ghost: '..matchedName)
        else
          if not doStage(token,route.ghosts[i],'ghost_travel',i,function()
            return talkGhost(token,i)
          end) then return end
        end
      end
      local last=refreshQuestEvidence()
      if not last.progress or last.progress<9 then
        warning('Quest remains at '..tostring(last.progress or '?')..'/9 after saved route. Copy error log; an unlisted ghost may be required.')
        report('error','ghost_dialogue',last.progress or 0,'All recorded locations checked; task not yet at 9/9',false)
        return
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
-- Combat features are client-side experiments. Actual damage depends on WANTED's server.
local combat={silent=false,hitbox=false,loopbring=false,ignoreFriends=true,range=200,hitboxSize=8,
  silentStatus='Off',currentTarget=nil,lastPress=0,clones={},original={},friendCache={},lastRender=0,
  autoSpas=true,spasStatus='Waiting',lastEquip=0,lastWarn=0,spasTool=nil,lastShotAttempt=0,headAssist=false}
state.combat=combat
local function isFriendly(other)
  if not combat.ignoreFriends then return false end
  if combat.friendCache[other.UserId]~=nil then return combat.friendCache[other.UserId] end
  -- Treat unknown players as excluded until the async friend check finishes.
  combat.friendCache[other.UserId]=true
  task.spawn(function()
    local ok,yes=pcall(function() return player:IsFriendsWith(other.UserId) end)
    combat.friendCache[other.UserId]=not ok or yes==true
  end)
  return true
end
local function selectCombatTarget()
  local myRoot=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
  local cam=workspace.CurrentCamera
  if not myRoot or not cam then return nil end
  local nearest,best=nil,math.huge
  for _,other in ipairs(Players:GetPlayers()) do
    if other~=player and not isFriendly(other) then
      local ch=other.Character
      local hum=ch and ch:FindFirstChildOfClass('Humanoid')
      local rootPart=ch and ch:FindFirstChild('HumanoidRootPart')
      if hum and hum.Health>0 and rootPart then
        local dist=(myRoot.Position-rootPart.Position).Magnitude
        if dist<=combat.range then
          local toward=(rootPart.Position-cam.CFrame.Position).Unit
          local score=1-cam.CFrame.LookVector:Dot(toward)
          if score<.5 and score<best then nearest=other;best=score end
        end
      end
    end
  end
  return nearest
end
local function restoreHitboxes()
  for part,old in pairs(combat.original) do
    if part and part.Parent then pcall(function()
      part.Size=old.size;part.Transparency=old.transparency
      part.CanCollide=old.collide;part.Massless=old.massless
    end) end
  end
  combat.original={}
end
local function applyHitboxes()
  local active={}
  if combat.hitbox then
    for _,other in ipairs(Players:GetPlayers()) do
      if other~=player and not isFriendly(other) then
        local ch=other.Character
        local hum=ch and ch:FindFirstChildOfClass('Humanoid')
        local rootPart=ch and ch:FindFirstChild('HumanoidRootPart')
        local mine=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
        if rootPart and hum and hum.Health>0 and mine and (mine.Position-rootPart.Position).Magnitude<combat.range then
          active[rootPart]=true
          if not combat.original[rootPart] then
            combat.original[rootPart]={size=rootPart.Size,transparency=rootPart.Transparency,
              collide=rootPart.CanCollide,massless=rootPart.Massless}
          end
          pcall(function()
            rootPart.Size=Vector3.new(combat.hitboxSize,combat.hitboxSize,combat.hitboxSize)
            rootPart.Transparency=.63;rootPart.CanCollide=false;rootPart.Massless=true
          end)
        end
      end
    end
  end
  for part,old in pairs(combat.original) do
    if not active[part] then
      if part.Parent then pcall(function()
        part.Size=old.size;part.Transparency=old.transparency
        part.CanCollide=old.collide;part.Massless=old.massless
      end) end
      combat.original[part]=nil
    end
  end
end
local function discardClones()
  for _,model in pairs(combat.clones) do if model then pcall(function()model:Destroy()end)end end
  combat.clones={}
end
local function cloneVisual(other)
  local ch=other.Character
  if not ch then return nil end
  local was=ch.Archivable;ch.Archivable=true
  local ok,model=pcall(function()return ch:Clone()end)
  ch.Archivable=was
  if not ok or not model then return nil end
  model.Name='REDLINE_VISUAL_'..other.UserId
  for _,obj in ipairs(model:GetDescendants()) do
    if obj:IsA('Script') or obj:IsA('LocalScript') or obj:IsA('ModuleScript') then obj:Destroy()
    elseif obj:IsA('BasePart') then
      obj.Anchored=true;obj.CanCollide=false;obj.CanTouch=false;obj.CanQuery=false
    end
  end
  model.Parent=workspace.CurrentCamera
  return model
end
local function updateLoopbring()
  if not combat.loopbring then if next(combat.clones) then discardClones() end;return end
  local myRoot=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
  if not myRoot then return end
  local seen,slot={},0
  for _,other in ipairs(Players:GetPlayers()) do
    if slot>=5 then break end
    if other~=player and not isFriendly(other) then
      local ch=other.Character
      local r=ch and ch:FindFirstChild('HumanoidRootPart')
      local hum=ch and ch:FindFirstChildOfClass('Humanoid')
      if r and hum and hum.Health>0 and (r.Position-myRoot.Position).Magnitude<combat.range then
        slot=slot+1;seen[other.UserId]=true
        local model=combat.clones[other.UserId]
        if not model or not model.Parent then
          model=cloneVisual(other);combat.clones[other.UserId]=model
        end
        if model then
          local forward=myRoot.CFrame.LookVector
          local right=myRoot.CFrame.RightVector
          local pos=myRoot.Position+forward*(8+math.floor((slot-1)/3)*4)+right*((slot-1)%3-1)*4
          pcall(function()model:PivotTo(CFrame.lookAt(pos,pos+forward))end)
        end
      end
    end
  end
  for id,model in pairs(combat.clones) do
    if not seen[id] then if model then model:Destroy()end;combat.clones[id]=nil end
  end
end
local oldRaycastNamecall=nil
local function installSilentAim()
  if oldRaycastNamecall then return true end
  if type(hookmetamethod)~='function' or type(getnamecallmethod)~='function' then
    combat.silentStatus='Unavailable: executor lacks hooks';return false
  end
  local ok,err=pcall(function()
    local hookFunction=function(self,...)
      local args={...}
      if (combat.silent or combat.headAssist) and self==workspace and getnamecallmethod()=='Raycast'
        and (type(checkcaller)~='function' or not checkcaller())
        and typeof(args[1])=='Vector3' and typeof(args[2])=='Vector3'
        and os.clock()-combat.lastPress<.45 then
        local cam=workspace.CurrentCamera
        if cam and (args[1]-cam.CFrame.Position).Magnitude<25 and args[2].Magnitude>20 then
          local target=selectCombatTarget()
          local ch=target and target.Character
          local head=ch and ch:FindFirstChild('Head')
          local part=ch and (ch:FindFirstChild('Head_Hitbox',true) or (head and head:FindFirstChild('Head_Hitbox')) or head)
          if part then
            local delta=part.Position-args[1]
            if delta.Magnitude>0 then args[2]=delta.Unit*math.max(args[2].Magnitude,delta.Magnitude+2) end
          end
        end
      end
      return oldRaycastNamecall(self,table.unpack(args))
    end
    oldRaycastNamecall=hookmetamethod(workspace,'__namecall',type(newcclosure)=='function' and newcclosure(hookFunction) or hookFunction)
  end)
  if not ok then combat.silentStatus='Hook failed: '..tostring(err):sub(1,100);note('ERROR',combat.silentStatus);return false end
  combat.silentStatus='Raycast hook installed (experimental)';return true
end
table.insert(state.connected,UserInputService.InputBegan:Connect(function(input_,processed)
  if not processed and (input_.UserInputType==Enum.UserInputType.MouseButton1 or input_.UserInputType==Enum.UserInputType.Touch) then
    combat.lastPress=os.clock()
  end
end))
-- SPAS support: use the game's own equipped ClientGun/Shooter, never forge damage packets.
-- Local visual clones have CanQuery=false and cannot serve as proof of a registered hit.
function combat.cancelSpasFire()
  local tool=combat.spasTool
  if tool then pcall(function() tool.shooting=false end) end
  combat.spasTool=nil
end
function combat.equipSpas()
  local tools=liveModule('ClientTools')
  if not tools or type(tools.GetLocalToolNamed)~='function' or type(tools.ToggleEquip)~='function' then
    return nil,'ClientTools unavailable'
  end
  local ok,id=pcall(tools.GetLocalToolNamed,'SPAS-12')
  if not ok or not id then return nil,'SPAS-12 not owned' end
  local good,equipped=pcall(tools.GetLocalEquippedTool)
  if good and equipped and equipped.toolId==id then return equipped,'Equipped' end
  local toggled,err=pcall(tools.ToggleEquip,id)
  if not toggled then return nil,'Equip failed: '..tostring(err) end
  local has,tool=pcall(tools.GetLocalEquippedTool)
  if has and tool and tool.toolId==id then return tool,'Equipped' end
  return nil,'SPAS equip not confirmed'
end
function combat.updateSpas()
  if not combat.loopbring or not combat.autoSpas or state.running or af.running or not characterAlive() then
    combat.cancelSpasFire()
    if state.running or af.running then combat.spasStatus='Paused during farming' end
    return
  end
  local target=selectCombatTarget()
  local ch=target and target.Character
  local head=ch and (ch:FindFirstChild('Head_Hitbox',true) or ch:FindFirstChild('Head'))
  if not head then combat.cancelSpasFire();combat.spasStatus='No target';return end
  local tools=liveModule('ClientTools')
  local tool=nil
  if tools and type(tools.GetLocalEquippedTool)=='function' then
    local got,equipped=pcall(tools.GetLocalEquippedTool)
    if got then tool=equipped end
  end
  if not tool or tool.name~='SPAS-12' then
    combat.cancelSpasFire()
    if os.clock()-combat.lastEquip>=2.5 then
      combat.lastEquip=os.clock()
      tool,combat.spasStatus=combat.equipSpas()
      if not tool and os.clock()-combat.lastWarn>20 then
        combat.lastWarn=os.clock();note('WARN','Loopbring: '..combat.spasStatus)
      end
    end
  end
  if not tool then return end
  combat.spasTool=tool
  -- Without a hook, don't shoot blindly at visual-only clones.
  if not combat.headAssist then
    combat.cancelSpasFire();combat.spasStatus='Head targeting unavailable; fire disabled';return
  end
  local myRoot=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
  if not myRoot or (myRoot.Position-head.Position).Magnitude>combat.range then
    combat.cancelSpasFire();combat.spasStatus='Target out of range';return
  end
  local ok=pcall(function()
    -- Existing Shooter._shoot reads ClientGun.shooting and applies weapon rate/ammo rules.
    tool.shooting=true
  end)
  if ok then
    combat.lastPress=os.clock()
    combat.spasStatus='SPAS active (head targeting experimental)'
  else
    combat.cancelSpasFire();combat.spasStatus='SPAS fire input unavailable'
  end
end

table.insert(state.connected,RunService.Heartbeat:Connect(function()
  if state.closed then return end
  if os.clock()-combat.lastRender<.14 then return end
  combat.lastRender=os.clock()
  if combat.hitbox then applyHitboxes() end
  if combat.loopbring then updateLoopbring() end
  combat.updateSpas()
  if combat.silent or combat.hitbox or combat.loopbring then
    combat.currentTarget=selectCombatTarget()
  else combat.currentTarget=nil end
end))
local function endCombat()
  combat.silent=false;combat.hitbox=false;combat.loopbring=false;combat.headAssist=false
  combat.cancelSpasFire();restoreHitboxes();discardClones()
end


-- AIRDROPS: looting the crate produces separate ground loot. Select AFTER opening it.
-- Export-backed data: Airdrop (isGrounded/isLooted), WorldItem/Lootable models,
-- ClientGizmos.Get(objectId) -> gizmo.properties / AttemptCollect().
local function afSetStatus(message)
  if af.status~=message then note('INFO','Airdrop: '..message) end
  af.status=message
end
local function afFindCrates()
  local props=workspace:FindFirstChild('Props')
  local area=props and props:FindFirstChild('Airdrop')
  if not area then return {} end
  local results={}
  for _,obj in ipairs(area:GetDescendants()) do
    if obj:IsA('Model') and obj.PrimaryPart and
      (obj:GetAttribute('isGrounded')~=nil or obj:GetAttribute('isLooted')~=nil) then
      table.insert(results,obj) -- Includes crates opened by other players: check nearby floor loot.
    end
  end
  return results
end
local function afNearest()
  local r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
  local best,dist=nil,math.huge
  for _,crate in ipairs(afFindCrates()) do
    if not af.seen[crate] and crate.PrimaryPart then
      local d=r and (crate.PrimaryPart.Position-r.Position).Magnitude or 0
      if d<dist then best=crate;dist=d end
    end
  end
  return best
end
-- Track the moving crate all the way down. Recompute its position each heartbeat.
local function afFlight(crate,token,untilGrounded)
  local lastProgress=os.clock()
  local priorDist=math.huge
  while af.running and af.token==token and not state.closed and crate.Parent and crate.PrimaryPart do
    af.lastPos=crate.PrimaryPart.Position
    if bag.selling then stopMotion();repeat task.wait(.2) until not bag.selling or not af.running;lastProgress=os.clock();priorDist=math.huge end
    if state.running then stopMotion();return false,'Quest running' end
    if not characterAlive() then
      stopMotion();afSetStatus('Waiting to respawn');task.wait(.8)
      priorDist=math.huge;lastProgress=os.clock()
    else
      local r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
      if not r then task.wait(.25) else
        local grounded=crate:GetAttribute('isGrounded')==true
        -- Stop chasing the crate once anybody opened it; collect scattered drops instead.
        if crate:GetAttribute('isLooted')==true then stopMotion();return true end
        local target=crate.PrimaryPart.Position+Vector3.new(0,3,0)
        local diff=target-r.Position
        local close=diff.Magnitude<7
        if close and (not untilGrounded or grounded) then stopMotion();return true end
        startNoclip()
        if close then
          r.AssemblyLinearVelocity=Vector3.zero
        else
          r.AssemblyLinearVelocity=diff.Unit*math.min(state.speed,math.max(10,diff.Magnitude*2))
        end
        RunService.Heartbeat:Wait()
        local current=(target-r.Position).Magnitude
        if current+3<priorDist or (untilGrounded and close) then
          priorDist=current;lastProgress=os.clock()
        end
        if os.clock()-lastProgress>17 then stopMotion();return false,'Tracking crate stalled' end
      end
    end
  end
  stopMotion();return false,'Crate disappeared'
end
function af.groundModels(center,rad)
  local localFolder=workspace:FindFirstChild('Local')
  local folder=localFolder and localFolder:FindFirstChild('Gizmos')
  if not folder then return {} end
  local found={}
  for _,model in ipairs(folder:GetChildren()) do
    if model:IsA('Model') and model.PrimaryPart and (model.PrimaryPart.Position-center).Magnitude<=rad then
      local id=model:GetAttribute('objectId')
      local kind=model:GetAttribute('gizmoType')
      if id~=nil and (kind=='WorldItem' or kind=='Lootable') and model:GetAttribute('isDestroyed')~=true then
        found[id]=model
      end
    end
  end
  return found
end
function af.readLoot(model)
  local id=model and model:GetAttribute('objectId')
  if id==nil then return nil,nil,'No objectId' end
  local api=liveModule('ClientGizmos')
  if not api or type(api.Get)~='function' then return nil,nil,'ClientGizmos unavailable' end
  local ok,gizmo=pcall(api.Get,id)
  if not ok or not gizmo or not gizmo.properties then return nil,nil,'Gizmo not replicated' end
  local name=gizmo.properties.toolName or gizmo.properties.itemName or gizmo.name
  if type(name)~='string' or name=='' or name=='WorldItem' or name=='Lootable' then
    return nil,gizmo,'Unknown item name'
  end
  return name,gizmo,nil
end
function af.collectFloor(cratePos,baseline,token)
  local inspected,done={},0
  local started=os.clock();local lastDiscovery=started
  local picked,skipped,unknown=0,0,0
  if not liveModule('ClientGizmos') then return false,'ClientGizmos module unavailable for floor loot' end
  afSetStatus('Scanning dropped loot')
  while af.running and af.token==token and not state.closed and os.clock()-started<18 do
    if state.running then return false,'Quest took priority' end
    while bag.selling and af.running and af.token==token do task.wait(.2) end
    if not characterAlive() then afSetStatus('Respawning before loot sweep');task.wait(1)
    else
      local available=af.groundModels(cratePos,85)
      local candidates={}
      for id,model in pairs(available) do
        if not baseline[id] and not done[id] and not inspected[id] then
          local name,gizmo,err=af.readLoot(model)
          if name and gizmo then
            inspected[id]=true;lastDiscovery=os.clock()
            if name=='Golden Barrett M82' and not af.goldenSeen[id] then af.goldenSeen[id]=true;af.goldenCount=af.goldenCount+1 end
            if filterMatches(name) then
              table.insert(candidates,{id=id,name=name,model=model,gizmo=gizmo,priority=(name=='Golden Barrett M82') and 0 or 1})
            else skipped=skipped+1;done[id]=true end
          elseif err=='Unknown item name' then
            -- Unknown loot is never intentionally collected in include mode.
            unknown=unknown+1;inspected[id]=true
          end
        end
      end
      -- Persist eligible objects across frames; replication may deliver them in batches.
      af.pending=af.pending or {}
      for _,entry in ipairs(candidates) do af.pending[entry.id]=entry end
      local list={}
      for id,entry in pairs(af.pending) do
        if done[id] or not entry.model.Parent or not entry.model.PrimaryPart or entry.model:GetAttribute('isDestroyed')==true then
          af.pending[id]=nil
        else table.insert(list,entry) end
      end
      table.sort(list,function(a,b)
        if a.priority~=b.priority then return a.priority<b.priority end
        local root=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
        local pos=root and root.Position or cratePos
        return (a.model.PrimaryPart.Position-pos).Magnitude<(b.model.PrimaryPart.Position-pos).Magnitude
      end)
      if #list>0 then
        local entry=list[1];afSetStatus('Collecting '..entry.name)
        local root=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
        if root and entry.model.PrimaryPart and (root.Position-entry.model.PrimaryPart.Position).Magnitude>8 then
          -- Ground loot is static once the crate has opened; normal velocity movement.
          local destination=entry.model.PrimaryPart.Position+Vector3.new(0,2,0)
          local before=os.clock();local lastDist=math.huge;local changed=os.clock()
          while af.running and af.token==token and characterAlive() and entry.model.Parent and entry.model.PrimaryPart
            and (root.Position-destination).Magnitude>7 and os.clock()-before<22 do
            local diff=destination-root.Position
            if diff.Magnitude+2<lastDist then lastDist=diff.Magnitude;changed=os.clock() end
            if os.clock()-changed>9 then break end
            startNoclip()
            root.AssemblyLinearVelocity=diff.Unit*math.min(state.speed,math.max(9,diff.Magnitude*2))
            RunService.Heartbeat:Wait()
          end
          stopMotion()
        end
        if af.running and entry.model.Parent and entry.model.PrimaryPart then
          local r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
          if r and (r.Position-entry.model.PrimaryPart.Position).Magnitude<=11 then
            local ok,err=pcall(function()
              if type(entry.gizmo.AttemptCollect)~='function' then error('No AttemptCollect') end
              entry.gizmo:AttemptCollect()
            end)
            if not ok then note('WARN','Airdrop '..entry.name..' pickup: '..tostring(err)) end
            task.wait(.24) -- WorldItem/Lootable client rate limiter is 0.2s
            local grabbed=entry.gizmo.isCollected==true or not entry.model.Parent
              or entry.model:GetAttribute('isDestroyed')==true
            if grabbed then
              picked=picked+1;done[entry.id]=true;af.pending[entry.id]=nil
            else
              entry.retries=(entry.retries or 0)+1
              if entry.retries>=3 then
                skipped=skipped+1;done[entry.id]=true;af.pending[entry.id]=nil
                note('WARN','Airdrop loot refused: '..entry.name)
              else task.wait(.24) end
            end
          else
            entry.retries=(entry.retries or 0)+1
            if entry.retries>=3 then done[entry.id]=true;af.pending[entry.id]=nil;skipped=skipped+1 end
          end
        else done[entry.id]=true;af.pending[entry.id]=nil end
      elseif os.clock()-started>5 and os.clock()-lastDiscovery>5 then break
      else task.wait(.07) end
    end
  end
  af.pending={}
  local summary=('Loot sweep: %d picked, %d excluded/failed, %d unknown'):format(picked,skipped,unknown)
  afSetStatus(summary)
  return true,summary
end
local function afLoot(crate,token,baseline)
  afSetStatus('Opening landed crate')
  local pos=crate.PrimaryPart and crate.PrimaryPart.Position
  if not pos then return false,'Crate position lost' end
  -- The server can allow two DIFFERENT players to open one crate. isLooted can stay false
  -- after our FIRST successful opening; detect the newly spawned floor-loot objects instead.
  baseline=baseline or {}
  if crate:GetAttribute('isLooted')==true then
    afSetStatus('Checking existing floor loot')
    return af.collectFloor(pos,baseline,token)
  end
  local newlyDropped=false
  for attempt=1,2 do
    if not af.running or af.token~=token then return false,'Stopped' end
    if not crate.Parent or not crate.PrimaryPart then break end
    local r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
    if not r then return false,'Character unavailable' end
    if (crate.PrimaryPart.Position-r.Position).Magnitude>9 then
      local arrived,err=afFlight(crate,token,true)
      if not arrived then afSetStatus('Repositioning: '..tostring(err));task.wait(.4) end
    end
    r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
    if r and crate.PrimaryPart and (crate.PrimaryPart.Position-r.Position).Magnitude<=11 then
      tap(Enum.KeyCode.E,nil,.16)
      for _=1,24 do
        if not af.running or af.token~=token then return false,'Stopped' end
        local nearby=af.groundModels(pos,85)
        for id,_ in pairs(nearby) do
          if not baseline[id] then newlyDropped=true;break end
        end
        if newlyDropped or not crate.Parent or crate:GetAttribute('isLooted')==true then break end
        task.wait(.12)
      end
    end
    if newlyDropped or not crate.Parent or crate:GetAttribute('isLooted')==true then break end
    task.wait(.5)
  end
  if newlyDropped then
    -- This is observational: simultaneous players could produce the same new-loot signal.
    af.openCount=af.openCount+1
    afSetStatus('Fresh crate loot detected; quick gathering')
    return af.collectFloor(pos,baseline,token)
  end
  if not crate.Parent or crate:GetAttribute('isLooted')==true then
    afSetStatus('Crate claimed; scanning floor loot')
    return af.collectFloor(pos,baseline,token)
  end
  return false,'No newly dropped loot; crate may already have been claimed by this account'
end
local function afStop()
  af.running=false;af.token=af.token+1;af.currentCrate=nil;af.pending={}
  stopMotion();afSetStatus('Stopped')
end
local function afStart()
  if af.running then return end
  if state.running then warning('Stop the ghost quest before starting Airdrop Farm');return end
  af.running=true;af.token=af.token+1;local token=af.token
  afSetStatus('Looking for airdrops')
  task.spawn(function()
    local ok,err=pcall(function()
      while af.running and af.token==token and not state.closed do
        while bag.selling and af.running and af.token==token do task.wait(.2) end
        if state.running then afStop();break end
        local crate=afNearest()
        if not crate then af.status='Waiting for an airdrop';task.wait(1.4)
        else
          af.currentCrate=crate
          local startPos=crate.PrimaryPart and crate.PrimaryPart.Position
          local baseline=(crate:GetAttribute('isLooted')==true) and {} or (startPos and af.groundModels(startPos,85) or {})
          afSetStatus('Following falling crate')
          local arrived,flightErr=afFlight(crate,token,true)
          if not arrived then
            af.lastError=flightErr or 'Crate tracking failed';afSetStatus(af.lastError)
            if not crate.Parent and af.lastPos then af.collectFloor(af.lastPos,baseline,token) end
            af.seen[crate]=true
          else
            local collected,why=afLoot(crate,token,baseline)
            if not collected then af.lastError=tostring(why);warning('Airdrop: '..af.lastError) end
            af.seen[crate]=true
          end
        end
      end
    end)
    if not ok then af.lastError=tostring(err);note('ERROR','Airdrop: '..af.lastError) end
    if af.token==token then af.running=false;af.currentCrate=nil;af.pending={};stopMotion() end
  end)
end

local function trySkipBayview()
  local tasks=liveModule('ClientTasks')
  if not tasks or type(tasks.GetTask)~='function' then
    warning('Tutorial skip: ClientTasks unavailable');return
  end
  if type(tasks.IsTaskComplete)=='function' then
    local ok,bankDone=pcall(tasks.IsTaskComplete,'BankTutorial')
    if ok and bankDone then log('Bank tutorial already complete');return end
  end
  local ok,taskObj=pcall(tasks.GetTask,'BayviewTutorial')
  if not ok or not taskObj or type(taskObj.CancelTutorial)~='function' then
    warning('Tutorial skip: BayviewTutorial is not active');return
  end
  log('Requesting standard Bayview tutorial cancellation')
  local sent,err=pcall(function() taskObj:CancelTutorial() end)
  if not sent then warning('Tutorial skip failed: '..tostring(err));return end
  task.spawn(function()
    task.wait(2.5)
    local passed,active=false,false
    if type(tasks.IsTaskComplete)=='function' then
      local r,v=pcall(tasks.IsTaskComplete,'BayviewTutorial');passed=r and v==true
    end
    if type(tasks.GetTask)=='function' then
      local r,v=pcall(tasks.GetTask,'BankTutorial');active=r and v~=nil
    end
    if type(tasks.IsTaskAvailable)=='function' then
      local r,v=pcall(tasks.IsTaskAvailable,'BankTutorial');active=active or (r and v==true)
    end
    if passed or active then
      log('Bayview skip accepted; bank tutorial still required')
    else
      warning('Bayview cancellation sent, but server has not confirmed access to bank tutorial')
    end
    -- Never mark the full tutorial done just because Bayview was cancelled.
  end)
end

local function openGunshop()
  local shops=liveModule('ClientGameShops')
  if not shops or type(shops.Enter)~='function' then warning('Gunshop module unavailable');return end
  local okay,result=pcall(shops.Enter,'GunShop')
  if okay then log('Gunshop opening requested; server may refuse remote entry')
  else warning('Gunshop rejected: '..tostring(result)) end
end

local TweenService=game:GetService('TweenService')
local C={bg=Color3.fromRGB(21,23,28),side=Color3.fromRGB(25,27,33),panel=Color3.fromRGB(35,38,46),
  panel2=Color3.fromRGB(43,46,55),black=Color3.fromRGB(15,16,20),line=Color3.fromRGB(66,67,75),
  red=Color3.fromRGB(149,44,61),redHover=Color3.fromRGB(177,57,79),redDim=Color3.fromRGB(62,39,49),
  text=Color3.fromRGB(247,247,249),sub=Color3.fromRGB(177,181,192),fade=Color3.fromRGB(137,141,154),
  good=Color3.fromRGB(132,203,172),warn=Color3.fromRGB(243,165,115)}
local WIDTH,HEIGHT,SIDE=830,555,202
local function tween(obj,time,props)
  if not obj or not obj.Parent then return end
  local t=TweenService:Create(obj,TweenInfo.new(time or .17,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),props)
  t:Play();return t
end
local function round(o,r)
  local v=Instance.new('UICorner');v.CornerRadius=UDim.new(0,r or 9);v.Parent=o
end
local function outline(o,transparency,color)
  local s=Instance.new('UIStroke');s.Color=color or C.line;s.Transparency=transparency or .5;s.Parent=o
end
local function frame(parent,name,w,h,color,r)
  local o=Instance.new('Frame');o.Name=name;o.BorderSizePixel=0
  o.Size=UDim2.fromOffset(w,h);o.BackgroundColor3=color or C.panel;o.Parent=parent
  if r then round(o,r) end
  return o
end
local function label(parent,str,w,h,size,color,bold)
  local o=Instance.new('TextLabel');o.BackgroundTransparency=1;o.Text=str
  o.TextXAlignment=Enum.TextXAlignment.Left;o.TextYAlignment=Enum.TextYAlignment.Center
  o.TextSize=size or 12;o.TextColor3=color or C.text
  o.Font=bold and Enum.Font.GothamBold or Enum.Font.Gotham
  o.Size=UDim2.fromOffset(w,h);o.Parent=parent;o.TextTruncate=Enum.TextTruncate.AtEnd
  return o
end
local function put(o,x,y) o.Position=UDim2.fromOffset(x,y);return o end
local function button(parent,str,w,h,callback,primary)
  local b=Instance.new('TextButton');b.Name='Control';b.Text=str;b.BorderSizePixel=0;b.AutoButtonColor=false
  b.Size=UDim2.fromOffset(w,h);b.BackgroundColor3=primary and C.red or C.panel2
  b.TextColor3=C.text;b.Font=Enum.Font.GothamMedium;b.TextSize=12;b.Parent=parent;round(b,8)
  table.insert(state.connected,b.MouseEnter:Connect(function()tween(b,.16,{BackgroundColor3=primary and C.redHover or C.redDim})end))
  table.insert(state.connected,b.MouseLeave:Connect(function()
    tween(b,.17,{BackgroundColor3=b:GetAttribute('NavSelected') and C.redDim or (primary and C.red or C.panel2)})
  end))
  table.insert(state.connected,b.Activated:Connect(function()if callback then callback()end end))
  return b
end
local function card(parent,w,h)
  local o=frame(parent,'Card',w,h,C.panel,11);outline(o,.64);return o
end
local function headerSection(parent,str,y)
  put(label(parent,str,500,20,10,C.warn,true),4,y)
end
local function settingLine(parent,title,desc,y,actionText,callback)
  put(label(parent,title,310,22,13,C.text,true),17,y)
  put(label(parent,desc,340,18,11,C.sub),17,y+24)
  return put(button(parent,actionText,149,35,callback,false),382,y+3)
end
local function changePage(id)
  state.selectedPage=id
end
for _,name in ipairs({'REDLINEv14UI','REDLINEv13UI','REDLINEv12UI','REDLINEv11UI','REDLINEv7UI','REDLINEv8UI','REDLINEv9UI','REDLINEv10UI','WANTEDHubV6UI'}) do
  local old=player.PlayerGui:FindFirstChild(name)
  if old then old:Destroy() end
end
local screen=Instance.new('ScreenGui');screen.Name='REDLINEv17UI'
screen.IgnoreGuiInset=true;screen.ResetOnSpawn=false;screen.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
screen.Parent=player.PlayerGui;state.gui=screen
local main=frame(screen,'REDLINE',WIDTH,HEIGHT,C.bg,14);main.AnchorPoint=Vector2.new(.5,.5)
main.Position=UDim2.fromScale(.5,.5);main.ClipsDescendants=true;outline(main,.15,Color3.fromRGB(111,48,65))
local uiScale=Instance.new('UIScale');uiScale.Parent=main
local side=frame(main,'Sidebar',SIDE,HEIGHT,C.side)
put(frame(side,'Accent',3,38,C.red,1),19,24)
put(label(side,'REDLINE',160,34,24,C.text,true),32,21)
put(label(side,'BY RAHAMIDALI',155,18,10,C.warn,true),33,55)
put(frame(side,'BrandLine',73,2,C.red),33,86)
put(label(side,'NAVIGATION',150,20,10,C.fade,true),20,120)
local navFrames={};local visiblePage=nil
local navInfo={{'Home','home'},{'Events','events'},{'Combat','combat'},{'Auto Farm','autofarm'},{'Shops','shops'},{'Settings','settings'}}
for i,entry in ipairs(navInfo) do
  local id=entry[2]
  local buttonNav=put(button(side,entry[1],SIDE-29,42,function()changePage(id)end,false),15,144+(i-1)*47)
  buttonNav.Font=Enum.Font.GothamMedium;buttonNav.TextSize=14
  navFrames[id]=buttonNav
end
local profile=put(card(side,SIDE-24,82),12,HEIGHT-96)
local avatar=Instance.new('ImageLabel');avatar.Name='Avatar';avatar.BackgroundColor3=C.panel2;avatar.BorderSizePixel=0
avatar.Size=UDim2.fromOffset(39,39);avatar.Position=UDim2.fromOffset(8,9);avatar.Parent=profile;round(avatar,7)
put(label(profile,player.DisplayName,113,17,11,C.text,true),53,8).TextTruncate=Enum.TextTruncate.AtEnd
put(label(profile,'@'..player.Name,113,16,10,C.sub),53,26).TextTruncate=Enum.TextTruncate.AtEnd
put(button(profile,'ID: '..tostring(player.UserId),159,21,function()
  local clip=setclipboard or toclipboard
  if type(clip)=='function' and pcall(clip,tostring(player.UserId)) then log('UserId copied') else warning('Clipboard unavailable') end
end,false),8,52).TextSize=10
task.spawn(function()
  local ok,img=pcall(function()return Players:GetUserThumbnailAsync(player.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size100x100)end)
  if ok and img and avatar.Parent then avatar.Image=img end
end)
local contentX=SIDE+20
local top=put(frame(main,'Top',WIDTH-SIDE-40,66,C.bg),contentX,7);top.BackgroundTransparency=1
local headerTitle=put(label(top,'Home',344,28,18,C.text,true),0,1)
local headerSub=put(label(top,'Overview',350,19,10,C.fade),0,28)
local badge=put(frame(top,'Version',66,29,C.redDim,7),WIDTH-SIDE-154,6)
put(label(badge,'v17.0',66,29,11,C.text,true),0,0).TextXAlignment=Enum.TextXAlignment.Center
local minimize=put(button(top,'—',36,29,function()
  main.Visible=false;ui.reopen.Visible=true
end),WIDTH-SIDE-83,6)
local close=put(button(top,'×',36,29,function()if state.close then state.close()end end),WIDTH-SIDE-42,6)
put(frame(main,'Divider',WIDTH-SIDE-41,1,C.line),contentX,79)
local handle=put(button(top,'',WIDTH-SIDE-167,62,nil,false),0,0)
handle.BackgroundTransparency=1;handle.ZIndex=0
local dragging=false;local dragStart,dragPos,dragTouch
local function resetWindow() main.Position=UDim2.fromScale(.5,.5) end
-- Allow partially or fully off-screen dragging as requested.
table.insert(state.connected,handle.InputBegan:Connect(function(inp)
  if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then
    dragging=true;dragStart=inp.Position;dragPos=main.Position;dragTouch=inp
  end
end))
table.insert(state.connected,UserInputService.InputChanged:Connect(function(inp)
  if not dragging or not dragStart then return end
  if inp.UserInputType==Enum.UserInputType.MouseMovement or inp==dragTouch then
    local d=inp.Position-dragStart
    main.Position=UDim2.new(dragPos.X.Scale,dragPos.X.Offset+d.X,dragPos.Y.Scale,dragPos.Y.Offset+d.Y)
  end
end))
table.insert(state.connected,UserInputService.InputEnded:Connect(function(inp)
  if dragging and (inp.UserInputType==Enum.UserInputType.MouseButton1 or inp==dragTouch) then dragging=false end
end))
ui.reopen=put(button(screen,'REDLINE  /  OPEN',166,42,function()
  if state.draggedTab then state.draggedTab=false;return end
  main.Visible=true;ui.reopen.Visible=false
  uiScale.Scale=(state.targetScale or 1)*.94
  tween(uiScale,.2,{Scale=state.targetScale or 1})
end,false),18,94)
ui.reopen.BackgroundColor3=C.side;outline(ui.reopen,.24,Color3.fromRGB(128,55,74));ui.reopen.Visible=false
local tabDrag=false;local tabStart,tabPos
state.draggedTab=false
table.insert(state.connected,ui.reopen.InputBegan:Connect(function(inp)
  if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then
    tabDrag=true;tabStart=inp.Position;tabPos=ui.reopen.Position;state.draggedTab=false
  end
end))
table.insert(state.connected,UserInputService.InputChanged:Connect(function(inp)
  if tabDrag and tabStart and (inp.UserInputType==Enum.UserInputType.MouseMovement or inp.UserInputType==Enum.UserInputType.Touch) then
    local delta=inp.Position-tabStart
    if delta.Magnitude>8 then state.draggedTab=true end
    if state.draggedTab then ui.reopen.Position=UDim2.new(tabPos.X.Scale,tabPos.X.Offset+delta.X,tabPos.Y.Scale,tabPos.Y.Offset+delta.Y) end
  end
end))
table.insert(state.connected,UserInputService.InputEnded:Connect(function(inp)
  if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then
    tabDrag=false
    if state.draggedTab then task.delay(.22,function()state.draggedTab=false end) end
  end
end))
local footer=put(card(main,WIDTH-SIDE-41,34),contentX,HEIGHT-47)
put(frame(footer,'StatusDot',8,8,C.red,4),12,13)
put(label(footer,'STATUS',50,29,9,C.warn,true),29,3)
ui.status=put(label(footer,'Ready',WIDTH-SIDE-140,28,11,C.sub),88,3)
local pageOuter=put(frame(main,'Pages',WIDTH-SIDE-40,HEIGHT-153,C.bg),contentX,96)
pageOuter.BackgroundTransparency=1
local pages={}
for _,id in ipairs({'home','events','combat','autofarm','shops','settings'}) do
  local scroll=Instance.new('ScrollingFrame');scroll.Name=id;scroll.BackgroundTransparency=1;scroll.BorderSizePixel=0
  scroll.Size=UDim2.fromScale(1,1);scroll.CanvasSize=UDim2.fromOffset(0,id=='settings' and 1210 or id=='combat' and 955 or id=='autofarm' and 740 or id=='events' and 1020 or 410)
  scroll.ScrollBarThickness=3;scroll.ScrollBarImageColor3=C.red;scroll.Visible=false
  scroll.Parent=pageOuter;pages[id]=scroll
end
local pageMeta={home={'Home','Account overview'},events={'Events','Skeleton Key'},combat={'Combat','Client-side tests'},autofarm={'Auto Farm','Shared bag management and farming modules'},shops={'Shops','Gunshop'},settings={'Settings','Configuration & diagnostics'}}
local function showPage(id)
  if visiblePage==id then return end
  visiblePage=id;state.selectedPage=id
  for key,p in pairs(pages) do p.Visible=(key==id) end
  headerTitle.Text=pageMeta[id][1];headerSub.Text=pageMeta[id][2]
  for key,b in pairs(navFrames) do
    b:SetAttribute('NavSelected',key==id)
    b.BackgroundColor3=key==id and C.redDim or C.side
    b.TextColor3=key==id and C.text or C.sub
  end
  local p=pages[id];p.CanvasPosition=Vector2.zero
end
changePage=function(id)showPage(id)end
local home=pages.home
put(label(home,'Overview',500,40,26,C.text,true),1,0)
put(label(home,'Account and session information',500,19,11,C.sub),2,40)
local account=put(card(home,565,104),2,75)
put(label(account,'CURRENT ACCOUNT',420,18,10,C.fade,true),17,13)
put(label(account,'@'..player.Name,392,32,21,C.text,true),17,35)
put(label(account,'USER ID  '..tostring(player.UserId),413,17,10,C.sub),17,74)
local listedTag=put(frame(account,'Listed',110,28,C.redDim,7),439,32)
put(label(listedTag,isListed and 'LISTED' or 'NOT LISTED',110,28,10,C.text,true),0,0).TextXAlignment=Enum.TextXAlignment.Center
local gameCard=put(card(home,278,90),2,193)
put(label(gameCard,'CURRENT GAME',245,18,10,C.fade,true),14,11)
put(label(gameCard,'WANTED',250,29,17,C.text,true),14,32)
put(label(gameCard,'PLACE '..tostring(game.PlaceId),245,17,10,C.sub),14,66)
local versionCard=put(card(home,275,90),291,193)
put(label(versionCard,'VERSION',244,18,10,C.fade,true),14,11)
put(label(versionCard,'REDLINE v17.0',244,29,17,C.text,true),14,32)
put(label(versionCard,'BY RAHAMIDALI',244,17,10,C.sub),14,66)
local session=put(card(home,565,91),2,296)
put(label(session,'SESSION',200,19,10,C.fade,true),15,9)
put(label(session,'Uptime',150,23,12,C.sub),15,34)
ui.homeRuntime=put(label(session,'00:00:00',130,23,12,C.text,true),421,34);ui.homeRuntime.TextXAlignment=Enum.TextXAlignment.Right
put(label(session,'Tracker',150,23,12,C.sub),15,60)
ui.homeSync=put(label(session,'Not configured',175,23,12,C.text,true),371,60);ui.homeSync.TextXAlignment=Enum.TextXAlignment.Right

local event=pages.events
put(label(event,'Skeleton Key',500,36,24,C.text,true),2,0)
put(label(event,'One-time ghost quest',515,20,11,C.sub),2,38)
local questCard=put(card(event,565,238),2,74)
put(label(questCard,'QUEST',300,21,10,C.warn,true),17,10)
put(label(questCard,'Status',240,23,12,C.sub),17,41)
ui.questStatus=put(label(questCard,'Idle',253,23,12,C.text,true),297,41);ui.questStatus.TextXAlignment=Enum.TextXAlignment.Right
put(label(questCard,'Current step',240,23,12,C.sub),17,74)
ui.questStep=put(label(questCard,'Waiting',310,23,12,C.text,true),240,74);ui.questStep.TextXAlignment=Enum.TextXAlignment.Right
put(label(questCard,'Ghosts',240,23,12,C.sub),17,107)
ui.questCount=put(label(questCard,'0 / 9',250,23,12,C.text,true),300,107);ui.questCount.TextXAlignment=Enum.TextXAlignment.Right
put(label(questCard,'PROGRESS',200,20,10,C.fade,true),17,151)
local progressRail=put(frame(questCard,'ProgressRail',532,8,C.panel2,4),17,180)
ui.progressFill=frame(progressRail,'Progress',0,8,C.red,4)
put(label(questCard,'Only verified quest progress is counted.',522,19,10,C.sub),17,207)
ui.start=put(button(event,'START QUEST',565,47,startQuest,true),2,325)
ui.pause=put(button(event,'PAUSE',271,40,function()setPaused(not state.paused)end,false),2,380)
put(button(event,'STOP',277,40,stop,false),290,380)
do
local bankCard=put(card(event,565,444),2,453)
put(label(bankCard,'BANK TUTORIAL • ROUTE RECORDER',510,22,12,C.text,true),16,12)
put(label(bankCard,'No elevator: fly in, fly up, C4, vault, cash, escape.',531,22,11,C.sub),16,38)
ui.bankStatus=put(label(bankCard,'Checking bank progress',531,22,11,C.warn),16,70)
ui.bankStep=put(label(bankCard,'1 / 9 — Fly into bank entrance',525,25,13,C.text,true),16,101)
ui.bankHint=put(label(bankCard,'Stand just inside the bank where the flight path should enter.',531,39,11,C.sub),16,133)
put(button(bankCard,'PREV',127,36,function()bank.index=math.max(1,bank.index-1)end,false),16,179)
put(button(bankCard,'CAPTURE THIS POINT',254,36,bank.capture,true),153,179)
put(button(bankCard,'NEXT',125,36,function()bank.index=math.min(#bank.steps,bank.index+1)end,false),424,179)
ui.bankCaptured=put(label(bankCard,'0 of 9 waypoints saved',520,23,11,C.sub),16,228)
put(button(bankCard,'COPY ROUTE',254,39,function()
  local ok,data=bank.export()
  if ui.bankExport then ui.bankExport.Text=data end
end,true),16,262)
put(button(bankCard,'RECHECK BANK',258,39,bank.check,false),291,262)
put(label(bankCard,'Route export (also works when clipboard is unavailable):',530,21,10,C.fade),16,318)
local bankTxt=Instance.new('TextBox');bankTxt.Name='BankRouteExport';bankTxt.MultiLine=true
bankTxt.ClearTextOnFocus=false;bankTxt.TextEditable=true;bankTxt.BackgroundColor3=C.black;bankTxt.BorderSizePixel=0
bankTxt.Position=UDim2.fromOffset(16,343);bankTxt.Size=UDim2.fromOffset(533,80)
bankTxt.Text='Click COPY ROUTE when ready';bankTxt.TextColor3=C.sub;bankTxt.Font=Enum.Font.Code
bankTxt.TextSize=10;bankTxt.TextXAlignment=Enum.TextXAlignment.Left;bankTxt.TextYAlignment=Enum.TextYAlignment.Top
bankTxt.Parent=bankCard;round(bankTxt,7);ui.bankExport=bankTxt
end

local battle=pages.combat
put(label(battle,'Combat',480,38,25,C.text,true),2,0)
put(label(battle,'Local tests — server hit registration is not guaranteed',558,22,11,C.sub),2,39)
headerSection(battle,'AIM',77)
local aimCard=put(card(battle,565,112),2,104)
put(label(aimCard,'Silent Aim  /  Raycast',300,24,14,C.text,true),16,9)
put(label(aimCard,'Experimental shot redirection for Raycast-based weapons',530,21,11,C.sub),16,33)
ui.silentBtn=put(button(aimCard,'OFF',146,35,function()
  if not combat.silent and not installSilentAim() then warning(combat.silentStatus);return end
  combat.silent=not combat.silent;ui.silentBtn.Text=combat.silent and 'ON' or 'OFF'
  log('Raycast silent aim '..(combat.silent and 'enabled (experimental)' or 'disabled'))
end),403,9)
ui.silentInfo=put(label(aimCard,'Hook not tested',520,20,10,C.fade),16,76)
headerSection(battle,'HITBOX',234)
local hitCard=put(card(battle,565,124),2,260)
put(label(hitCard,'Hitbox Expander',307,24,14,C.text,true),16,10)
put(label(hitCard,'Local client hitboxes; damage may be server validated',460,20,11,C.sub),16,37)
ui.hitBtn=put(button(hitCard,'OFF',146,35,function()
  combat.hitbox=not combat.hitbox
  if not combat.hitbox then restoreHitboxes() end
  ui.hitBtn.Text=combat.hitbox and 'ON' or 'OFF'
  log('Hitbox expander '..(combat.hitbox and 'enabled' or 'disabled'))
end),403,9)
ui.hitSize=put(label(hitCard,'Size  '..combat.hitboxSize,192,20,12,C.text,true),16,84)
put(button(hitCard,'−',48,33,function()
  combat.hitboxSize=math.max(3,combat.hitboxSize-2)
  ui.hitSize.Text='Size  '..combat.hitboxSize
end),429,76)
put(button(hitCard,'+',48,33,function()
  combat.hitboxSize=math.min(25,combat.hitboxSize+2)
  ui.hitSize.Text='Size  '..combat.hitboxSize
end),498,76)
headerSection(battle,'TARGET MANIPULATION',402)
local bringCard=put(card(battle,565,228),2,430)
put(label(bringCard,'Local Loopbring',310,24,14,C.text,true),16,11)
put(label(bringCard,'Local visual replicas only. No server teleport.',490,20,11,C.sub),16,41)
ui.bringBtn=put(button(bringCard,'OFF',146,35,function()
  combat.loopbring=not combat.loopbring
  if combat.loopbring and combat.autoSpas then
    combat.headAssist=installSilentAim()==true
  end
  if not combat.loopbring then discardClones();combat.cancelSpasFire();combat.headAssist=false end
  ui.bringBtn.Text=combat.loopbring and 'ON' or 'OFF'
end),403,9)
put(label(bringCard,'Models rendered in front of you; hits are unverified.',524,22,10,C.fade),16,86)
headerSection(battle,'TARGET FILTERS',666)
put(label(bringCard,'Auto equip SPAS-12 and attempt head-targeted fire',385,28,11,C.sub),16,119)
ui.spasBtn=put(button(bringCard,'AUTO SPAS  ON',147,35,function()
  combat.autoSpas=not combat.autoSpas
  if combat.loopbring and combat.autoSpas then combat.headAssist=installSilentAim()==true end
  if not combat.autoSpas then combat.cancelSpasFire();combat.headAssist=false end
  ui.spasBtn.Text=combat.autoSpas and 'AUTO SPAS  ON' or 'AUTO SPAS  OFF'
end),398,114)
ui.spasInfo=put(label(bringCard,'SPAS: waiting',527,31,11,C.fade),16,158)
put(label(bringCard,'Visual copies are not server hitboxes; damage must be tested.',527,26,10,C.sub),16,190)
local filterCard=put(card(battle,565,190),2,687)
put(label(filterCard,'Ignore friends',314,24,13,C.text,true),16,11)
ui.friendBtn=put(button(filterCard,'ON',146,35,function()
  combat.ignoreFriends=not combat.ignoreFriends
  ui.friendBtn.Text=combat.ignoreFriends and 'ON' or 'OFF'
end),403,8)
put(label(filterCard,'Target range',314,24,13,C.text,true),16,65)
ui.rangeLabel=put(label(filterCard,tostring(combat.range)..' studs',180,26,12,C.sub),267,65)
put(button(filterCard,'−',48,32,function()
  combat.range=math.max(50,combat.range-50);ui.rangeLabel.Text=tostring(combat.range)..' studs'
end),438,62)
put(button(filterCard,'+',48,32,function()
  combat.range=math.min(1000,combat.range+50);ui.rangeLabel.Text=tostring(combat.range)..' studs'
end),503,62)
ui.targetLabel=put(label(filterCard,'Current target: none',532,25,11,C.fade),16,129)


do
local farmPage=pages.autofarm
put(label(farmPage,'Auto Farm',520,34,25,C.text,true),2,0)
put(label(farmPage,'Shared bag manager and farming modules',545,18,10,C.sub),2,39)
local bagCard=put(card(farmPage,565,359),2,70)
put(label(bagCard,'BAG STATUS',275,22,13,C.text,true),16,11)
ui.bagStatus=put(label(bagCard,'Checking bag...',240,20,10,C.warn),308,13);ui.bagStatus.TextXAlignment=Enum.TextXAlignment.Right
put(label(bagCard,'Weight',155,20,11,C.sub),16,43)
ui.bagWeight=put(label(bagCard,'-- / -- kg',224,20,12,C.text,true),324,43);ui.bagWeight.TextXAlignment=Enum.TextXAlignment.Right
local bagRail=put(frame(bagCard,'BagRail',533,6,C.panel2,3),16,73)
ui.bagFill=frame(bagRail,'Filled',0,6,C.red,3)
put(label(bagCard,'Regular sale value',224,19,11,C.sub),16,89)
ui.bagValue=put(label(bagCard,'--',240,19,12,C.text,true),308,89);ui.bagValue.TextXAlignment=Enum.TextXAlignment.Right
put(frame(bagCard,'DividerOne',533,1,C.line),16,118)
put(label(bagCard,'CURRENT BAG ITEMS',250,20,10,C.warn,true),16,125)
ui.bagItems=Instance.new('ScrollingFrame');ui.bagItems.Name='BagItems';ui.bagItems.BackgroundColor3=C.black
ui.bagItems.BorderSizePixel=0;ui.bagItems.ScrollBarThickness=3;ui.bagItems.ScrollBarImageColor3=C.red
ui.bagItems.Position=UDim2.fromOffset(16,149);ui.bagItems.Size=UDim2.fromOffset(533,93)
ui.bagItems.CanvasSize=UDim2.fromOffset(0,0);ui.bagItems.Parent=bagCard;round(ui.bagItems,6)
put(frame(bagCard,'DividerTwo',533,1,C.line),16,252)
put(label(bagCard,'Smart selling',220,22,11,C.text,true),16,265)
ui.bagPreferred=put(label(bagCard,'Sir B / Ofy',309,22,11,C.warn),240,265);ui.bagPreferred.TextXAlignment=Enum.TextXAlignment.Right
put(label(bagCard,'Early sale (>25% for)',240,20,10,C.sub),16,291)
ui.bagEarly=put(button(bagCard,'15 MIN',128,27,function()
  bag.earlyMinutes=bag.earlyMinutes==15 and 10 or 15;saveSettings();ui.bagEarly.Text=tostring(bag.earlyMinutes)..' MIN'
end,false),418,288)
ui.bagTiming=put(label(bagCard,'Full bag sells immediately • Waiting',532,19,10,C.fade),16,328)
local airCard=put(card(farmPage,565,236),2,447)
put(label(airCard,'AIRDROPS',265,21,13,C.text,true),16,11)
put(button(airCard,'START',115,32,afStart,true),314,7)
put(button(airCard,'STOP',106,32,afStop,false),442,7)
ui.afStatus=put(label(airCard,'Idle',532,20,11,C.sub),16,44)
ui.afCrate=put(label(airCard,'Crate: none',532,19,10,C.fade),16,63)
put(frame(airCard,'AirLine',533,1,C.line),16,89)
put(label(airCard,'Item filter',185,23,11,C.text),16,99)
ui.afMode=put(button(airCard,af.mode=='exclude' and 'EXCLUDE SELECTED' or 'ONLY SELECTED',210,32,function()
  af.mode=af.mode=='exclude' and 'include' or 'exclude';ui.afMode.Text=af.mode=='exclude' and 'EXCLUDE SELECTED' or 'ONLY SELECTED';saveSettings()
end,false),339,96)
put(button(airCard,'EDIT ITEMS',194,28,function()
  ui.itemEditor.Visible=not ui.itemEditor.Visible
  pages.autofarm.CanvasSize=UDim2.fromOffset(0,ui.itemEditor.Visible and 1240 or 740)
end,false),355,136)
put(frame(airCard,'AirStatsDivider',533,1,C.line),16,172)
ui.airStats=put(label(airCard,'Opens detected 0  •  Golden Barretts 0  •  Runtime 00:00',533,20,10,C.sub),16,183)
ui.airTimer=put(label(airCard,'Next drop: estimated every 90 min',533,20,10,C.warn),16,207)
local fCard=put(card(farmPage,565,445),2,696)
fCard.Visible=false;ui.itemEditor=fCard
put(label(fCard,'SELECT AIRDROP ITEMS',520,19,11,C.text,true),16,8)
local search=Instance.new('TextBox');search.Name='ItemSearch';search.ClearTextOnFocus=false
search.BackgroundColor3=C.panel2;search.BorderSizePixel=0;search.Size=UDim2.fromOffset(532,34)
search.Position=UDim2.fromOffset(15,35);search.Font=Enum.Font.Gotham;search.TextSize=12
search.TextColor3=C.text;search.PlaceholderText='Search items';search.PlaceholderColor3=C.fade
search.Text='';search.Parent=fCard;round(search,7)
local pad=Instance.new('UIPadding');pad.PaddingLeft=UDim.new(0,11);pad.Parent=search
local itemScroll=Instance.new('ScrollingFrame');itemScroll.Name='ItemList';itemScroll.BackgroundColor3=C.black
itemScroll.BorderSizePixel=0;round(itemScroll,8);itemScroll.Position=UDim2.fromOffset(15,76)
itemScroll.Size=UDim2.fromOffset(532,313);itemScroll.ScrollBarThickness=3;itemScroll.ScrollBarImageColor3=C.red
itemScroll.Parent=fCard
local itemButtons={}
for _,item in ipairs(airdropCatalog) do
  local key=item:lower()
  local btn=Instance.new('TextButton');btn.Name=item;btn.Size=UDim2.fromOffset(506,28)
  btn.BackgroundColor3=C.panel2;btn.BorderSizePixel=0;btn.TextColor3=C.text
  btn.Font=Enum.Font.Gotham;btn.TextSize=11;btn.TextXAlignment=Enum.TextXAlignment.Left
  btn.Parent=itemScroll;round(btn,5)
  local function refresh() btn.Text=(af.selected[key] and '  [x]  ' or '  [ ]  ')..item end
  refresh()
  table.insert(state.connected,btn.Activated:Connect(function()
    af.selected[key]=not af.selected[key];refresh();saveSettings()
  end))
  table.insert(itemButtons,{name=item:lower(),widget=btn})
end
local function filterItemButtons()
  local q=search.Text:lower();local row=0
  for _,item in ipairs(itemButtons) do
    local yes=(q=='' or item.name:find(q,1,true))~=nil
    item.widget.Visible=yes
    if yes then item.widget.Position=UDim2.fromOffset(7,row*31+6);row=row+1 end
  end
  itemScroll.CanvasSize=UDim2.fromOffset(0,row*31+10)
end
filterItemButtons()
table.insert(state.connected,search:GetPropertyChangedSignal('Text'):Connect(filterItemButtons))
put(label(fCard,'Use search to choose exact item names. Preferences save locally.',526,37,10,C.sub),15,397)
end
local shopPage=pages.shops
put(label(shopPage,'Gunshop',518,35,25,C.text,true),2,0)
put(label(shopPage,'Quick access',518,20,11,C.sub),2,38)
local gunCard=put(card(shopPage,565,185),2,75)
put(label(gunCard,'OPEN GUNSHOP',510,25,14,C.text,true),16,12)
put(label(gunCard,'Attempts the normal Gunshop interface.',524,24,12,C.sub),16,47)
put(label(gunCard,'Purchases still require the server to approve shop access.',524,41,11,C.warn),16,74)
put(button(gunCard,'OPEN GUNSHOP',533,43,openGunshop,true),16,125)

local config=pages.settings
put(label(config,'Settings',520,38,26,C.text,true),2,0)
put(label(config,'General controls and diagnostics',520,21,11,C.sub),2,39)
headerSection(config,'GENERAL',79)
local genCard=put(card(config,565,195),2,107)
ui.tutorial=settingLine(genCard,'Tutorial status','Read the actual game completion state',10,'RECHECK',function()
  local tasks=liveModule('ClientTasks')
  if tasks and type(tasks.HasCompletedTutorial)=='function' then
    local ok,done=pcall(tasks.HasCompletedTutorial)
    if ok then state.tutorialReady=done==true;checkpoint();log(done and 'Bank tutorial complete' or 'Bank tutorial not complete');return end
  end
  warning('Tutorial status unavailable')
end)
settingLine(genCard,'Skip Bayview intro','TEST: bank mission remains required',70,'TRY SKIP',trySkipBayview)
settingLine(genCard,'Reset window','Return REDLINE to center',130,'CENTER',resetWindow)
headerSection(config,'MOVEMENT',322)
local flightCard=put(card(config,565,148),2,348)
put(label(flightCard,'Velocity speed',296,24,13,C.text,true),17,12)
ui.speedText=put(label(flightCard,tostring(state.speed)..' studs/s',224,23,12,C.sub),327,13);ui.speedText.TextXAlignment=Enum.TextXAlignment.Right
for i,v in ipairs(speedOptions) do
  put(button(flightCard,tostring(v),165,36,function()
    if state.running then warning('Stop quest before editing speed');return end
    state.speed=v;saveSettings();ui.speedText.Text=tostring(v)..' studs/s'
  end),17+(i-1)*177,45)
end
ui.noclip=settingLine(flightCard,'Noclip','Shared by all movement systems',92,state.noclip and 'ON' or 'OFF',function()
  if state.running then warning('Stop quest before changing noclip');return end
  state.noclip=not state.noclip;saveSettings();ui.noclip.Text=state.noclip and 'ON' or 'OFF'
end)
headerSection(config,'TRACKER',514)
local trackerCard=put(card(config,565,252),2,542)
local function textField(parent,caption,x,y,initial,placeholder,callback,private)
  put(label(parent,caption,520,18,10,C.fade,true),x,y)
  local b=Instance.new('TextBox');b.Name='Field';b.ClearTextOnFocus=false;b.MultiLine=false
  b.BackgroundColor3=C.panel2;b.BorderSizePixel=0;b.Size=UDim2.fromOffset(527,36)
  b.Position=UDim2.fromOffset(x,y+23);b.Font=Enum.Font.Gotham;b.TextSize=12
  b.TextColor3=C.text;b.PlaceholderText=placeholder;b.PlaceholderColor3=C.fade
  b.Text=private and '' or initial;b.TextXAlignment=Enum.TextXAlignment.Left;b.Parent=parent;round(b,7)
  local pad=Instance.new('UIPadding');pad.PaddingLeft=UDim.new(0,11);pad.Parent=b
  table.insert(state.connected,b.FocusLost:Connect(function()
    if not private or #b.Text>0 then callback(b.Text) end
    if private then b.Text='' end
  end))
  return b
end
textField(trackerCard,'TRACKER URL',17,13,state.url,'https://tracker.example',function(v)
  state.url=v:gsub('%s+','');saveSettings()
end,false)
textField(trackerCard,'ACCESS TOKEN',17,84,'','Private token',function(v)
  state.ingest=v:gsub('%s+','');saveSettings()
end,true)
put(button(trackerCard,'CHECK CONNECTION',527,41,function()
  task.spawn(function()
    local result,err=http('GET','/api/account/'..player.Name)
    log(result and 'Tracker connected' or ('Tracker: '..tostring(err)))
  end)
end,true),17,164)
put(label(trackerCard,'Tracker runs separately from Roblox. Keep the token private.',525,19,10,C.sub),17,219)
headerSection(config,'DIAGNOSTICS',816)
local diag=put(card(config,565,295),2,844)
put(label(diag,'Recent errors and quest events',523,25,12,C.text,true),15,9)
local logText=Instance.new('TextBox');logText.Name='LogText';logText.MultiLine=true
logText.ClearTextOnFocus=false;logText.TextEditable=false
logText.BackgroundColor3=C.black;logText.BorderSizePixel=0;round(logText,8)
logText.Position=UDim2.fromOffset(15,41);logText.Size=UDim2.fromOffset(535,175)
logText.Text='No errors yet';logText.TextColor3=C.sub;logText.Font=Enum.Font.Code
logText.TextSize=11;logText.TextXAlignment=Enum.TextXAlignment.Left
logText.TextYAlignment=Enum.TextYAlignment.Top;logText.TextWrapped=true
logText.Parent=diag
put(button(diag,'COPY ERROR LOG',535,41,function()
  local okay,data=copyDiagnostics();logText.Text=data
  if not okay then logText.TextEditable=true;logText:CaptureFocus() end
end,true),15,229)
local function refreshLogs()
  local lines={}
  for i=math.max(1,#state.history-11),#state.history do
    table.insert(lines,state.history[i])
  end
  logText.Text=#lines>0 and table.concat(lines,'\n') or 'No errors yet'
end
local stageNames={waiting='Waiting',main_ghost='Main ghost',quest_accepted='Quest accepted',speaker_pickup='Picking up speaker',
 speaker_equipped='Speaker equipped',reacquire_speaker='Reacquiring speaker',ghost_travel='Traveling to ghost',
 ghost_dialogue='Talking to ghost',return_main='Returning to main ghost',key_check='Checking key',respawning='Respawning',quest_verify='Verifying quest'}
local function hhmmss(t)
  t=math.max(0,math.floor(t));return ('%02d:%02d:%02d'):format(math.floor(t/3600),math.floor(t/60)%60,t%60)
end
local sessionStart=os.clock()
local refreshAt=0
local lastBagRefresh=0
local lastBankRefresh=0
local bagRows={}
local function updateUI()
  if not main.Parent or state.closed then return end
  if os.clock()<refreshAt then return end
  refreshAt=os.clock()+.6
  ui.homeRuntime.Text=hhmmss(os.clock()-sessionStart)
  if os.clock()-lastBagRefresh>1.5 then
    lastBagRefresh=os.clock()
    bag.tick()
    if ui.bagStatus then
      ui.bagStatus.Text=bag.status
      ui.bagWeight.Text=bag.informationReady and (string.format('%.1f / %.1f kg',bag.weight,bag.capacity)) or '-- / -- kg'
      ui.bagValue.Text=bag.informationReady and ('$'..tostring(math.floor(bag.value))) or '--'
      ui.bagFill.Size=UDim2.fromOffset(math.floor(533*bag.percent),6)
      ui.bagPreferred.Text=bag.informationReady and ('Next: '..bag.seller) or 'Unavailable'
      local seconds=bag.aboveSince and math.max(0,bag.earlyMinutes*60-(os.clock()-bag.aboveSince)) or nil
      ui.bagTiming.Text=bag.selling and 'Selling in progress' or bag.percent>=.999 and 'Bag full: attempting to sell' or seconds and ('Early sell in '..hhmmss(seconds)) or 'Full bag sells immediately • >25% starts countdown'
      for _,v in ipairs(bagRows) do v:Destroy() end
      bagRows={}
      local total=0
      for i,item in ipairs(bag.items) do
        local t=put(label(ui.bagItems,item.name..'  x'..item.count..'     $'..math.floor(item.value),510,20,10,C.sub),8,(i-1)*21)
        table.insert(bagRows,t);total=total+1
      end
      if total==0 then table.insert(bagRows,put(label(ui.bagItems,'Bag empty',510,19,10,C.fade),8,4)) end
      ui.bagItems.CanvasSize=UDim2.fromOffset(0,math.max(90,total*21+7))
    end
  end
  if os.clock()-lastBankRefresh>1.8 then lastBankRefresh=os.clock();bank.check() end
  if ui.bankStep then
    local step=bank.steps[bank.index]
    ui.bankStep.Text=tostring(bank.index)..' / '..tostring(#bank.steps)..'  •  '..step[2]
    if ui.bankHint then ui.bankHint.Text=step[3] end
    ui.bankStatus.Text=bank.status
    local count=0;for _,r in ipairs(bank.steps) do if bank.points[r[1]] then count=count+1 end end
    ui.bankCaptured.Text=tostring(count)..' of '..tostring(#bank.steps)..' waypoints saved'
  end
  if ui.airStats then
    ui.airStats.Text='Opens detected '..tostring(af.openCount or 0)..'  •  Golden Barretts '..tostring(af.goldenCount or 0)..'  •  Runtime '..hhmmss(os.clock()-sessionStart)
    -- 90-minute anchor based on user's observed schedule: Oct 19 2026, 11:30 PM ET (03:30 UTC Oct 20).
    local anchorTime=1792467000
    local now=DateTime.now().UnixTimestamp
    local delta=(5400-((now-anchorTime)%5400))%5400
    if delta==0 then delta=5400 end
    ui.airTimer.Text='Next drop (90 min, estimated): '..hhmmss(delta)
  end
  if ui.afStatus then ui.afStatus.Text=af.status;ui.afCrate.Text=af.currentCrate and 'Tracked' or 'None' end
  ui.homeSync.Text=(not isListed) and 'Unlisted account' or (not safeUrl() or #state.ingest<32) and 'Not connected' or state.networkError~='' and 'Connection error' or 'Configured (unverified)'
  ui.questStatus.Text=state.questCompleted and 'Completed' or state.paused and 'Paused' or state.running and 'Running' or 'Idle'
  ui.questStep.Text=state.questCompleted and 'Complete' or stageNames[state.phase] or tostring(state.phase)
  ui.questCount.Text=tostring(state.confirmedGhost)..' / 9'
  tween(ui.progressFill,.3,{Size=UDim2.fromOffset(532*math.clamp(state.confirmedGhost/9,0,1),8)})
  ui.start.Text=state.questCompleted and 'QUEST COMPLETED' or state.running and 'IN PROGRESS' or 'START QUEST'
  ui.start.TextColor3=C.text
  ui.pause.Text=state.paused and 'RESUME' or 'PAUSE'
  ui.silentInfo.Text=combat.silentStatus
  if ui.spasInfo then ui.spasInfo.Text='SPAS: '..combat.spasStatus end
  ui.targetLabel.Text='Current target: '..(combat.currentTarget and combat.currentTarget.Name or 'none')
  refreshLogs()
end
table.insert(state.connected,RunService.Heartbeat:Connect(updateUI))
local function resizeUI()
  local viewport=workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1200,750)
  local factor=math.min(1,math.max(.4,math.min((viewport.X-20)/WIDTH,(viewport.Y-20)/HEIGHT)))
  state.targetScale=factor;uiScale.Scale=factor
end
resizeUI()
local screenW=0;local screenH=0
table.insert(state.connected,RunService.RenderStepped:Connect(function()
  local cam=workspace.CurrentCamera
  local view=cam and cam.ViewportSize or Vector2.new(1200,720)
  if view.X~=screenW or view.Y~=screenH then screenW=view.X;screenH=view.Y;resizeUI() end
end))
state.close=function()
  if state.closed then return end
  state.closed=true;bag.selling=false;bag.token=bag.token+1;afStop();stop();endCombat()
  for _,con in ipairs(state.connected) do pcall(function()con:Disconnect()end) end
  if screen then screen:Destroy() end
end
local intro=frame(screen,'Loading',324,147,C.side,15)
intro.AnchorPoint=Vector2.new(.5,.5);intro.Position=UDim2.fromScale(.5,.5);outline(intro,.16,Color3.fromRGB(103,41,58))
put(frame(intro,'Accent',4,61,C.red,2),17,22)
put(label(intro,'REDLINE',217,34,25,C.text,true),33,18)
put(label(intro,'BY RAHAMIDALI',212,20,10,C.warn,true),33,55)
local miniBadge=put(frame(intro,'Badge',60,28,C.redDim,7),244,22)
put(label(miniBadge,'v17.0',60,28,11,C.text,true),0,0).TextXAlignment=Enum.TextXAlignment.Center
local loadBar=put(frame(intro,'LoadBar',286,5,C.panel2,3),18,108)
local loadFill=frame(loadBar,'Fill',0,5,C.red,3)
put(label(intro,'STARTING',215,19,10,C.fade,true),18,85)
main.Visible=false
showPage('home')
task.spawn(function()
  tween(loadFill,.78,{Size=UDim2.fromOffset(286,5)})
  task.wait(.85)
  if state.closed then return end
  main.Size=UDim2.fromOffset(324,147);main.Visible=true
  if intro and intro.Parent then intro:Destroy() end
  tween(main,.35,{Size=UDim2.fromOffset(WIDTH,HEIGHT)})
end)
task.spawn(function()
  syncExisting()
  if state.questCompleted then log('Quest already completed') else log('REDLINE ready') end
end)
