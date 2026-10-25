-- REDLINE | WANTED v30.1 - by rahamidali
-- Authoritative base: supplied REDLINE_v29.6.lua; Combat expansion and manual movement controls.
-- v30.1: preserves Astra v30 Combat; adds tutorial, bag, teams, auth UI and platform fixes.
-- Build target: pc
-- Preserves the earlier Pasted text(9).txt master requirements and tracker integration.
-- Explicit quest phases, native mobile interactions, exact recorded ghost/camera route.
-- Verified native Bank elevator ride, then original free_c4-through-escape route; first two coordinates retained as reference.
-- Five-second connected pullback chains, bounded recovery, coordinated setup/farms.
-- Compact native UI and eight-second cosmetic startup; module readiness is separate.
-- Offline validation only: no live Roblox/Delta execution is claimed.
-- Native request timeout is UNKNOWN, never proof of success; retries are quarantined.
-- Tracker authentication/backend are unchanged. No Robux purchase path is invoked.
-- UseElevator: native requirement evaluation / didUse / authoritative step advancement; never infer credit from lift motion.
-- Export lists Bones reward; dropped key behavior also follows supplied live observations.
-- Actual quest completion and verified inventory receipt remain separate evidence.
-- Crash journal: REDLINE_crash_<PlaceId>_<UserId>.txt and _previous.txt (best effort).
local Players = game:GetService('Players')
local RunService = game:GetService('RunService')
local UserInputService = game:GetService('UserInputService')
local HttpService = game:GetService('HttpService')
local player = Players.LocalPlayer
if not player then return end
if game.PlaceId ~= 14438406081 then warn('[REDLINE] Unsupported game.'); return end

do
  local closed={}
  for _,key in ipairs({'REDLINEHubV30','REDLINEHubV29','REDLINEHubV28','REDLINEHubV27','REDLINEHubV26','REDLINEHubV23','REDLINEHubV20','REDLINEHubV19','REDLINEHubV18','REDLINEHubV17','REDLINEHubV16','REDLINEHubV15','REDLINEHubV14','REDLINEHubV13','REDLINEHubV12','REDLINEHubV11','REDLINEHubV10','REDLINEHubV9','REDLINEHubV8','REDLINEHubV7','WANTEDHubV6'})do
    local prior=_G[key]
    if type(prior)=='table'and type(prior.close)=='function'and not closed[prior]then closed[prior]=true;pcall(prior.close,true)end
  end
end

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
local route = {["ghosts"]={{["lookZ"]=-0.1498,["camY"]=73.7018,["lookY"]=-0.9848,["y"]=52.998,["x"]=-6997.0044,["camZ"]=3116.8438,["z"]=3113.9233,["camX"]=-6995.2905,["name"]="evil ghost",["lookX"]=-0.0879},{["lookZ"]=0.1641,["camY"]=41.4685,["lookY"]=-0.9848,["y"]=20.7648,["x"]=-4891.2925,["camZ"]=3726.0608,["z"]=3729.26,["camX"]=-4890.1826,["name"]="fisherman ghost",["lookX"]=-0.0569},{["lookZ"]=-0.1341,["camY"]=580.2546,["lookY"]=-0.9848,["y"]=559.5509,["x"]=-4434.6221,["camZ"]=2357.0928,["z"]=2354.4771,["camX"]=-4436.7725,["name"]="lava ghost",["lookX"]=0.1103},{["lookZ"]=-0.047,["camY"]=201.6951,["lookY"]=-0.9848,["y"]=180.9913,["x"]=-1112.9805,["camZ"]=3286.7471,["z"]=3285.8315,["camX"]=-1116.2405,["name"]="millitary ghost",["lookX"]=0.1672},{["lookZ"]=0.044,["camY"]=89.8018,["lookY"]=-0.9848,["y"]=69.098,["x"]=702.5739,["camZ"]=2821.4502,["z"]=2822.3088,["camX"]=699.2984,["name"]="cornmaze ghost",["lookX"]=0.168},{["lookZ"]=0.1426,["camY"]=117.4017,["lookY"]=-0.9848,["y"]=105.7665,["x"]=1139.7098,["camZ"]=1808.2115,["z"]=1809.6791,["camX"]=1140.7297,["name"]="manor ghost",["lookX"]=-0.0991},{["lookZ"]=-0.0329,["camY"]=52.9129,["lookY"]=-0.9848,["y"]=39.8315,["x"]=-135.0597,["camZ"]=-1749.527,["z"]=-1749.9135,["camX"]=-137.0649,["name"]="hotel ghost",["lookX"]=0.1705},{["lookZ"]=-0.108,["camY"]=365.606,["lookY"]=-0.9799,["y"]=344.998,["x"]=-3470.0859,["camZ"]=111.4928,["z"]=109.3864,["camX"]=-3466.8157,["name"]="watching ghost",["lookX"]=-0.1677},{["lookZ"]=-0.1729,["camY"]=418.7398,["lookY"]=-0.9848,["y"]=398.0361,["x"]=-6339.5239,["camZ"]=-838.8528,["z"]=-842.2248,["camX"]=-6339.2144,["name"]="ice ghost",["lookX"]=-0.0159}},["main"]={["lookZ"]=-0.1292,["camY"]=63.7964,["lookY"]=-0.9848,["y"]=43.0927,["x"]=-6723.6807,["camZ"]=736.4985,["z"]=733.9783,["camX"]=-6725.9424,["lookX"]=0.116},["speaker"]={["lookZ"]=-0.1652,["camY"]=69.1876,["lookY"]=-0.9642,["y"]=48.8853,["x"]=-6711.0249,["camZ"]=721.6886,["z"]=718.4673,["camX"]=-6715.0679,["lookX"]=0.2073}}
-- Item locations must be physically consistent with the quest giver.
-- Corrected pickup is about 23 studs from the quest giver.
local savedSpeakerPath = 'REDLINE_speaker_' .. tostring(game.PlaceId) .. '.json'
local function distanceBetween(a,b)
  return (Vector3.new(a.x,a.y,a.z)-Vector3.new(b.x,b.y,b.z)).Magnitude
end
local speedOptions = {75,80,85,90}
local settingsFile = 'REDLINE_v23_settings.json'
local checkpointFile = 'REDLINE_v23_checkpoint_' .. tostring(player.UserId) .. '.json'
local queueFile = 'REDLINE_v23_outbox_' .. tostring(player.UserId) .. '.json'
local state = {
  running=false, stopping=false, awaiting=false, token=0, connected={}, noclipConn=nil, collisionOriginal={},
  platformTarget='pc',speed=75, noclip=false, paused=false, pauseEach=false, tutorialReady=false, missionStarted=false, confirmedGhost=0,
  attemptedGhost=0, amuletHeld=false, questCompleted=false, selectedPage='home', phase='waiting',
  retries=0, session=HttpService:GenerateGUID(false), networkError='', trackerConnected=false, checkpointStamp=0, died=false, routeError='',
  url='https://rahamidali.pythonanywhere.com', status='Idle', history={}, errors={}, missionVerified=false, verificationSource='Unknown',
}
_G.REDLINEHubV30=state;_G.REDLINEHubV29=state
_G.REDLINEHubV28=state
_G.REDLINEHubV27=state
_G.REDLINEHubV26=state
_G.REDLINEHubV23=state
_G.REDLINEHubV20=state
state.close=function()
  if state.closed then return end
  state.closed=true;state.running=false;state.token=state.token+1
  if state.auth then
    state.auth.stopped=true
    if state.auth.viewConn then pcall(function()state.auth.viewConn:Disconnect()end)end
    if state.auth.gui and state.auth.gui.Parent then state.auth.gui:Destroy()end
  end
  if state.camera and state.camera.current then state.camera.release(state.camera.current.lease)end
  if state.motion then state.motion.release()end
  if state.collision then
    for part,value in pairs(state.collision.original)do if part.Parent then pcall(function()part.CanCollide=value end)end end
    if state.collision.connection then state.collision.connection:Disconnect()end
  end
  if state.bankFarm and state.bankFarm.closeObserver then state.bankFarm.closeObserver()end
  for _,connection in ipairs(state.connected)do pcall(function()connection:Disconnect()end)end
  if state.gui then state.gui:Destroy()end
end
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
  local lines={'REDLINE v30 | RahamidAli','Account: '..player.Name,'UserId: '..tostring(player.UserId),
    'PlaceId: '..tostring(game.PlaceId),'Quest phase: '..tostring(state.phase),
    'Confirmed ghosts: '..tostring(state.confirmedGhost),'Attempted ghosts: '..tostring(state.attemptedGhost),
    'Mission verified: '..tostring(state.missionVerified),'Amulet equipped: '..tostring(state.amuletHeld),
    'Key in inventory: '..tostring(state.keyInInventory)..' / quest complete: '..tostring(state.serverQuestComplete),'Last network issue: '..tostring(state.networkError),
    '--- LOG ---'}
  for _,entry in ipairs(state.history) do table.insert(lines,entry) end
  local output=table.concat(lines,'\n')..(state.diagnostics and state.diagnostics.copyText()or '')
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
-- Small local crash journal. Native process crashes cannot be caught with pcall.
state.diagnostics={records={},previous='',sequence=0,writes={},pending=false,persistent=false}
do
  local d=state.diagnostics
  d.path='REDLINE_crash_'..tostring(game.PlaceId)..'_'..tostring(player.UserId)..'.txt'
  d.previousPath=d.path:gsub('%.txt$','_previous.txt')
  if type(readfile)=='function' then
    local ok,previous=pcall(readfile,d.path)
    if not ok or type(previous)~='string' or previous=='' then ok,previous=pcall(readfile,d.previousPath)end
    if ok and type(previous)=='string' then d.previous=previous:sub(-24000)end
  end
  if d.previous~='' and type(writefile)=='function' then pcall(writefile,d.previousPath,d.previous)end
  function d.text()
    return ('REDLINE v30 | session %s | UTC %s\n'):format(state.session,os.date('!%Y-%m-%d %H:%M:%S'))..table.concat(d.records,'\n')
  end
  function d.flush()
    if type(writefile)~='function' then return end
    local now=os.clock()
    while d.writes[1] and now-d.writes[1]>=1 do table.remove(d.writes,1)end
    -- At most eight journal writes per second; only one deferred flush exists.
    if #d.writes>=8 then
      if not d.pending then
        d.pending=true
        task.delay(math.max(.02,1-(now-d.writes[1])+.01),function()
          d.pending=false;if not state.closed then d.flush()end
        end)
      end
      return
    end
    table.insert(d.writes,now)
    d.persistent=pcall(writefile,d.path,d.text():sub(-24000))
  end
  function d.mark(stage,result,path)
    d.sequence=d.sequence+1
    local work=state.work;local lease=work and work.lease
    local motion=state.motion
    local character=player.Character;local root=character and character:FindFirstChild('HumanoidRootPart')
    local npc=state.quest and state.quest.currentNPC or '?'
    local line=('#%d %.3f ghost=%s token=%s stage=%s path=%s owner=%s valid=%s root=%s move=%s result=%s'):format(
      d.sequence,os.clock(),tostring(npc),tostring(lease and lease.token or state.token),stage,tostring(path or 'observation'),
      tostring(lease and lease.owner or 'none'),tostring(lease~=nil and not state.closed and (not motion or motion.ownerActive(lease.owner))or false),
      tostring(root~=nil),tostring(motion and motion.mode or 'none'),tostring(result or ''):gsub('[\r\n]',' '):sub(1,160))
    table.insert(d.records,line:sub(1,360));while #d.records>64 do table.remove(d.records,1)end
    note('TRACE',line);d.flush()
  end
  d.snapshots={}
  function d.snapshot(kind,values)
    local parts={}
    for key,value in pairs(values)do if type(value)=='string'or type(value)=='number'or type(value)=='boolean'or typeof(value)=='Vector3'then table.insert(parts,tostring(key)..'='..tostring(value))end end
    table.sort(parts);local line=table.concat(parts,'; '):sub(1,1800)
    if d.snapshots[kind]==line then return end;d.snapshots[kind]=line;d.mark(kind,line)
  end
  function d.copyText()
    local details={};for kind,value in pairs(d.snapshots)do table.insert(details,kind..': '..value)end;table.sort(details)
    return '\n--- CURRENT STATE ---\n'..table.concat(details,'\n')..'\n--- CURRENT CRASH CHECKPOINTS ---\n'..d.text()..'\n--- PREVIOUS SESSION ---\n'..(d.previous~=''and d.previous or 'No saved previous session')
  end
  d.mark('session_started','touch='..tostring(UserInputService.TouchEnabled)..'; journal writes are best effort')
end

-- The speaker waypoint is embedded from the user's in-game measurement.
-- Old executor overrides are ignored because earlier releases saved an incorrect location.

-- Wiki-cataloged natural loot. CashPallet/Bank Cash Pile and Military Cash Pile are
-- environmental cash pickups handled by specialized farm controls, not bag items.
-- Cargo Card is a mission access item, not a sellable ground valuable.
-- Attachments are NOT separate guns: each firearm has one canonical entry.
-- WANTED item source: https://rblx-wanted.fandom.com/wiki/Items
-- WANTED weapon source: https://rblx-wanted.fandom.com/wiki/Weapons
state.naturalLootCatalog={
  'Golden Barrett M82','Golden AK-47','Golden Deagle','Barrett M82','SPAS-12',
  'M9','Glock 18c','Deagle','AK-47','M4A1',
  'AUG A1','ARX-160','FN FAL','AWM','SVD',
  'Model 870','Benelli M1014','Sawn Off','Kriss Vector','Uzi',
  'Skorpion','MP5K','UMP 45','Light Carbine','P90',
  'M60','RPG-7','Grenade Launcher','Flamethrower','Raygun',
  'Silver Bar','Silver Ring','PearWatch','PearPods','PearPhone',
  'HDD','PSU','GoldPhone','PearPad','Batteries',
  'Capacitors','Wires','CPU Fan','RAM','Cheap White Sneakers',
  'Cheap Black Sneakers','Cheap Brown Sneakers','Gold Bar','Gold Ring','Sapphire Ring',
  'Silver Chain','GoldWatch','GoldPods','PearBook','Flash Drive',
  'Cheap Laptop','Black Boots','Brown Boots','Gold Brick','Sapphire',
  'Ruby','Ruby Ring','Gold Chain','Emerald Ring','GoldPad',
  'GoldBook','GPU','Secret Files','Sky James Reds','Sky James Golds',
  'Emerald','Amethyst','Diamond','Pearl Necklace','Diamond Ring',
  'Amethyst Ring','Rollie','TPU','Bitcoin','Gold Bricks',
  'Money Printer','Present','Priceless Watch',
}
state.naturalLootLookup={};state.canonicalNames={}
for _,name in ipairs(state.naturalLootCatalog) do
 state.naturalLootLookup[name:lower()]=true;state.canonicalNames[name:lower()]=name
end
state.weaponBaseNames={
  'Golden Barrett M82','Golden AK-47','Golden Deagle','Barrett M82','SPAS-12',
  'M9','Glock 18c','Deagle','AK-47','M4A1',
  'AUG A1','ARX-160','FN FAL','AWM','SVD',
  'Model 870','Benelli M1014','Sawn Off','Kriss Vector','Uzi',
  'Skorpion','MP5K','UMP 45','Light Carbine','P90',
  'M60','RPG-7','Grenade Launcher','Flamethrower','Raygun',
}
state.weaponLookup={}
for _,name in ipairs(state.weaponBaseNames) do state.weaponLookup[name:lower()]=true end
-- Only include cataloged objects in ordinary airdrop/world pickup filtering;
-- don't infer hidden contents for sealed crates.
state.airdropOnlyCatalog=state.naturalLootCatalog
state.globalLoot={mode='exclude',selected={},simple={Common=true,Uncommon=true,Rare=true,Epic=true,Legendary=true,Mythic=true},overrides={}}
local af={pending={},running=false,token=0,mode='exclude',selected={},status='Idle',currentCrate=nil,seen={},lastError='',attempts=0}
af.queuedSweeps={};af.openCount=0;af.goldenCount=0;af.goldenSeen={};af.knownFloorIds={};af.watchers={}
state.airdrop=af
local bag={status='Idle',selling=false,token=0,enabled=true,earlyMinutes=15,aboveSince=nil,lastFail=-math.huge,items={},weight=0,capacity=0,value=0,percent=0,remaining=nil,seller='Unknown',error='',lastSold=0,informationReady=false}
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
if not priorRoute and type(readfile)=='function' then
  local exists,raw=pcall(readfile,bankRouteFile)
  if exists and type(raw)=='string' then priorRoute={};bank.routeParseError=true end
end
bank.routeSource=priorRoute and 'Saved account route' or (player.UserId==11496026321 and 'Supplied account route' or 'Embedded fallback route')
if priorRoute then
  bank.points=type(priorRoute.points)=='table' and priorRoute.points or {}
  bank.routePlace=priorRoute.placeId
else bank.routePlace=game.PlaceId end
-- User-measured bank tutorial coordinates, Oct 19 2026. User-specific edits override these defaults.
do
  local defaults={
    bank_entrance={x=-401.82,y=43.37,z=-1242.68,lookX=.67,lookY=-.2,lookZ=.71},
    bank_upper={x=-326,y=549.59,z=-1186.12,lookX=.19,lookY=-.96,lookZ=.18},
    free_c4={x=-327.87,y=549.59,z=-1188.6,lookX=.82,lookY=-.51,lookZ=.27},
    vault_throw={x=-399.18,y=616.76,z=-1240.64,lookX=.29,lookY=.04,lookZ=.96},
    retreat_detonate={x=-451.53,y=616.76,z=-1200.18,lookX=.87,lookY=-.27,lookZ=-.41},
    vault_enter={x=-389.37,y=615.45,z=-1202.38,lookX=.35,lookY=-.38,lookZ=.85},
    cash_pickup={x=-388.47,y=617.44,z=-1200.17,lookX=.35,lookY=-.38,lookZ=.85},
    escape_exit={x=-453.55,y=176.97,z=-1472.25,lookX=-.25,lookY=-.38,lookZ=-.89},
    escape={x=-634.28,y=39.99,z=-1534.06,lookX=-.39,lookY=-.22,lookZ=-.89}
  }
  if not priorRoute then bank.points=defaults end
end
bank.running=false;bank.token=0;bank.autoStatus='Ready · '..bank.routeSource
function bank.validateRoute()
  if bank.routePlace and tonumber(bank.routePlace)~=game.PlaceId then return false,'Saved route belongs to another place' end
  for _,step in ipairs(bank.steps) do
    local p=bank.points[step[1]]
    if type(p)~='table' then return false,'Missing recorded waypoint: '..step[1] end
    for _,axis in ipairs({'x','y','z'}) do
      local v=p[axis]
      if type(v)~='number' or v~=v or math.abs(v)>1000000 then return false,'Invalid '..axis..' at '..step[1] end
    end
    for _,axis in ipairs({'lookX','lookY','lookZ'}) do
      local v=p[axis]
      if v~=nil and (type(v)~='number' or v~=v or math.abs(v)>1.01) then return false,'Invalid look at '..step[1] end
    end
  end
  return true,bank.routeSource
end

local function baseLootName(item)
 if type(item)~='string' then return '' end
 local lower=item:lower():match('^%s*(.-)%s*$') or '';lower=lower:gsub('%s+',' ')
 -- Exact wiki-defined names first: Golden Barrett is never just Barrett.
 if state.naturalLootLookup[lower] then return lower end
 -- Multiple present/printer variants share the category and Mythic preference.
 if lower:sub(1,8)=='present ' or lower:sub(1,8)=='present:' then return 'present' end
 if lower:sub(1,14)=='money printer ' or lower:sub(1,14)=='money printer:' then return 'money printer' end
 -- Weapon sights/attachments can appear as suffixes; the base gun stays the same.
 -- Longest match first keeps similar base names independent.
 local best=''
 for _,weapon in ipairs(state.weaponBaseNames) do
  local n=weapon:lower()
  if #n>#best and lower:sub(1,#n)==n then
   local separator=lower:sub(#n+1,#n+1)
   if separator==' ' or separator=='(' or separator=='[' or separator==':' or separator=='|' or separator=='-' then
    local suffix=lower:sub(#n+1):gsub('^[%s%p]+','')
    -- Attachment labels only; an unknown weapon variant keeps its own identity.
    local attachment=false
    for _,label in ipairs({'scope','sight','suppressor','flashlight','laser','red dot','reflex','holographic','tactical','extended mag','compensator','grip'}) do
      if suffix:sub(1,#label)==label then attachment=true;break end
    end
    if attachment then best=n end
   end
  end
 end
 if best~='' then return best end
 return lower
end
local function passesGlobalLoot(item,context)
  local key=baseLootName(item)
  if key=='' then return false end
  local override=state.globalLoot.overrides[key]
  if override=='collect' then return true end
  if override=='skip' then return false end
  if context=='airdrop' then
    local selected=af.selected[key]==true
    if (af.mode=='include' and not selected) or (af.mode=='exclude' and selected) then return false end
  end
  local rarity=state.globalLoot.rarity and state.globalLoot.rarity(item) or 'Unclassified'
  if state.globalLoot.simple[rarity]~=nil then return state.globalLoot.simple[rarity] end
  local selected=state.globalLoot.selected[key]==true
  return (state.globalLoot.mode=='include' and selected) or (state.globalLoot.mode=='exclude' and not selected)
end
state.globalLoot.eligible=passesGlobalLoot
local function filterMatches(item) return passesGlobalLoot(item,'airdrop') end
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

local configSaved=readFile(settingsFile) or readFile('REDLINE_v22_settings.json') or readFile('REDLINE_v21_settings.json') or readFile('REDLINE_v20_settings.json') or readFile('REDLINE_v19_settings.json') or readFile('REDLINE_v18_settings.json') or readFile('REDLINE_v17_settings.json') or readFile('REDLINE_v16_settings.json') or readFile('REDLINE_v15_settings.json') or readFile('REDLINE_v14_settings.json') or readFile('REDLINE_v13_settings.json') or readFile('REDLINE_v12_settings.json') or readFile('REDLINE_v11_settings.json') or readFile('REDLINE_v10_settings.json') or readFile('REDLINE_v9_settings.json') or readFile('REDLINE_v8_settings.json') or readFile('REDLINE_v7_settings.json') or readFile('WANTED_v6_settings.json')
if configSaved then
  if tonumber(configSaved.speed) and table.find(speedOptions,tonumber(configSaved.speed)) then state.speed=tonumber(configSaved.speed) end
  -- Staged pauses from early builds are no longer enabled by default.
  -- Tutorial state is per Roblox account, not a global executor setting.
  -- Restore only the saved manual preference; automatic requirements are never persisted.
  state.noclip=configSaved.noclip==true
    if configSaved.airdropMode=='include' or configSaved.airdropMode=='exclude' then af.mode=configSaved.airdropMode end
  if type(configSaved.airdropSelected)=='table' then for _,n in ipairs(configSaved.airdropSelected) do if type(n)=='string' then af.selected[baseLootName(n)]=true end end end
  if configSaved.earlyMinutes==10 or configSaved.earlyMinutes==15 then bag.earlyMinutes=configSaved.earlyMinutes end
  if configSaved.globalLootMode=='include' or configSaved.globalLootMode=='exclude' then state.globalLoot.mode=configSaved.globalLootMode end
  if type(configSaved.globalLootSelected)=='table' then for _,name in ipairs(configSaved.globalLootSelected) do if type(name)=='string' then state.globalLoot.selected[baseLootName(name)]=true end end end
  if type(configSaved.globalRarity)=='table' then for name,on in pairs(configSaved.globalRarity) do if state.globalLoot.simple[name]~=nil and type(on)=='boolean' then state.globalLoot.simple[name]=on end end end
  if type(configSaved.globalOverrides)=='table' then for name,v in pairs(configSaved.globalOverrides) do if v=='collect' or v=='skip' then local key=baseLootName(name);if state.globalLoot.overrides[key]~='skip' then state.globalLoot.overrides[key]=v end end end end
end

-- Automatic client-reported telemetry: no shared secret in public script.
-- The server limits this endpoint to allowlisted account IDs and stores it as unverified.

local progress=readFile(checkpointFile) or readFile('REDLINE_v22_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v21_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v20_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v19_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v18_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v17_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v16_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v15_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v14_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v13_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v12_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v11_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v10_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v9_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v8_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v7_checkpoint_' .. tostring(player.UserId) .. '.json') or readFile('WANTED_v6_checkpoint_' .. tostring(player.UserId) .. '.json')
if progress then
  state.missionStarted=progress.missionStarted==true
  state.confirmedGhost=math.clamp(tonumber(progress.confirmedGhost) or 0,0,9)
  state.attemptedGhost=math.clamp(tonumber(progress.attemptedGhost) or 0,0,9)
  state.questCompleted=progress.questCompleted==true
  state.tutorialReady=progress.tutorialReady==true
end
local outbox=readFile(queueFile) or readFile('REDLINE_v22_outbox_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v21_outbox_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v20_outbox_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v19_outbox_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v18_outbox_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v17_outbox_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v16_outbox_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v15_outbox_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v14_outbox_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v13_outbox_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v12_outbox_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v10_outbox_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v9_outbox_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v8_outbox_' .. tostring(player.UserId) .. '.json') or readFile('REDLINE_v7_outbox_' .. tostring(player.UserId) .. '.json') or readFile('WANTED_v6_outbox_' .. tostring(player.UserId) .. '.json') or {}
if type(outbox)~='table' then outbox={} end
state.navigationSettings={mode='Direct',altitude=650,threshold=650,smartRespawn=false,minSaving=10,respawnCooldown=180,maxResets=2}
if configSaved and type(configSaved.navigation)=='table'then
 for k,v in pairs(configSaved.navigation)do
  if type(v)==type(state.navigationSettings[k])then state.navigationSettings[k]=v end
 end
end
if state.navigationSettings.mode~='High-Altitude'then state.navigationSettings.mode='Direct'end
state.navigationSettings.altitude=math.clamp(state.navigationSettings.altitude,150,2500)
state.navigationSettings.threshold=math.clamp(state.navigationSettings.threshold,250,5000)
state.navigationSettings.minSaving=math.clamp(state.navigationSettings.minSaving,10,120)
state.navigationSettings.respawnCooldown=180;state.navigationSettings.maxResets=2
state.windowSettings=configSaved and type(configSaved.window)=='table'and configSaved.window or {}
state.keybinds={minimizeLeftAlt=not (configSaved and type(configSaved.keybinds)=='table'and configSaved.keybinds.minimizeLeftAlt==false)}
local function saveSettings()
  local sels={};for n,on in pairs(af.selected) do if on then table.insert(sels,n) end end
  local other={};for name,active in pairs(state.globalLoot.selected) do if active then table.insert(other,name) end end
  local latest=readFile(settingsFile) or readFile('REDLINE_v22_settings.json') or readFile('REDLINE_v21_settings.json') or {}
  local c=state.combat
  if c then latest.fovColor=c.fovColor;latest.hitColor=c.hitColor;latest.fovAlpha=c.fovAlpha;latest.hitAlpha=c.hitAlpha;latest.ignoreFriends=c.ignoreFriends end
  local values={fovColor=latest.fovColor,hitColor=latest.hitColor,fovAlpha=latest.fovAlpha,hitAlpha=latest.hitAlpha,ignoreFriends=latest.ignoreFriends,speed=state.speed,noclip=state.manualNoclipEnabled==true,airdropMode=af.mode,airdropSelected=sels,globalLootMode=state.globalLoot.mode,globalLootSelected=other,globalRarity=state.globalLoot.simple,globalOverrides=state.globalLoot.overrides,bankVaults=state.bankFarm and state.bankFarm.selected or nil,bankUnknownPolicy=state.bankFarm and state.bankFarm.unknownPolicy or nil,bankCollectSmall=state.bankFarm and state.bankFarm.collectSmall,bankSkipGold=state.bankFarm and state.bankFarm.skipGold,bankSkipSilver=state.bankFarm and state.bankFarm.skipSilver,earlyMinutes=bag.earlyMinutes,combatWhitelist=latest.combatWhitelist or (configSaved and configSaved.combatWhitelist) or {},fovPixels=state.combat and state.combat.fovPixels or 175}
  for k,v in pairs(values)do latest[k]=v end
  latest.notifications=state.notifications and state.notifications.preferences or latest.notifications
  if c and c.v30 then latest.combat30=c.v30.settings;latest.combatPresets=c.v30.presets end
  latest.keybinds=state.keybinds
  latest.navigation=state.navigationSettings;latest.window=state.windowSettings;latest.lowAmmo=state.ammo and state.ammo.settings or latest.lowAmmo
  saveFile(settingsFile,latest)
end
local function checkpoint()
  if state.closed then return end
  saveFile(checkpointFile,{missionStarted=state.missionStarted,confirmedGhost=state.confirmedGhost,
    attemptedGhost=state.attemptedGhost,questCompleted=state.questCompleted,tutorialReady=state.tutorialReady,
    userId=player.UserId,placeId=game.PlaceId,ghostRouteVersion=29,questWaypoints=state.quest and state.quest.waypoints or {},
    keyCollectedPreviously=state.quest and state.quest.keyCollectedPreviously==true,
    questCompletionReceipt=state.quest and state.quest.completionReceipt})
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
  if not fn or not safeUrl() then return nil,'Executor HTTP request unavailable or tracker URL invalid' end
  local opts={Url=state.url:gsub('/+$','')..endpoint,Method=method,Headers={['Content-Type']='application/json'}}
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
  if state.closed or not isListed or state.flushingOutbox or #outbox==0 then return end
  state.flushingOutbox=true
  task.spawn(function()
    local processed=0
    while not state.closed and #outbox>0 and processed<40 do
      local entry=outbox[1];processed=processed+1
      local data,err=http('POST','/api/public/events',entry)
      if state.closed then break end
      if not data then state.networkError=tostring(err);state.trackerConnected=false;break end
      if outbox[1]==entry then table.remove(outbox,1)end
      if data.tracked==true then state.trackerConnected=true;state.networkError=''end
      if data.tracked==false then state.networkError='Username not on tracker list'end
      saveFile(queueFile,outbox)
    end
    state.flushingOutbox=false
  end)
end
local function report(event,phase,ghost,detail,confirmed)
  state.phase=phase or state.phase
  if event=='error'then note('ERROR',state.phase..': '..tostring(detail or ''))end
  if not isListed or state.closed then return end
  local e={username=player.Name,user_id=player.UserId,event=event,event_id=HttpService:GenerateGUID(false),
    session_id=state.session,phase=phase or state.phase,ghost=ghost or 0,detail=tostring(detail or ''):sub(1,230),confirmed=confirmed==true}
  if event=='heartbeat'and (not safeUrl()or #outbox>0)then return end
  if #outbox<120 then table.insert(outbox,e);saveFile(queueFile,outbox)end
  flushOutbox()
end

-- Automatic public telemetry is intentionally write-only.
-- Never trust public reports as a verified cross-device quest checkpoint.
local syncExisting=function() end
local function root()
  local ch=player.Character
  return ch and ch:FindFirstChild('HumanoidRootPart')
end
local function characterAlive()
  local ch=player.Character
  local hum=ch and ch:FindFirstChildOfClass('Humanoid')
  return hum~=nil and hum.Health>0
end
local function valid(token)
  return state.running and state.token==token and not state.stopping and not state.closed and (not state.work or state.work.owns('quest',token))
end
local function waitUntilActive(token)
  while valid(token) and state.paused do task.wait(.12) end
  return valid(token)
end
-- One task lease owns movement, temporary collision changes and camera overrides.
local movementTweens=game:GetService('TweenService')
local motion={callers=setmetatable({},{__mode='k'}),sequence=0}
state.motion=motion
function motion.activeClock()local lease=motion.callers[coroutine.running()];return os.clock()-(lease and lease.manualPausedDuration or 0)end
state.work={lease=nil,serial=0,pending=nil,critical=false}
function state.work.owns(owner,token)
  local lease=state.work.lease
  return not state.closed and lease~=nil and lease.owner==owner and lease.token==token
end
function state.work.launch(owner,token,callback)
  if state.closed or state.work.lease or state.work.dispatching and state.work.dispatching.canceled then return false end
  state.work.serial=state.work.serial+1
  local lease={owner=owner,token=token,id=state.work.serial,started=os.clock(),workflow=motion.workflow(owner)}
  state.work.lease=lease
  if state.collision and owner~='manual'then state.collision.acquire(lease)end
  lease.thread=task.spawn(function()
    motion.callers[coroutine.running()]=lease
    local ok,why=xpcall(callback,function(err)return tostring(err)end)
    if not ok then warning(owner..': '..tostring(why))end
    if state.quest and state.quest.cleanupDialogue and state.work.lease==lease then
      local cleaned,why=state.quest.cleanupDialogue(lease)
      if not cleaned then note('WARN','Dialogue cleanup: '..tostring(why))end
    end
    if owner~='manual'and state.recovery and lease.died and state.recovery.active(lease)then
      local resumed,reason=state.recovery.wait(lease)
      lease.recoveredDeath=resumed==true
      if not resumed and state.recovery.active(lease)then lease.noRecovery=true;note('WARN',owner..': '..tostring(reason or 'Respawn recovery canceled'))end
    end
    if state.work.lease==lease and motion.landing and not lease.rubberbandStopped and owner~='manual' then
      local landed,landingWhy=pcall(motion.landing.finish,lease);if not landed then note('WARN','Landing release: '..tostring(landingWhy))end
    end
    -- Finalizers may only release resources belonging to this exact generation.
    if state.camera then state.camera.release(lease)end
    if bank.elevator then bank.elevator.clear(lease)end
    if motion.lease==lease then motion.release()end
    if state.collision then state.collision.release(lease)end
    if state.work.lease==lease then
      state.work.lease=nil;state.work.critical=false
      if owner=='bank' then bank.running=false;if state.bankFarm then state.bankFarm.running=false end
      elseif owner=='airdrop' then af.running=false
      elseif owner=='quest' then state.running=false;state.awaiting=false
      elseif owner=='seller' then bag.selling=false
      elseif owner=='shop' and state.shop then state.shop.running=false
      elseif owner=='ammo'and state.ammo then state.ammo.running=false
      elseif owner=='combatShop' and state.combat then state.combat.buying=false
      elseif owner=='team'and state.teams then state.teams.requested=nil end
    end
    if state.collision then state.collision.sync()end
    if lease.navigationFailed and not lease.rubberbandStopped then
      if owner=='bank'and state.bankFarm then state.bankFarm.autoMode=false;state.bankFarm.requested=false;state.bankFarm.status=lease.navigationFailed
      elseif owner=='airdrop'then af.enabled=false;af.requested=false;af.status=lease.navigationFailed end
      if owner=='seller'then
        state.sellRequested=false;state.bankFarmSellPending=false;af.needsSell=false
        af.enabled=false;af.requested=false
        if state.bankFarm then state.bankFarm.autoMode=false;state.bankFarm.requested=false;state.bankFarm.status=lease.navigationFailed end
        bag.status=lease.navigationFailed
      end
      state.collision.sync()
    end
    if lease.workflow.chainSuspended then motion.resumeChain(lease)end
    if owner=='manual'and state.manual then state.manual.enabled=false;state.manual.requested=false;if not state.manual.parked then state.manual.blocked=false end end
    lease.finished=true;lease.landing=nil;lease.ghostCamera=nil;lease.navigation=nil;lease.travelPlan=nil
    if owner=='quest'and state.quest.workflowComplete then state.quest.complete()end
    if state.quest and state.quest.render then state.quest.render()end
    if state.recovery then state.recovery.finished(lease)end
  end)
  return true
end
function motion.ownerGeneration(owner)
  if owner=='manual'then return state.manual and state.manual.token end
  if owner=='team'then return state.teams and state.teams.token end
  if owner=='ammo'then return state.ammo and state.ammo.token end
  if owner=='bank' then return bank.token end
  if owner=='quest' then return state.token end
  if owner=='seller' then return bag.token end
  if owner=='airdrop' then return af.token end
  if owner=='shop' then return state.shop and state.shop.token end
  if owner=='combatShop' then return state.combat and state.combat.buyToken or 0 end
end
function motion.ownerActive(owner)
  local lease=state.work.lease
  return lease and lease.owner==owner and lease.token==motion.ownerGeneration(owner) and not state.closed
end
-- Native functions can yield in InvokeServer. Bound the local wait without claiming
-- that canceling a coroutine retracts a request already delivered to the server.
state.work.nativeUnknown=setmetatable({},{__mode='k'})
function state.work.nativeCall(timeout,key,callback,...)
  local lease=state.work.lease
  if not lease or motion.callers[coroutine.running()]~=lease or not motion.ownerActive(lease.owner)then
    return false,'Canceled before native request'
  end
  if state.work.nativeUnknown[key]then
    return false,'Previous native request outcome unknown; automatic retry blocked for this target'
  end
  local args=table.pack(...);local result;local accepting=true
  local worker=task.spawn(function()
    motion.callers[coroutine.running()]=lease
    if not accepting or state.work.lease~=lease or not motion.ownerActive(lease.owner)then return end
    local values=table.pack(pcall(callback,table.unpack(args,1,args.n)))
    if accepting then result=values end
  end)
  local deadline=os.clock()+math.clamp(tonumber(timeout)or 10,1,20)
  -- On ordinary preemption let this one in-flight request settle, within its
  -- deadline, before releasing the lease. Otherwise every mid-pickup handoff
  -- would leave the resumed pile quarantined despite a normal server response.
  while not result and state.work.lease==lease and not state.closed and os.clock()<deadline do task.wait(.05)end
  if result then
    accepting=false
    if state.work.lease~=lease or not motion.ownerActive(lease.owner)then return false,'Native request settled after cancellation'end
    return table.unpack(result,1,result.n)
  end
  accepting=false;state.work.nativeUnknown[key]=true
  pcall(task.cancel,worker)
  local why=os.clock()>=deadline and 'Native request timed out'or 'Native request interrupted'
  note('WARN',why..'; server outcome unknown; no automatic retry for this target')
  return false,why..'; server outcome unknown'
end

function motion.busy()return state.work.lease~=nil and not state.closed end
function motion.cancelTween()
  motion.sequence=motion.sequence+1
  if motion.completion then motion.completion:Disconnect();motion.completion=nil end
  if motion.tween then pcall(function()motion.tween:Cancel();motion.tween:Destroy()end)end
  motion.tween=nil;motion.mode=nil;motion.target=nil;motion.speed=nil
end
local liveModule
-- Scoped visual layer around the existing CFrame tweens.
motion.pose={current=nil}
function motion.pose.release(preserveGameState)
 local p=motion.pose.current;if not p then return end;motion.pose.current=nil
 for _,c in ipairs(p.connections)do c:Disconnect()end
 if not preserveGameState and p.animate and p.animate.Parent then pcall(function()p.animate.Disabled=p.disabled end)end
 for track,old in pairs(p.tracks)do pcall(function()if track.IsPlaying then track:AdjustSpeed(old.speed);track:AdjustWeight(old.weight,0)end end)end
 state.diagnostics.mark('travel_pose_released','animation configuration restored')
end
function motion.pose.acquire(part)
 local lease=state.work.lease;local ch=player.Character
 if not lease or not ch or part~=ch:FindFirstChild('HumanoidRootPart')then return end
 local p=motion.pose.current;if p and p.lease==lease and p.character==ch then return end
 motion.pose.release();local hum=ch:FindFirstChildOfClass('Humanoid');if not hum then return end
 p={lease=lease,character=ch,humanoid=hum,tracks={},connections={}};motion.pose.current=p
 local animate=ch:FindFirstChild('Animate');local ids={}
 if animate and animate:IsA('LocalScript')then
  p.animate=animate;p.disabled=animate.Disabled
  for _,obj in ipairs(animate:GetDescendants())do
   if obj:IsA('Animation')then local name=obj.Parent and obj.Parent.Name:lower()or ''
    if name=='walk'or name=='run'or name=='jump'or name=='fall'or name=='climb'or name=='swim'then ids[obj.AnimationId]=true end
   end
  end
  animate.Disabled=true
 end
 local function suppress(track)
  if motion.pose.current~=p then return end
  pcall(function()
   local name=track.Name:lower();local id=track.Animation and track.Animation.AnimationId;local priority=track.Priority
   if priority~=Enum.AnimationPriority.Core and priority~=Enum.AnimationPriority.Idle and priority~=Enum.AnimationPriority.Movement then return end
   local moving=ids[id]==true or name=='walk'or name=='run'or name=='jump'or name=='fall'or name=='freefall'or name=='climb'or name=='swim'
   if not p.tracks[track]then p.tracks[track]={speed=track.Speed,weight=track.WeightCurrent,locomotion=moving}end
   track:AdjustSpeed(0);if moving then track:AdjustWeight(0,.08)end
  end)
 end
 local animator=hum:FindFirstChildOfClass('Animator')
 if animator then
  local ok,tracks=pcall(animator.GetPlayingAnimationTracks,animator);if ok then for _,track in ipairs(tracks)do suppress(track)end end
  if animator.AnimationPlayed then table.insert(p.connections,animator.AnimationPlayed:Connect(suppress))end
 end
 state.diagnostics.mark('travel_pose_acquired','speed='..state.speed..'; mode='..state.navigationSettings.mode..'; altitude='..state.navigationSettings.altitude)
end
function motion.pose.check(part)
 local lease=state.work.lease;local hum=player.Character and player.Character:FindFirstChildOfClass('Humanoid')
 if not lease or not hum or type(hum.GetState)~='function'then return true end
 local ok,current=pcall(hum.GetState,hum);if not ok then return true end
 local custom=motion.guard and motion.guard.standing()==false
 local bad=custom or current==Enum.HumanoidStateType.Ragdoll or current==Enum.HumanoidStateType.FallingDown or current==Enum.HumanoidStateType.Physics
 if not bad then lease.physicsSince=nil;return true end
 motion.cancelTween();if motion.guard then motion.guard.release()end;motion.pose.release(custom)
 if not lease.physicsSince then lease.physicsSince=os.clock();state.diagnostics.mark('travel_physics_interruption',tostring(current))end
 local api=liveModule('ClientPlayers');local read,client=pcall(function()return api and api.Get()end);local standing=false
 if read and client and type(client.IsPlayerStanding)=='function'then local yes,v=pcall(client.IsPlayerStanding,client);standing=yes and v==true end
 if standing and hum.PlatformStand~=true and hum.Sit~=true and os.clock()-(lease.physicsAttempt or -math.huge)>=1 and (lease.physicsAttempts or 0)<2 then
  lease.physicsAttempt=os.clock();lease.physicsAttempts=(lease.physicsAttempts or 0)+1
  pcall(function()part.AssemblyAngularVelocity=Vector3.zero;part.AssemblyLinearVelocity=Vector3.zero;hum:ChangeState(Enum.HumanoidStateType.GettingUp)end)
 end
 if os.clock()-lease.physicsSince>=6 then lease.navigationFailed='Travel stopped: physics/ragdoll state did not recover';return false,lease.navigationFailed end
 task.wait(.1)
 if state.work.lease~=lease or not motion.ownerActive(lease.owner)or not characterAlive()then return false,'Travel canceled during physics recovery'end
 return false,'Waiting for observed physics recovery',true
end

-- Built-in state protection is scoped to a living, standing, REDLINE-owned character.
-- WANTED's custom SetRagdoll also changes motors/constraints; do not override it.
motion.guard={current=nil}
function motion.guard.standing()
 local api=liveModule and liveModule('ClientPlayers');local ok,client=pcall(function()return api and api.Get()end)
 if ok and client and type(client.IsPlayerStanding)=='function'then local yes,value=pcall(client.IsPlayerStanding,client);if yes then return value==true end end
 return nil
end
function motion.guard.release()
 local guard=motion.guard.current;if not guard then return end;motion.guard.current=nil
 if guard.connection then guard.connection:Disconnect()end
 if guard.humanoid.Health>0 and guard.humanoid.Parent==player.Character and motion.guard.standing()==false then return end -- Custom knockdown now owns the state configuration.
 for kind,enabled in pairs(guard.states)do pcall(guard.humanoid.SetStateEnabled,guard.humanoid,kind,enabled)end
end
function motion.guard.acquire(part)
 local lease=motion.lease;local hum=motion.humanoid
 if not lease or not hum or motion.guard.standing()~=true then return end
 local guard=motion.guard.current;if guard and guard.lease==lease and guard.humanoid==hum then return end
 motion.guard.release();guard={lease=lease,humanoid=hum,states={}};motion.guard.current=guard
 if type(hum.GetStateEnabled)=='function'and type(hum.SetStateEnabled)=='function'then
  for _,kind in ipairs({Enum.HumanoidStateType.FallingDown,Enum.HumanoidStateType.Ragdoll})do
   local ok,value=pcall(hum.GetStateEnabled,hum,kind)
   if ok and type(value)=='boolean'then local yes=pcall(hum.SetStateEnabled,hum,kind,false);if yes then guard.states[kind]=value end end
  end
 end
 if hum.StateChanged then guard.connection=hum.StateChanged:Connect(function(_,current)
  if motion.guard.current==guard and (current==Enum.HumanoidStateType.Ragdoll or current==Enum.HumanoidStateType.FallingDown or current==Enum.HumanoidStateType.Physics)then
   motion.cancelTween();state.diagnostics.mark('owned_state_interruption',tostring(current))
  end
 end)end
end
function motion.guard.step()
 local part=motion.root;local lease=motion.lease
 if not part or not lease or state.work.lease~=lease or not motion.ownerActive(lease.owner)or not characterAlive()then return end
 if motion.guard.standing()==false then
  motion.cancelTween();motion.guard.release();motion.pose.release(true);return
 end
 if motion.mode=='travel'or motion.mode=='hold'then
  -- CFrame remains the only positional driver. Clear residual gravity/spin before physics.
  part.AssemblyLinearVelocity=Vector3.zero;part.AssemblyAngularVelocity=Vector3.zero
 end
 local pose=motion.pose.current
 if pose and pose.lease==lease then
  if pose.animate and pose.animate.Parent then pose.animate.Disabled=true end
  for track,old in pairs(pose.tracks)do pcall(function()
   if track.IsPlaying then track:AdjustSpeed(0);if old.locomotion then track:AdjustWeight(0,0)end end
  end)end
 end
end

function motion.release()
  if motion.lease and motion.lease.rubberbandRecovery and motion.resumeChain then motion.resumeChain(motion.lease)end
  if bank.elevator then bank.elevator.clear(state.work.lease)end
  motion.guard.release();motion.pose.release()
  if motion.landing then motion.landing.cancelStream(motion.lease)end
  if motion.nativeRide then motion.nativeRide:Disconnect();motion.nativeRide=nil end
  motion.cancelTween()
  if motion.root and motion.root.Parent then
    pcall(function()motion.root.AssemblyLinearVelocity=Vector3.zero;motion.root.AssemblyAngularVelocity=Vector3.zero end)
  end
  if motion.humanoid and motion.humanoid.Parent and motion.autoRotate~=nil then
    pcall(function()motion.humanoid.AutoRotate=motion.autoRotate end)
  end
  if state.collision and motion.lease then state.collision.release(motion.lease)end
  motion.root=nil;motion.humanoid=nil;motion.autoRotate=nil;motion.owner=nil;motion.lease=nil
end
function motion.prepare(part)
  local character=player.Character
  if state.closed or not part or not character or part~=character:FindFirstChild('HumanoidRootPart') or not characterAlive() then return false end
  if motion.root==part then return true end
  motion.release()
  motion.root=part;motion.humanoid=character:FindFirstChildOfClass('Humanoid')
  motion.autoRotate=motion.humanoid.AutoRotate;motion.humanoid.AutoRotate=false
  return true
end
function motion.beginTween(part,goal,duration,mode,target,speed)
  motion.cancelTween()
  local lease=motion.lease;local sequence=motion.sequence
  local animation=movementTweens:Create(part,TweenInfo.new(duration,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,mode=='hold' and -1 or 0),{CFrame=goal})
  motion.tween=animation;motion.mode=mode;motion.target=target;motion.speed=speed;motion.nextRetarget=os.clock()+.15
  motion.completion=animation.Completed:Connect(function(playback)
    if motion.sequence~=sequence or motion.tween~=animation or motion.lease~=lease then return end
    if playback==Enum.PlaybackState.Completed and state.work.lease==lease and motion.ownerActive(lease.owner)
      and player.Character and part==player.Character:FindFirstChild('HumanoidRootPart') then motion.hold(part)end
  end)
  animation:Play()
end
function motion.hold(part)
  if state.work.lease and state.work.lease.elevatorRide then return end
  motion.pose.release()
  if not motion.lease then
    local active=state.work.lease
    if active and motion.callers[coroutine.running()]==active and motion.ownerActive(active.owner)and motion.prepare(part)then
      motion.lease=active;motion.owner=active.owner;motion.ownerStamp=active.token;state.collision.acquire(active)
    end
  end
  local lease=motion.lease
  if not lease or state.work.lease~=lease or not motion.ownerActive(lease.owner) or not characterAlive() then motion.release();return end
  if motion.root~=part or not part.Parent then return end
  motion.guard.acquire(part)
  if lease.landing then motion.pose.acquire(part)end
  part.AssemblyLinearVelocity=Vector3.zero;part.AssemblyAngularVelocity=Vector3.zero
  if motion.mode=='hold' and motion.tween then return end
  motion.beginTween(part,part.CFrame,.2,'hold',part.Position,nil)
end
function motion.halt()if motion.root then motion.hold(motion.root)end end

motion.workflows={}
function motion.newWorkflow(owner)
 local flow={corrections=0,correctionSerial=0,deaths=0,resets=0,recoveries=0};motion.workflows[owner]=flow;return flow
end
function motion.workflow(owner)return motion.workflows[owner]or motion.newWorkflow(owner)end
function motion.planTarget(part,destination,lease)
 local settings=state.navigationSettings;local plan=lease.travelPlan
 if not (plan and plan.forcedRecovery)and (settings.mode~='High-Altitude'or lease.localRouteTravel)then lease.travelPlan=nil;return destination end
 if plan and (destination-plan.destination).Magnitude>1 then
  -- Falling crates move continuously: update the landing point without restarting ascent.
  plan.destination=destination;plan.points[2]=Vector3.new(destination.X,plan.height,destination.Z);plan.points[3]=destination
 end
 if not plan then
  local offset=destination-part.Position
  if Vector3.new(offset.X,0,offset.Z).Magnitude<settings.threshold then return destination end
  local height=math.max(settings.altitude,part.Position.Y+40,destination.Y+40)
  plan={destination=destination,height=height,index=1,points={Vector3.new(part.Position.X,height,part.Position.Z),Vector3.new(destination.X,height,destination.Z),destination}}
  lease.travelPlan=plan
 end
 while plan.index<3 and (part.Position-plan.points[plan.index]).Magnitude<6 do plan.index=plan.index+1 end
 if plan.forcedRecovery and plan.index>=2 and lease.rubberbandRecovery then motion.resumeChain(lease)end
 return plan.points[plan.index]
end
function motion.expireChain(flow,now)
 if not flow.chainSuspended and flow.lastCorrectionAt and now-flow.lastCorrectionAt>=5 then
  flow.corrections=0;flow.lastCorrectionAt=nil;flow.recoveryHeight=nil
 end
end
function motion.expireChains()
 for _,flow in pairs(motion.workflows)do motion.expireChain(flow,os.clock())end
end
function motion.resumeChain(lease)
 local flow=lease.workflow
 if flow and flow.chainSuspended then flow.chainSuspended=nil;flow.lastCorrectionAt=os.clock()end
 lease.rubberbandRecovery=nil;lease.navigation=nil
end
function motion.stopChain(lease,reason)
 lease.navigationFailed=reason;lease.rubberbandStopped=true;lease.noRecovery=true
 motion.cancelTween();state.camera.release(lease)
 local owner=lease.owner
 if owner=='bank'then
  if not bank.isTutorial and state.bankFarm then state.bankFarm.autoMode=false;state.bankFarm.requested=false;state.bankFarm.status=reason end
  bank.running=false;bank.autoStatus=reason
 elseif owner=='quest'then state.running=false;state.routeError=reason;state.quest.lastFailure=reason
 elseif owner=='airdrop'then af.enabled=false;af.requested=false;af.running=false;af.status=reason
 elseif owner=='ammo'then state.ammo.running=false;state.ammo.status=reason
 elseif owner=='seller'then bag.selling=false;bag.lastFail=os.clock();state.sellRequested=false;bag.status=reason
 elseif owner=='shop'then state.shop.running=false;state.shopState.status=reason
 elseif owner=='combatShop'then state.combat.buying=false end
 if state.setup and state.setup.active and (owner=='bank'or owner=='quest')then state.setup.active=false;state.setup.status=reason end
 if motion.lease==lease then motion.release()end
 state.collision.release(lease);state.collision.sync()
 note('WARN',owner..': '..reason)
 if state.notify then state.notify('MOVEMENT',owner..': '..reason)end
end
function motion.recoverChain(lease,part,target,count)
 local flow=lease.workflow;flow.chainSuspended=true
 if count%8==0 then
  local old=lease.travelPlan;local destination=old and old.destination or lease.requestedDestination or target
  -- Fixed clearance per connected chain, never another +100 at counts 16 or 24.
  flow.recoveryHeight=flow.recoveryHeight or math.max(state.navigationSettings.altitude,part.Position.Y+100,destination.Y+40)
  local height=math.max(flow.recoveryHeight,part.Position.Y)
  lease.travelPlan={destination=destination,height=height,index=1,forcedRecovery=true,
   points={Vector3.new(part.Position.X,height,part.Position.Z),Vector3.new(destination.X,height,destination.Z),destination}}
  lease.rubberbandRecovery={kind='ascent',deadline=os.clock()+math.max(12,(height-part.Position.Y)/state.speed*3+8)}
  lease.navigation=nil;state.navigationStatus='Pullback '..count..'/28 · Restarting ascent'
  state.diagnostics.mark('rubberband_ascent','count='..count..' height='..height)
  return true
 end
 lease.rubberbandRecovery={kind='pause'};state.navigationStatus='Pullback '..count..'/28 · Holding 3 seconds'
 state.diagnostics.mark('rubberband_pause','count='..count..' duration=3')
 motion.hold(part)
 local deadline=os.clock()+3
 while os.clock()<deadline do
  if state.work.lease~=lease or not motion.ownerActive(lease.owner)or not characterAlive()or root()~=part then return false,'Stopped during pullback recovery'end
  task.wait(math.min(.1,deadline-os.clock()))
 end
 if state.work.lease~=lease or not motion.ownerActive(lease.owner)or not characterAlive()or root()~=part then return false,'Stopped during pullback recovery'end
 motion.cancelTween();motion.resumeChain(lease);return true
end
function motion.watchTravel(part,target)
 local lease=state.work.lease
 if not lease or motion.callers[coroutine.running()]~=lease or not motion.ownerActive(lease.owner)or not part or part~=root()or not characterAlive()then return false,'Movement ownership or character lost'end
 if lease.navigationFailed then return false,lease.navigationFailed end
 if state.manual then
  local ok,why,resumed=state.manual.safeBoundary(lease);if not ok then return false,why end
  if state.work.lease~=lease or part~=root()or not characterAlive()then return false,'Character changed while automation was paused'end
  if resumed then return true,nil,true end
 end
 local flow=lease.workflow or motion.workflow(lease.owner);lease.workflow=flow
 local now=os.clock();motion.expireChain(flow,now)
 local plan=lease.travelPlan
 if plan and (target-plan.destination).Magnitude<12 then target=plan.points[plan.index]end
 if lease.rubberbandRecovery then
  if lease.rubberbandRecovery.kind=='ascent'and now>=lease.rubberbandRecovery.deadline then
   motion.stopChain(lease,'Altitude recovery timed out; route stopped');return false,lease.navigationFailed
  end
  lease.navigation=nil;return true
 end
 local n=lease.navigation;local position=part.Position
 if not n or n.part~=part then n={position=position,target=target,part=part,time=now,armed=true};lease.navigation=n end
 local same=(target-n.target).Magnitude<8
 local owned=motion.lease==lease and motion.root==part and motion.mode=='travel'and motion.tween~=nil
 local delta=position-n.position
 local backwards=same and delta.Magnitude>18 and (n.target-position).Magnitude>(n.target-n.position).Magnitude+8
 local corrected=owned and not lease.elevatorRide and not lease.ignorePullbacks and n.armed and backwards and now-n.time<=.75
 if not n.armed and n.after and (target-position).Magnitude<(target-n.after).Magnitude-3 then n.armed=true end
 n.position=position;n.target=target;n.time=now
 if not corrected then return true end
 n.armed=false;n.after=position
 flow.corrections=flow.corrections+1;flow.correctionSerial=(flow.correctionSerial or 0)+1;flow.lastCorrectionAt=now
 motion.cancelTween();state.navigationStatus='Pullback '..flow.corrections..'/28 · 5-second chain'
 state.diagnostics.mark('rubberband_confirmed',lease.owner..' count='..flow.corrections..' displacement='..delta.Magnitude)
 if flow.corrections>=28 then motion.stopChain(lease,'Stopped after 28 connected rubberbands');return false,lease.navigationFailed,true end
 if flow.corrections%4==0 then local ok,why=motion.recoverChain(lease,part,target,flow.corrections);return ok,why,true end
 return true,nil,true
end

function motion.arrived()
 local lease=state.work.lease
 if not lease or not lease.landing then motion.pose.release()end
 if lease and motion.callers[coroutine.running()]==lease then
  if lease.rubberbandRecovery then motion.resumeChain(lease)end
  lease.navigation=nil;lease.travelPlan=nil
 end
end

-- Geometry observation augments the existing tween; it never substitutes camera coordinates.
motion.landing={}
function motion.landing.cancelStream(lease)
 if lease and lease.streamThread then pcall(task.cancel,lease.streamThread);lease.streamThread=nil end
end
function motion.landing.probe(position,part)
 if not RaycastParams or not OverlapParams or type(workspace.Raycast)~='function'or type(workspace.GetPartBoundsInBox)~='function'then return nil,'Landing collision queries unavailable'end
 local ignore={player.Character};local localFolder=workspace:FindFirstChild('Local');local gizmos=localFolder and localFolder:FindFirstChild('Gizmos')
 if gizmos then table.insert(ignore,gizmos)end
 local params=RaycastParams.new();params.FilterType=Enum.RaycastFilterType.Exclude;params.FilterDescendantsInstances=ignore;params.RespectCanCollide=true
 local ok,hit=pcall(workspace.Raycast,workspace,position+Vector3.new(0,4,0),Vector3.new(0,-20,0),params)
 if not ok or not hit then return nil,'No streamed floor below recorded character waypoint'end
 local gap=position.Y-hit.Position.Y
 if not hit.Normal or hit.Normal.Y<.5 or gap<.5 or gap>10 or hit.Material==Enum.Material.Water then return nil,'Recorded waypoint has no verified supporting surface'end
 local overlap=OverlapParams.new();overlap.FilterType=Enum.RaycastFilterType.Exclude;overlap.FilterDescendantsInstances=ignore;overlap.RespectCanCollide=true;overlap.MaxParts=32
 local clear=true
 -- Check the root and body parts whose original collision will be restored; tools are excluded.
 for _,body in ipairs(player.Character:GetChildren())do
  if body:IsA('BasePart')and (body==part or state.collision.original[body]==true or body.CanCollide)then
   local center=body==part and position or position+(body.Position-part.Position)
   local yes,parts=pcall(workspace.GetPartBoundsInBox,workspace,body.CFrame+(center-body.Position),body.Size*.95,overlap)
   if not yes then return nil,'Landing overlap query failed'end
   for _,obstacle in ipairs(parts)do if obstacle.CanCollide then clear=false;break end end
  end
 end
 return {position=position,floor=hit.Instance,floorY=hit.Position.Y,clear=clear},clear and 'Supported and clear'or 'Supported; collision overlap requires a held interaction'
end
function motion.landing.begin(point)
 local lease=state.work.lease;if not lease then return end
 if point.camX==nil then lease.landing=nil;return end
 local target=Vector3.new(point.x,point.y,point.z);local old=lease.landing
 if old and (old.target-target).Magnitude<.01 then return end
 lease.landing={target=target,point=point,recoveries=0}
end
function motion.landing.gate(part)
 local lease=state.work.lease;local landing=lease and lease.landing
 if not landing then return true end
 local delta=landing.target-part.Position
 if Vector3.new(delta.X,0,delta.Z).Magnitude>80 then return true end
 local now=os.clock()
 if now<(landing.nextProbe or 0)and landing.surface then return true end
 landing.nextProbe=now+.25
 local surface,why=motion.landing.probe(landing.target,part);landing.surface=surface;landing.reason=why
 if surface then landing.waitStarted=nil;return true end
 motion.hold(part);landing.waitStarted=landing.waitStarted or now
 if not landing.streamRequested and type(player.RequestStreamAroundAsync)=='function'then
  landing.streamRequested=true
  lease.streamThread=task.spawn(function()pcall(player.RequestStreamAroundAsync,player,landing.target,4)end)
 end
 if now-landing.waitStarted>=8 then
  lease.navigationFailed='Landing stopped: '..why
  state.diagnostics.mark('landing_failed',lease.navigationFailed);return false,lease.navigationFailed
 end
 return false,'Waiting for destination geometry',true
end
function motion.landing.verify(part)
 local lease=state.work.lease;local landing=lease and lease.landing
 if not landing then return true end
 local allowed,why,waiting=motion.landing.gate(part)
 while not allowed and waiting do
  if not motion.ownerActive(lease.owner)or part~=root()or not characterAlive()then return false,'Landing canceled'end
  task.wait(.1);allowed,why,waiting=motion.landing.gate(part)
 end
 if not allowed then return false,why end
 local stable,reason,retrying=motion.pose.check(part)
 while not stable and retrying do
  if not motion.ownerActive(lease.owner)or part~=root()or not characterAlive()then return false,'Landing canceled'end
  stable,reason,retrying=motion.pose.check(part)
 end
 if not stable then return false,reason end
 if not landing.surface then return false,'Outside the verified landing area; return through the recorded travel stage'end
 local distance=(part.Position-landing.target).Magnitude
 if distance>.5 or part.AssemblyLinearVelocity.Y < -8 then
  motion.cancelTween();state.camera.release(lease)
  landing.recoveries=landing.recoveries+1
  if landing.recoveries>2 then lease.navigationFailed='Landing stopped after two stabilization recoveries';return false,lease.navigationFailed end
  if part.Position.Y<landing.surface.floorY-20 then lease.navigationFailed='Character fell below the verified landing area; automatic descent stopped';return false,lease.navigationFailed end
  local prior=lease.localRouteTravel;lease.localRouteTravel=true;lease.travelPlan=nil
  local deadline=os.clock()+3
  repeat
   if not state.work.owns(lease.owner,lease.token)or not motion.ownerActive(lease.owner)or part~=root()or not characterAlive()then lease.localRouteTravel=prior;return false,'Landing recovery canceled'end
   local moved,err=motion.travel(part,landing.target,state.speed,lease.owner);if not moved then lease.localRouteTravel=prior;return false,err end
   RunService.Heartbeat:Wait()
  until (part.Position-landing.target).Magnitude<=.35 or os.clock()>=deadline
  lease.localRouteTravel=prior
  if (part.Position-landing.target).Magnitude>.35 then lease.navigationFailed='Landing recovery did not reach the verified waypoint';return false,lease.navigationFailed end
 end
 motion.hold(part)
 landing.verified=true
 state.diagnostics.snapshot('ghost_landing',{target=landing.target,actual=part.Position,floorY=landing.surface.floorY,clear=landing.surface.clear,velocity=part.AssemblyLinearVelocity,recoveries=landing.recoveries})
 return true
end
function motion.landing.finish(lease)
 motion.landing.cancelStream(lease)
 local landing=lease.landing;local part=root()
 if not landing or not part or not landing.verified or not motion.ownerActive(lease.owner)or not characterAlive()then return end
 local surface=motion.landing.probe(part.Position,part)
 if surface and surface.clear then return end
 -- Preserve recorded interaction points; only the final release may use a verified nearby clear point.
 local safe
 for _,offset in ipairs({Vector3.new(0,1,0),Vector3.new(0,2,0),Vector3.new(2,0,0),Vector3.new(-2,0,0),Vector3.new(0,0,2),Vector3.new(0,0,-2),Vector3.new(4,0,0),Vector3.new(-4,0,0)})do
  local candidate=part.Position+offset;local check=motion.landing.probe(candidate,part)
  if check and check.clear then safe=candidate;break end
 end
 if not safe then note('WARN','No verified clear landing release point; movement ended and original collision settings restored');return end
 lease.landing=nil;local prior=lease.localRouteTravel;lease.localRouteTravel=true;lease.travelPlan=nil
 local deadline=os.clock()+2
 while state.work.lease==lease and motion.ownerActive(lease.owner)and characterAlive()and part==root()and os.clock()<deadline and (part.Position-safe).Magnitude>.35 do
  local moved=motion.travel(part,safe,state.speed,lease.owner);if not moved then break end;RunService.Heartbeat:Wait()
 end
 lease.localRouteTravel=prior
end

function motion.travel(part,destination,speed,owner)
  local lease=state.work.lease;local caller=motion.callers[coroutine.running()]
  owner=owner or (lease and lease.owner)
  if not lease or caller~=lease or lease.owner~=owner or not motion.ownerActive(owner) then return false end
  if lease.elevatorRide then return false,'Native elevator currently owns movement'end
  if typeof(destination)~='Vector3' or destination.X~=destination.X or destination.Y~=destination.Y or destination.Z~=destination.Z
    or math.abs(destination.X)>100000 or math.abs(destination.Y)>100000 or math.abs(destination.Z)>100000 then error('Invalid route coordinate')end
  local landingOK,landingWhy,landingWait=motion.landing.gate(part)
  if not landingOK then return landingWait==true,landingWhy end
  lease.requestedDestination=destination
  local originalDestination=destination
  destination=motion.planTarget(part,destination,lease)
  local allowed,why=motion.watchTravel(part,destination);if not allowed then return false,why end
  destination=motion.planTarget(part,originalDestination,lease)
  if not motion.prepare(part) then return false end
  motion.owner=owner;motion.lease=lease;motion.ownerStamp=lease.token
  state.collision.acquire(lease)
  speed=math.clamp(tonumber(speed) or state.speed,75,90)
  local delta=destination-part.Position
  if delta.Magnitude<=.1 then motion.hold(part);return true end
  local stable,physicsWhy,waiting=motion.pose.check(part);if not stable then return waiting==true,physicsWhy end
  if motion.mode=='travel' and motion.tween and motion.target and motion.speed==speed
    and ((destination-motion.target).Magnitude<=.5 or os.clock()<(motion.nextRetarget or 0))then return true end
  motion.guard.acquire(part);motion.pose.acquire(part)
  motion.beginTween(part,part.CFrame+delta,math.max(.05,delta.Magnitude/speed),'travel',destination,speed)
  return true
end

-- Manual preference is independent of enabled features, queued actions and movement leases.
state.manualNoclipEnabled=state.noclip==true
state.collision={owners={},original={},character=nil,connection=nil,restorePending=false}
function state.collision.automatic()
  if state.closed or state.manual and state.manual.blocked and (state.manual.enabled or state.manual.parked or not state.manual.requested)then return false end
  local farm=state.bankFarm;local work=state.work
  if farm and (farm.autoMode or farm.requested or farm.running)then return true,'Bank Farm'end
  if af.enabled or af.requested or af.running then return true,'Airdrop Farm'end
  if work.pending then return true,work.pending.name end
  if work.dispatching and not work.dispatching.canceled then return true,work.dispatching.name end
  if state.running then return true,'Ghost Quest'end
  if bank.running then return true,'Bank Tutorial'end
  if bag.selling or state.sellRequested or state.bankFarmSellPending then return true,'Bag sale'end
  if state.shop and state.shop.running then return true,'Shop travel'end
  if state.combat and state.combat.buying then return true,'Combat shop'end
  if work.lease and motion.ownerActive(work.lease.owner)then return true,work.lease.owner end
  for owner in pairs(state.collision.owners)do
    if owner==work.lease and motion.ownerActive(owner.owner)then return true,owner.owner end
    state.collision.owners[owner]=nil -- A canceled generation cannot hold a collision override.
  end
  return false
end
function state.collision.effective()
  local lease=state.work.lease
  if lease and lease.elevatorRide and motion.ownerActive(lease.owner)then return false end
  return not state.closed and (state.manualNoclipEnabled or state.collision.automatic())==true
end
local function restoreCollision()
  local controller=state.collision
  if controller.connection then controller.connection:Disconnect();controller.connection=nil end
  for part,value in pairs(controller.original)do pcall(function()part.CanCollide=value end)end
  controller.original={};controller.character=nil;controller.restorePending=false
  state.collisionOriginal=controller.original;state.noclipConn=nil
end
local function applyNoclipPart(part)
  if not part:IsA('BasePart')then return end
  local original=state.collision.original
  if original[part]==nil then original[part]=part.CanCollide end
  if part.CanCollide then part.CanCollide=false end
end
function state.collision.requestRestore()
  -- Restore promptly even inside geometry. No hidden grace period or arbitrary teleport.
  if state.collision.character or next(state.collision.original)then restoreCollision()end
end
local function startNoclip()
  local c=state.collision;local character=player.Character
  if not character or not characterAlive()or not c.effective()then c.requestRestore();return end
  if c.character~=character then
    restoreCollision();c.character=character;state.collisionOriginal=c.original
    for _,part in ipairs(character:GetDescendants())do applyNoclipPart(part)end
    c.connection=character.DescendantAdded:Connect(function(part)
      if c.character==character and part:IsDescendantOf(character)and c.effective()then applyNoclipPart(part)end
    end)
    state.noclipConn=c.connection
  end
end
state.collision.sync=startNoclip
function state.collision.acquire(owner)
  if owner and owner==state.work.lease and not state.closed then state.collision.owners[owner]=true end
  startNoclip()
end
function state.collision.release(owner)
  if owner then state.collision.owners[owner]=nil end
  startNoclip()
end
function state.setNoclip(enabled)
  if state.collision.automatic()then return state.manualNoclipEnabled,false,'Required by automation'end
  state.manualNoclipEnabled=enabled==true;state.noclip=state.manualNoclipEnabled
  startNoclip();return state.manualNoclipEnabled,true
end
local function stopMotion(forceRelease,owner)
  local caller=motion.callers[coroutine.running()]
  if not forceRelease and motion.lease and (owner and owner~=motion.owner or caller and caller~=motion.lease)then return end
  if forceRelease or not motion.owner or not motion.ownerActive(motion.owner)then motion.release()else motion.halt()end
end
-- One physics callback; no world edits, per-part listeners or per-frame descendant scans.
table.insert(state.connected,RunService.Stepped:Connect(function()
  local c=state.collision
  motion.guard.step()
  startNoclip()
  if c.effective()then
    for part,value in pairs(c.original)do
      if part.Parent and c.character and part:IsDescendantOf(c.character)then
        if part.CanCollide then part.CanCollide=false end
      else
        -- Unequipped tools and reparented parts no longer belong to our character.
        pcall(function()part.CanCollide=value end);c.original[part]=nil
      end
    end
  end
  if motion.root and (not characterAlive()or not motion.ownerActive(motion.owner)or not player.Character
    or motion.root~=player.Character:FindFirstChild('HumanoidRootPart'))then motion.release()end
end))

-- Tokenized camera transaction, captured BEFORE C4 equip can engage first person.
state.camera={current=nil,serial=0}
function state.camera.capture(lease)
  if not lease or state.work.lease~=lease then return nil end
  if state.camera.current then
    if state.camera.current.lease==lease then return state.camera.current end
    return nil
  end
  local camera=workspace.CurrentCamera;if not camera then return nil end
  state.camera.serial=state.camera.serial+1
  local saved={lease=lease,id=state.camera.serial,camera=camera,mode=player.CameraMode,min=player.CameraMinZoomDistance,max=player.CameraMaxZoomDistance,
    type=camera.CameraType,subject=camera.CameraSubject,cframe=camera.CFrame,focus=camera.Focus,
    mouse=UserInputService.MouseBehavior,cursor=UserInputService.MouseIconEnabled,character=player.Character}
  state.camera.current=saved
  return saved
end
function state.camera.release(lease)
  local saved=state.camera.current
  if not saved or saved.lease~=lease then return end
  state.camera.current=nil
  if saved.connection then saved.connection:Disconnect()end
  if saved.binding then pcall(function()RunService:UnbindFromRenderStep(saved.binding)end)end
  if saved.tool then pcall(function()
    if type(saved.tool._inputPrimary)=='function'then saved.tool:_inputPrimary(Enum.UserInputState.End)end
    saved.tool.throwing=false
  end)end
  pcall(function()
    player.CameraMode=saved.mode
    player.CameraMaxZoomDistance=math.max(saved.max,player.CameraMinZoomDistance)
    player.CameraMinZoomDistance=saved.min;player.CameraMaxZoomDistance=saved.max
    local camera=workspace.CurrentCamera
    if camera then
      camera.CameraType=saved.type
      local subject=saved.subject
      if player.Character~=saved.character or not subject or not subject.Parent then subject=player.Character and player.Character:FindFirstChildOfClass('Humanoid')end
      if subject then camera.CameraSubject=subject end
      if camera==saved.camera and player.Character==saved.character then camera.CFrame=saved.cframe;camera.Focus=saved.focus end
    end
    UserInputService.MouseBehavior=saved.mouse;UserInputService.MouseIconEnabled=saved.cursor
  end)
end

function state.camera.overhead(point,focus,model)
 local lease=state.work.lease
 if not point or not point.camX or not lease or not motion.ownerActive(lease.owner)then return false,'Recorded camera or ownership unavailable'end
 local saved=state.camera.capture(lease);if not saved then return false,'Camera ownership unavailable'end
 local position=Vector3.new(point.camX,point.camY,point.camZ);local look=Vector3.new(point.lookX,point.lookY,point.lookZ)
 if look.Magnitude<.01 then state.camera.release(lease);return false,'Recorded LookVector is invalid'end
 look=look.Unit
 local target=focus or Vector3.new(point.x,point.y,point.z)
 if RaycastParams and type(workspace.Raycast)=='function'then
  local params=RaycastParams.new();params.FilterType=Enum.RaycastFilterType.Exclude
  local ignore={player.Character};if model then table.insert(ignore,model)end;params.FilterDescendantsInstances=ignore
  local ok,hit=pcall(workspace.Raycast,workspace,target,position-target,params)
  if point.name=='manor ghost' then
   local hitPath='none';if ok and hit and hit.Instance then pcall(function()hitPath=hit.Instance:GetFullName()end)end
   state.diagnostics.snapshot('manor_camera_query',{origin=target,direction=position-target,hit=hitPath,queryOK=ok,
    error=not ok and tostring(hit)or '',canCollide=ok and hit and hit.Instance and hit.Instance.CanCollide,
    transparency=ok and hit and hit.Instance and hit.Instance.Transparency,decision='Optional camera ray; native NPC visibility decides'})
  elseif not ok or hit then state.camera.release(lease);return false,'Recorded overhead camera is obstructed or visibility query failed'end
 end
 if saved.binding then RunService:UnbindFromRenderStep(saved.binding);saved.binding=nil end
 saved.overhead={point=point,focus=target,model=model,position=position,look=look};lease.ghostCamera=saved.overhead
 local goal=CFrame.lookAt(position,position+look)
 local function align()
  if state.camera.current~=saved then return end
  if state.work.lease~=lease or not motion.ownerActive(lease.owner)or player.Character~=saved.character or not characterAlive()then state.camera.release(lease);return end
  local camera=workspace.CurrentCamera
  if camera~=saved.camera then state.camera.release(lease);return end
  camera.CameraType=Enum.CameraType.Scriptable;camera.CFrame=goal;camera.Focus=CFrame.new(target)
 end
 -- After exported ClientCameraCFrame/FirstPersonCamera/AimAssist, not just the default camera.
 local priorities=liveModule('Priorities');local priority=Enum.RenderPriority.Camera.Value
 for _,key in ipairs({'ClientCameraCFrame','FirstPersonCamera','VehicleCamera','AimAssist'})do priority=math.max(priority,tonumber(priorities and priorities.Render and priorities.Render[key])or 0)end
 saved.binding='REDLINE_GhostCamera_'..saved.id
 local bound,why=pcall(RunService.BindToRenderStep,RunService,saved.binding,priority+1,align)
 if not bound then state.camera.release(lease);return false,'Scoped camera binding unavailable: '..tostring(why)end
 align();return true
end
function state.camera.verifyOverhead(lease)
 local saved=state.camera.current;local camera=workspace.CurrentCamera
 if not saved or saved.lease~=lease or not saved.overhead or camera~=saved.camera then return false,'Overhead camera ownership lost'end
 local view=saved.overhead
 if camera.CameraType~=Enum.CameraType.Scriptable or (camera.CFrame.Position-view.position).Magnitude>.1 or (camera.CFrame.LookVector-view.look).Magnitude>.01 then return false,'Recorded overhead camera alignment overwritten'end
 return true
end

local function stop()
  if state.recovery then state.recovery.cancel('quest')end
  if state.setup then state.setup.cancel('Ghost quest stopped')end
  if state.camera.current then state.camera.release(state.camera.current.lease)end
  if state.work.cancelPending then state.work.cancelPending('Ghost quest')end
  state.stopping=true;state.running=false;state.paused=false;state.token=state.token+1
  stopMotion();state.awaiting=false;state.collision.sync()
  if not state.quest.workflowComplete then state.quest.stage='canceled';state.quest.currentNPC='';state.quest.attempt=0 end
  if state.quest.render then state.quest.render()end
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
    state.observedSpeaker={x=best.X,y=best.Y,z=best.Z}
    -- Only save a discovered item location when it is close to the quest giver.
    saveFile(savedSpeakerPath,state.observedSpeaker)
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
local function flyTo(record,token,phase,ghost,tolerance)
  local dest=Vector3.new(record.x,record.y,record.z)
  local tries=0
  local recorded=record.camX~=nil and record.camY~=nil and record.camZ~=nil
  motion.landing.begin(record)
  if state.work.lease then state.work.lease.ghostCamera=nil end
  tolerance=recorded and .35 or math.clamp(tonumber(tolerance)or 7,.5,14)
  local arrivalSlack=recorded and 0 or 1
  if phase=='ghost_travel' then state.quest.currentNPC=state.quest.waypoints[ghost]or ('waypoint '..tostring(ghost))end
  state.diagnostics.mark('ghost_travel_started',phase..' waypoint='..tostring(ghost),'CFrame tween')
  report('phase',phase,ghost,'',false)
  while valid(token) and tries<3 do
    if not waitUntilActive(token) then break end
    if state.died or not characterAlive() then return false,'death' end
    local r=root()
    if not r then task.wait(1);tries=tries+1
    else
      if (r.Position-dest).Magnitude<=tolerance then
        motion.hold(r)
        task.wait(0.35)
        if valid(token)and characterAlive()and r==root()and (r.Position-dest).Magnitude<=tolerance+arrivalSlack then
          motion.hold(r);local landed,why=motion.landing.verify(r);if not landed then return false,why end;motion.arrived();state.diagnostics.mark('ghost_approach_reached',phase);state.diagnostics.mark('travel_stopped_hold_established',motion.mode or 'none');return true end
      end
      tries=tries+1;startNoclip()
      local previous=r.Position;local started=os.clock()
      local flightDeadline=os.clock()+math.max(15,((r.Position-dest).Magnitude+state.navigationSettings.altitude*3)/state.speed*3+12)
      local reason=''
      while valid(token) and not state.died do
        if state.paused then
          local pauseStarted=os.clock()
          motion.hold(r)
          if not waitUntilActive(token) then break end
          flightDeadline=flightDeadline+(os.clock()-pauseStarted)
          startNoclip()
          previous=r.Position
        end
        if not r.Parent or not characterAlive()or r~=root()then reason='death';break end
        local allowed,why,corrected=motion.watchTravel(r,dest)
        if not allowed then stopMotion();return false,why end
        if corrected then flightDeadline=os.clock()+math.max(15,((r.Position-dest).Magnitude+state.navigationSettings.altitude*3)/state.speed*3+12)end
        local delta=dest-r.Position
        if delta.Magnitude<=tolerance then break end
        if os.clock()>flightDeadline then reason='Glide timed out';break end
        local moved,moveWhy=motion.travel(r,dest,state.speed,'quest');if not moved then return false,moveWhy or 'Movement ownership lost'end
        RunService.Heartbeat:Wait()
        local new=r.Position
        -- The shared observer counts corrections on the next sample; they do not consume a stage attempt.
        previous=new
      end
      stopMotion()
      if state.died or reason=='death' then return false,'death' end
      if valid(token) and (r.Position-dest).Magnitude<=tolerance+arrivalSlack then
        task.wait(0.45)
        if valid(token)and characterAlive()and r==root()and (r.Position-dest).Magnitude<=tolerance+arrivalSlack then
          local landed,why=motion.landing.verify(r);if not landed then return false,why end
          motion.arrived();state.diagnostics.mark('ghost_approach_reached',phase);state.diagnostics.mark('travel_stopped_hold_established',motion.mode or 'none');return true end
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
-- Executors expose different input methods. Prefer in-game APIs, then fall back to supported input.
local function inputKey(key,down)
  local caller=motion.callers[coroutine.running()]
  if down and (state.closed or caller and (state.work.lease~=caller or not motion.ownerActive(caller.owner)))then return false end
  local code=(key==Enum.KeyCode.E and 0x45) or (key==Enum.KeyCode.X and 0x58)
    or (key==Enum.KeyCode.Tab and 0x09) or (key==Enum.KeyCode.One and 0x31)
    or (key==Enum.KeyCode.Three and 0x33)
  if code then
    local fn=down and keypress or keyrelease
    if type(fn)=='function' then
      local ok=pcall(fn,code)
      if ok then return true end
    end
  end
  if VirtualInputManager then
    local ok=pcall(function() VirtualInputManager:SendKeyEvent(down,key,false,game) end)
    if ok then return true end
  end
  return false
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
  local caller=motion.callers[coroutine.running()]
  if state.closed or caller and (state.work.lease~=caller or not motion.ownerActive(caller.owner))then return false end
  if VirtualInputManager then
    local ok=pcall(function()
      VirtualInputManager:SendMouseButtonEvent(math.floor(x),math.floor(y),0,true,game,0)
      task.wait(.06)
      VirtualInputManager:SendMouseButtonEvent(math.floor(x),math.floor(y),0,false,game,0)
    end)
    if ok then return true end
  end
  if type(mousemoverel)=='function' and type(mouse1click)=='function' then
    local ok=pcall(function()
      local m=UserInputService:GetMouseLocation()
      mousemoverel(math.floor(x-m.X),math.floor(y-m.Y))
      task.wait(.035)
      mouse1click()
    end)
    if ok then return true end
  end
  return false
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
    if (obj:IsA('TextLabel') or obj:IsA('TextButton')) and labelVisible(obj) and (not state.gui or not obj:IsDescendantOf(state.gui)) then
      if type(obj.Text)=='string' and obj.Text:lower():find(term:lower(),1,true) then return true,obj end
    end
  end
  return false,nil
end
-- Verified against the client-visible modules in the supplied WANTED place export.
-- The live game might differ; every module operation is protected and has a fallback.
local liveModuleCache={}
liveModule=function(name)
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
-- Preserved Wiki-based rarity table. Indexed Wiki coverage was checked; live freshness is unverified.
-- IMPORTANT: Money Printer and Present = Mythic is the user's filter preference;
-- the wiki does not list their tiers on its ordinary valuables table.
-- Wiki weapons are classified separately by exact base model / variant.
state.wikiRarities={
  -- Common
  ["Silver Bar"]="Common",
  ["Silver Ring"]="Common",
  ["PearWatch"]="Common",
  ["PearPods"]="Common",
  ["PearPhone"]="Common",
  ["HDD"]="Common",
  ["PSU"]="Common",
  ["GoldPhone"]="Common",
  ["PearPad"]="Common",
  ["Batteries"]="Common",
  ["Capacitors"]="Common",
  ["Wires"]="Common",
  ["CPU Fan"]="Common",
  ["RAM"]="Common",
  ["Cheap White Sneakers"]="Common",
  ["Cheap Black Sneakers"]="Common",
  ["Cheap Brown Sneakers"]="Common",
  -- Uncommon
  ["Gold Bar"]="Uncommon",
  ["Gold Ring"]="Uncommon",
  ["Sapphire Ring"]="Uncommon",
  ["Silver Chain"]="Uncommon",
  ["GoldWatch"]="Uncommon",
  ["GoldPods"]="Uncommon",
  ["PearBook"]="Uncommon",
  ["Flash Drive"]="Uncommon",
  ["Cheap Laptop"]="Uncommon",
  ["Black Boots"]="Uncommon",
  ["Brown Boots"]="Uncommon",
  -- Epic
  ["Gold Brick"]="Epic",
  ["Sapphire"]="Epic",
  ["Ruby"]="Epic",
  ["Ruby Ring"]="Epic",
  ["Gold Chain"]="Epic",
  ["Emerald Ring"]="Epic",
  ["GoldPad"]="Epic",
  ["GoldBook"]="Epic",
  ["GPU"]="Epic",
  ["Secret Files"]="Epic",
  ["Sky James Reds"]="Epic",
  ["Sky James Golds"]="Epic",
  -- Legendary
  ["Emerald"]="Legendary",
  ["Amethyst"]="Legendary",
  ["Diamond"]="Legendary",
  ["Pearl Necklace"]="Legendary",
  ["Diamond Ring"]="Legendary",
  ["Amethyst Ring"]="Legendary",
  ["Rollie"]="Legendary",
  ["TPU"]="Legendary",
  ["Bitcoin"]="Legendary",
  -- Mythic
  ["Gold Bricks"]="Mythic",
  ["Money Printer"]="Mythic",
  ["Present"]="Mythic",
}
-- Respect the WANTED Wiki's item rarities; fall back to game data for unlisted items.
state.wikiRarityLookup={}
for name,tier in pairs(state.wikiRarities) do state.wikiRarityLookup[name:lower()]=tier end
function state.globalLoot.rarity(name)
  local canonical=baseLootName(name)
  if canonical=='gold brick'then return 'Epic'end
  local wikiTier=state.wikiRarityLookup[canonical]
  if wikiTier then return wikiTier end
  local objects=liveModule('Objects')
  if objects and type(objects.GetDataProperty)=='function' then
    local ok,value=pcall(objects.GetDataProperty,state.canonicalNames[canonical] or name,'rarity')
    if ok and type(value)=='string' and state.globalLoot.simple[value]~=nil then return value end
  end
  return 'Unclassified'
end
function state.globalLoot.category(name)
 local key=baseLootName(name)
 if state.weaponLookup[key] then return 'Guns' end
 if ({sapphire=true,ruby=true,emerald=true,amethyst=true,diamond=true})[key] then return 'Gems' end
 if key:find('ring',1,true) or key:find('chain',1,true) or key:find('necklace',1,true)
   or key:find('watch',1,true) or key=='rollie' then return 'Jewelry' end
 if key:find('sneaker',1,true) or key:find('boots',1,true) or key:find('sky james',1,true) then return 'Shoes' end
 if key:find('pear',1,true) or key:find('goldphone',1,true) or key:find('goldpods',1,true)
   or key:find('goldpad',1,true) or key:find('goldbook',1,true)
   or ({hdd=true,psu=true,batteries=true,capacitors=true,wires=true,['cpu fan']=true,ram=true,
   ['flash drive']=true,['cheap laptop']=true,gpu=true,tpu=true,bitcoin=true})[key] then return 'Tech' end
 return 'Other'
end
function state.globalLoot.raritySource(name)
 local key=baseLootName(name)
 if key=='money printer' or key=='present' then return 'Custom' end
 if state.wikiRarityLookup[key] then return 'Wiki' end
 return state.globalLoot.rarity(name)=='Unclassified' and 'Unknown' or 'Game'
end
-- Known source conflicts: Wiki Sapphire/Ruby=Epic vs export Rare;
-- Wiki Gold Bricks=Mythic vs export Legendary. Runtime weights remain authoritative.
-- A Golden Barrett picked by the global/airdrop filters outranks ALL other loot.
-- Other golden weapons are separate, never collapsed into ordinary AK/Deagle/Barrett.
function state.globalLoot.priority(name)
 local key=baseLootName(name)
 if key=='golden barrett m82' then return 0 end
 if key=='golden ak-47' or key=='golden deagle' then return 1 end
 local tier=state.globalLoot.rarity(name)
 if tier=='Mythic' then return 2 end
 if tier=='Legendary' then return 3 end
 if tier=='Epic' then return 4 end
 if tier=='Rare' then return 5 end
 if tier=='Uncommon' then return 6 end
 if tier=='Common' then return 7 end
 return 8
end
state.rarityOrder={Mythic=1,Legendary=2,UltraRare=3,Epic=4,Rare=5,Uncommon=6,Common=7,Unclassified=8}
table.sort(state.naturalLootCatalog,function(a,b)
  local ra,rb=state.globalLoot.rarity(a),state.globalLoot.rarity(b)
  if ra~=rb then return (state.rarityOrder[ra] or 8)<(state.rarityOrder[rb] or 8) end
  return a:lower()<b:lower()
end)
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
  bag.freeWeight=math.max(0,capacity-totalWeight)
  -- WANTED BagBackBillboard sets isBagFull only at 100%; allow a 3kg
  -- early-sell margin without pretending the game itself uses that threshold.
  bag.realFull=player:GetAttribute('isBagFull')==true
  bag.nearFull=bag.realFull or bag.freeWeight<=3.0001
  bag.informationReady=true
  local maxSell,already=nil,0
  if type(upgrades.GetValue)=='function' then
    local good,limit=pcall(upgrades.GetValue,player,'blackMarketLevel','maxSellAmount')
    if good and type(limit)=='number' then maxSell=limit end
  end
  if dialogs and type(dialogs.GetBlackMarketValues)=='function' then
    local good,amount,seconds=pcall(dialogs.GetBlackMarketValues)
    if good and type(amount)=='number' then already=amount end
    bag.limitReset=good and type(seconds)=='number' and seconds or nil
  end
  bag.remaining=maxSell and math.max(0,maxSell-already) or nil
  -- User rule, applied literally to RAW BAG VALUE, not doubled payout:
  -- below $20k => Ofy; above $20k => Ofy; at exactly $20k => Sir B
  -- only if the game's double-value black-market allowance can cover it.
  -- >= $20k ORIGINAL bag value routes to Sir B only when double payout fits allowance.
  bag.seller=(sellValue>=20000 and bag.remaining~=nil and (2*sellValue)<=bag.remaining) and 'Sir B' or 'Ofy'
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
  -- WANTED NPCs may be dynamic gizmos named by objectId rather than display name.
  local folder=workspace:FindFirstChild('Local')
  folder=folder and folder:FindFirstChild('Gizmos')
  local gizmos=liveModule('ClientGizmos')
  if folder and gizmos and type(gizmos.Get)=='function' then
    for _,model in ipairs(folder:GetChildren()) do
      local id=model:GetAttribute('objectId')
      if id~=nil then
        local ok,npc=pcall(gizmos.Get,id)
        if ok and type(npc)=='table' then
          local props=npc.properties or {}
          local named=props.npcName or props.name or props.gizmoName or npc.name
          if type(named)=='string' and named:lower()==name:lower() then
            local pos=objectWorldPosition(model)
            if pos then return pos end
          end
        end
      end
    end
  end
  -- Static WANTED map nodes include PawnOfy and SirBrayden spawn markers.
  local aliases=name=='Sir B' and {'SirBrayden','Sir B'} or {'PawnOfy','Ofy'}
  for _,alias in ipairs(aliases) do
    local node=workspace:FindFirstChild(alias,true)
    if node then
      local pos=objectWorldPosition(node)
      if pos then return pos end
    end
  end
  return nil
end
function bag.travel(point,token)
  local rootPart=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
  if not rootPart then return false,'Character unavailable' end
  local deadline=os.clock()+math.max(14,((rootPart.Position-point).Magnitude+state.navigationSettings.altitude*3)/state.speed*3+12)
  local previousDistance=math.huge;local lastProgress=os.clock()
  while bag.selling and bag.token==token and not state.closed and not state.running do
    if not characterAlive() then stopMotion();return false,'Character died' end
    rootPart=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
    if not rootPart then stopMotion();return false,'Lost character' end
    local delta=point-rootPart.Position
    local allowed,why,corrected=motion.watchTravel(rootPart,point)
    if not allowed then stopMotion();return false,why end
    if corrected then lastProgress=os.clock();previousDistance=delta.Magnitude;deadline=os.clock()+math.max(14,delta.Magnitude/state.speed*3+12)end
    if delta.Magnitude<=9 then motion.arrived();stopMotion();return true end
    if delta.Magnitude<previousDistance-2 then previousDistance=delta.Magnitude;lastProgress=os.clock() end
    if os.clock()>deadline or (not state.work.lease.travelPlan and os.clock()-lastProgress>12) then stopMotion();return false,'Could not reach seller' end
    startNoclip()
    motion.travel(rootPart,point,state.speed,'seller')
    RunService.Heartbeat:Wait()
  end
  stopMotion();return false,'Stopped'
end
function bag.sell()
  if bag.selling or state.closed or state.running or state.work.lease then return end
  if not bag.informationReady or bag.value<=0 then return end
  bag.manualRequested=false
  bag.selling=true;bag.token=bag.token+1;local token=bag.token
  state.work.launch('seller',token,function()
    local success,why=pcall(function()
      -- Re-read right before choosing the seller, including any allowance changes.
      local good,err=bag.read()
      if not good then error(err) end
      if bag.value<=0 then error('Nothing to sell') end
      local seller=bag.seller
      bag.status='Selling to '..seller
      local point=bag.findSellerPosition(seller)
      if not point and seller=='Sir B' then
        note('WARN','Sir B not located; trying Ofy at regular price')
        seller='Ofy';bag.status='Selling to Ofy';point=bag.findSellerPosition('Ofy')
      end
      if not point then error(seller..' position unavailable; check map marker or NPC replication') end
      local reached,movement=bag.travel(point,token)
      if not reached then error(movement) end
      if not bag.selling or bag.token~=token then error('Canceled') end
      local network=liveModule('Network')
      if not network or type(network.InvokeServer)~='function' then error('Network.InvokeServer unavailable') end
      local previousValue=bag.value
      -- Mirrors the game's legitimate dialogue callback, within NPC interaction range.
      local invoked,result=state.work.nativeCall(10,'sellLoot',network.InvokeServer,'sellLoot',seller,seller=='Sir B' and true or nil)
      -- An explicit refusal from Sir B is safe to handle by selling to Ofy.
      -- An InvokeServer timeout is NOT proof of refusal: never retry an
      -- unknown-outcome sale at another vendor (that could duplicate it).
      if seller=='Sir B' and invoked and result==false then
        note('WARN','Sir B explicitly refused the sale; switching to Ofy')
        local fallback=bag.findSellerPosition('Ofy')
        if not fallback then error('Sir B rejected sale; Ofy not located') end
        local arrived,travelWhy=bag.travel(fallback,token)
        if not arrived then error('Ofy fallback travel: '..tostring(travelWhy)) end
        local fresh,freshWhy=bag.read()
        if not fresh then error('Bag read after Sir B refusal: '..tostring(freshWhy)) end
        if bag.value<=0 then error('Bag emptied before fallback; sale status requires review') end
        seller='Ofy';bag.status='Selling to Ofy'
        invoked,result=state.work.nativeCall(10,'sellLoot',network.InvokeServer,'sellLoot','Ofy')
      end
      if not invoked or result~=true then error('Server refused '..seller..' sale or outcome unknown: '..tostring(result)) end
      local accepted=false
      for _=1,35 do
        if not bag.selling or bag.token~=token then break end
        task.wait(.2)
        bag.read()
        if bag.value<previousValue then accepted=true;break end
      end
      if not accepted then error('Sale response received, but bag contents did not change') end
      bag.lastSold=os.clock();bag.aboveSince=nil;af.needsSell=false;state.sellRequested=false;bag.manualRequested=false
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
    if bag.token==token then bag.selling=false;state.bankFarmSellPending=false;stopMotion() end
  end)
end
function bag.tick()
  if state.closed then return end
  local good,err=bag.read()
  if not good then bag.status='Bag unavailable';bag.error=err;return end
  if bag.selling then return end
  if bag.nearFull and bag.value<=0 then bag.status='Bag full with no saleable valuables';return end
  if bag.percent>0.25 then
    if not bag.aboveSince then bag.aboveSince=os.clock() end
  else bag.aboveSince=nil end
  -- A manual Sell Bag Now request must work even when every farm toggle is OFF.
  -- The old idle guard unintentionally discarded that request at the next tick.
  if state.running or (not bag.manualRequested and not af.enabled and not af.requested
      and not state.bankFarmSellPending and not (state.bankFarm and state.bankFarm.autoMode)) then
    bag.status='Idle';return
  end
  if os.clock()-bag.lastFail<60 then bag.status='Sell Failed';return end
  if bag.value<=0 then bag.status='Farming';return end
  if bag.value>0 and (bag.nearFull or bag.manualRequested or (bag.aboveSince and os.clock()-bag.aboveSince>=bag.earlyMinutes*60)) then
    state.sellRequested=true;bag.status=bag.nearFull and ('Selling at '..string.format('%.1f',bag.freeWeight)..'kg free') or 'Queued for sale'
  elseif not af.needsSell and not bag.manualRequested then state.sellRequested=false;bag.status='Farming' end
end
-- Queue a manual sale without racing any active worker. The existing scheduler
-- interrupts a running bank/airdrop farm and resumes its saved preferences later.
function bag.sellNow()
  local ok,why=bag.read()
  if not ok then warning('Sell Bag Now: '..tostring(why));return false end
  if bag.value<=0 then warning('Sell Bag Now: bag has no saleable items');return false end
  if state.running or bank.isTutorial and bank.running then
    warning('Sell Bag Now: finish or stop the active tutorial/quest first');return false
  end
  bag.manualRequested=true;state.sellRequested=true
  bag.lastFail=-math.huge
  bag.status='Manual sale queued · '..bag.seller
  log('Sell Bag Now queued · '..bag.seller)
  return true
end

function bank.capture()
  local r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
  if bank.running then warning('Stop the bank route before recording a waypoint');return end
  if not r then warning('Bank recorder: character position unavailable');return end
  local key=bank.steps[bank.index][1]
  local p=r.Position;local d=r.CFrame.LookVector
  local cam=workspace.CurrentCamera
  local look=cam and cam.CFrame.LookVector or d
  local function rd(v) return math.floor(v*100+.5)/100 end
  bank.points[key]={x=rd(p.X),y=rd(p.Y),z=rd(p.Z),lookX=rd(look.X),lookY=rd(look.Y),lookZ=rd(look.Z)}
  bank.routeSource='Saved account route';bank.routePlace=game.PlaceId
  saveFile(bankRouteFile,{placeId=game.PlaceId,points=bank.points})
  log('Bank recorded: '..bank.steps[bank.index][2])
  if bank.index<#bank.steps then bank.index=bank.index+1 end
end
function bank.export()
  local result={source=bank.routeSource,placeId=game.PlaceId,bankCashRequired=bank.cashRequirement(),elevatorRequired=true,tutorialStart='Verified native elevator, then free_c4',referenceOnly={'bank_entrance','bank_upper'},steps={}}
  for _,step in ipairs(bank.steps) do
    local record=bank.points[step[1]]
    table.insert(result.steps,{id=step[1],label=step[2],action=step[3],position=record or 'NOT RECORDED',tutorialActive=step[1]~='bank_entrance'and step[1]~='bank_upper'})
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
function bank.completionRead()
 local tasks=liveModule('ClientTasks')
 if tasks and type(tasks.IsTaskComplete)=='function'then
  local ok,value=pcall(tasks.IsTaskComplete,'BankTutorial')
  if ok and type(value)=='boolean'then return value end
 end
 return nil
end
function bank.check()
 local value=bank.completionRead();local now=os.clock()
 bank.completionKnown=value~=nil
 if value==true then
  if not bank.firstCompletionRead then bank.firstCompletionRead=now end
  if now-bank.firstCompletionRead>=.75 then
   local previously=bank.done;bank.done=true;state.tutorialReady=true
   bank.status='Tutorial complete (two game checks)';bank.autoStatus='Completed (game verified)'
   if not previously then checkpoint();log('Bank tutorial confirmed by two spaced game reads')end
   if isListed and safeUrl()and not bank.trackerEventQueued then
    bank.trackerEventQueued=true
    task.spawn(function()report('tutorial_complete','bank_tutorial',0,'Two spaced ClientTasks completion reads',true)end)
   end
   return true
  end
  bank.status='Verifying tutorial completion';return false
 end
 bank.firstCompletionRead=nil;bank.done=false
 local tasks=liveModule('ClientTasks');local data
 if tasks and type(tasks.GetTaskData)=='function'then local ok,v=pcall(tasks.GetTaskData,'BankTutorial');if ok then data=v end end
 if type(data)=='table'then
  bank.cashStolen=tonumber(data.bankCashStolen)or 0
  bank.status='Bank stage '..tostring(data.currentStep or '?')..' | $'..bank.cashStolen..' / $5000'
 else bank.status=value==nil and 'Task completion unknown; waiting for game data'or 'Tutorial not complete'end
 return false
end
function bank.verifyTwice(token)
 bank.firstCompletionRead=nil;bank.done=false
 local deadline=os.clock()+5
 repeat
  if not bank.active(token)then return false end
  local confirmed=bank.check()
  state.diagnostics.snapshot('bank_completion',{confirmed=confirmed,read=tostring(bank.completionRead()),status=bank.status,cash=bank.cashStolen or 0,reruns=bank.reruns or 0})
  if confirmed then return true end
  task.wait(.25)
 until os.clock()>=deadline
 return false
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
  state.diagnostics.mark('amulet_ownership_checked',tostring(localNamedItem(name)),'ClientTools')
  if toolEquipped(name) then
    state.amuletHeld=true;state.diagnostics.mark('amulet_equip_confirmed','already equipped','ClientTools')
    return true
  end
  local tools=itemClient();local itemId=toolIdNamed(name);local syncDeadline=os.clock()+3
  while not itemId and token and valid(token)and os.clock()<syncDeadline do task.wait(.15);tools=itemClient();itemId=toolIdNamed(name)end
  if token and not valid(token)then return false end
  state.quest.equipmentError=nil
  if player:GetAttribute('backpackEnabled')==false then state.quest.equipmentError='Game currently disables equipment (backpackEnabled=false)';return false end
  if itemId and tools and type(tools.ToggleEquip)=='function' then
    state.diagnostics.mark('amulet_equip_before','item ID located','ClientTools.ToggleEquip')
    local ok,equipped=state.work.nativeCall(5,'questAmuletEquip',tools.ToggleEquip,itemId)
    state.diagnostics.mark('amulet_equip_after',ok and 'returned'or tostring(equipped),'ClientTools.ToggleEquip')
    if ok then
      for attempt=1,14 do
        if token and not waitUntilActive(token) then return false end
        if toolEquipped(name) then
          state.amuletHeld=true
          state.diagnostics.mark('amulet_equip_confirmed','verified equipped item','ClientTools')
          report('phase','speaker_equipped',state.confirmedGhost,'Equipped by item ID',false)
          return true
        end
        task.wait(.15)
      end
    end
    if state.work.nativeUnknown.questAmuletEquip then
      state.quest.terminalFailure='Amulet equip outcome unknown; automatic retry withheld';return false
    end
    warning('Amulet ID located but equip not confirmed')
  elseif tools and not itemId then
    state.amuletHeld=false
    return false -- No speaker in inventory: do not pick an arbitrary wheel slot.
  end
  state.amuletHeld=false
  state.quest.equipmentError='Amulet owned but native equip unconfirmed; inventory UI was not opened'
  if not tools or type(tools.ToggleEquip)~='function'then state.quest.equipmentError='Native ClientTools.ToggleEquip unavailable; ownership/equip cannot be verified'end
  state.diagnostics.mark('amulet_equip_unavailable',state.quest.equipmentError);return false
end

local function attemptE(token,seconds)
  if token and not waitUntilActive(token) then return false end
  -- Some Roblox experiences use ProximityPrompt; WANTED primarily uses custom Interactions.
  local root=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
  if root and type(fireproximityprompt)=='function' then
    local best,bestDist=nil,18
    for _,o in ipairs(workspace:GetDescendants()) do
      if o:IsA('ProximityPrompt') and o.Enabled and o.Parent and o.Parent:IsA('BasePart') then
        local d=(o.Parent.Position-root.Position).Magnitude
        if d<bestDist and d<=o.MaxActivationDistance+3 then best,bestDist=o,d end
      end
    end
    if best and pcall(fireproximityprompt,best) then return true end
  end
  return tap(Enum.KeyCode.E,token,seconds or .22)
end
-- Native, range-restricted world pickups used by quests and the bank tutorial.
function state.findWorldGizmo(wanted,radius)
  local api=liveModule('ClientGizmos')
  local folder=workspace:FindFirstChild('Local')
  folder=folder and folder:FindFirstChild('Gizmos')
  local root=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
  if not api or type(api.Get)~='function' or not folder or not root then
    return nil,'ClientGizmos / character unavailable'
  end
  local best,bestDist=nil,radius or 16
  for _,m in ipairs(folder:GetDescendants()) do
    if m:IsA('Model') and m.PrimaryPart then
      local d=(root.Position-m.PrimaryPart.Position).Magnitude
      if d<bestDist then
        local id=m:GetAttribute('objectId')
        if id~=nil then
          local ok,g=pcall(api.Get,id)
          if ok and type(g)=='table' and type(g.AttemptCollect)=='function' then
            local prop=type(g.properties)=='table' and g.properties or {}
            if prop.toolName==wanted or g.name==wanted then best,bestDist=g,d end
          end
        end
      end
    end
  end
  return best,best and ('within '..math.floor(bestDist)..' studs') or ('No '..wanted..' pickup nearby')
end
function state.tryEquipTool(name,alive)
  if alive and not alive()then return false end
  if toolEquipped(name) then return true end
  local tools=itemClient();local id=toolIdNamed(name)
  if not id or not tools or type(tools.ToggleEquip)~='function' then return false end
  local ok=pcall(tools.ToggleEquip,id)
  if not ok then return false end
  for _=1,9 do
    if alive and not alive()then return false end
    if toolEquipped(name) then return true end
    task.wait(.12)
  end
  return false
end
-- A Speaker's Amulet is a WorldItem gizmo, not a generic E prompt.
function state.findSpeakerPickup()
  return state.findWorldGizmo('Speakers Amulet',24)
end
function state.standingForInteraction()
  if not characterAlive() then return false,'Character unavailable' end
  local api=liveModule('ClientPlayers')
  if not api or type(api.Get)~='function' then return false,'Waiting for ClientPlayers interaction state' end
  local ok,client=pcall(api.Get)
  if not ok or not client or type(client.IsPlayerStanding)~='function' then return false,'Player interaction state unavailable' end
  local read,standing=pcall(client.IsPlayerStanding,client)
  if not read or not standing then return false,'Cannot interact while knocked, crawling, ragdolled or grabbed' end
  return true
end
function bank.interactionPosition(g,model)
  if g.prompt and type(g.prompt.GetPosition)=='function' then
    local ok,p=pcall(g.prompt.GetPosition,g.prompt)
    if ok and typeof(p)=='Vector3' then return p end
  end
  local rootPart=model and model.PrimaryPart
  local attachment=rootPart and rootPart:FindFirstChild('PromptAttachment')
  if attachment and attachment:IsA('Attachment') then return attachment.WorldPosition end
  return rootPart and rootPart.Position or g.cframe and g.cframe.Position
end
function bank.c4Ready()
  local id,item=toolIdNamed('C4')
  if not id or not item then return false end
  local ammo=tonumber(item.ammo or item.toolState and item.toolState.ammo)
  if ammo~=nil then return ammo>0 end
  -- Ownership is enough to attempt equip; actual loaded/synced ammo is checked before throw.
  return true
end

function bank.c4Objective()
 local data=bank.taskData and bank.taskData()or nil
 if data and data.didFindExplosive==true then return false,true end
 local tasks=liveModule('ClientTasks');local obj,properties
 if tasks and type(tasks.GetTask)=='function'then local ok,v=pcall(tasks.GetTask,'BankTutorial');if ok then obj=v end end
 if obj and type(obj.GetTaskProperties)=='function'then local ok,v=pcall(obj.GetTaskProperties,obj);if ok then properties=v end end
 if not properties then local list=liveModule('TaskList');properties=list and list.BankTutorial end
 local step=properties and properties.steps and data and properties.steps[tonumber(data.currentStep)]
 for _,req in ipairs(step and step.requirements or {})do if req.requirementType=='FindBomb'then return req.isOptional~=true,false end end
 return data and data.didFindExplosive==false or false,false
end
function bank.acquireC4(token,door,mandatory)
  local started,lastAttempt=os.clock(),-math.huge
  local reason='BankC4 has not streamed in'
  while bank.active(token) and os.clock()-started<22 do
    local required,credited=bank.c4Objective()
    if mandatory=='tutorial_pickup' and (credited or (not required and bank.c4Ready())) then return true,'C4 pickup verified by tutorial credit or ownership'end
    if mandatory==true and credited then return true,'C4 pickup credited by task'end
    if not mandatory and bank.isOpen(door)then return true,'Vault already open'end
    if not mandatory and bank.c4Ready() then return true,'C4 ownership and ammunition confirmed' end
    local api=liveModule('ClientGizmos')
    local ok,g=pcall(function()return api and api.GetGizmoByTag and api.GetGizmoByTag('BankC4')end)
    if ok and type(g)=='table' then
      local position=bank.interactionPosition(g,g.model)
      local r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
      if g.used or g.gizmoState and g.gizmoState.used then
        reason='Free BankC4 is used/on cooldown; waiting for inventory replication'
      elseif not position or not r then reason='BankC4 interaction position is not ready'
      elseif (r.Position-position).Magnitude>14 then
        reason='Recorded free_c4 is outside the actual pickup range (14 studs)'
      elseif type(g.Interact)~='function' then reason='BankC4 native Interact method is unavailable'
      else
        local standing,why=state.standingForInteraction()
        reason=standing and 'Waiting for C4 ownership and usable ammunition' or why
        if standing and os.clock()-lastAttempt>=1.25 then
          lastAttempt=os.clock()
          local sent,err=state.work.nativeCall(6,g,g.Interact,g)
          if not sent then reason='BankC4 interaction failed: '..tostring(err) end
        end
      end
    end
    bank.autoStatus=reason
    task.wait(.25)
  end
  return false,bank.active(token) and reason or 'Canceled or character unavailable'
end
-- Quest state comes from task data; cached checkpoints are never completion evidence.
state.quest={stage='idle',currentNPC='',lastFailure='',keyState='unknown',required=9,attempt=0,waypoints={}}
if progress and progress.userId==player.UserId and progress.placeId==game.PlaceId then
  state.quest.keyCollectedPreviously=progress.keyCollectedPreviously==true
  for key,name in pairs(progress.ghostRouteVersion==29 and type(progress.questWaypoints)=='table'and progress.questWaypoints or {})do
    local index=tonumber(key)
    if index and index>=1 and index<=#route.ghosts and type(name)=='string'then state.quest.waypoints[index]=name end
  end
end
-- Event presentation is resolved from verified phase evidence, not the last found count.
state.quest.evidenceSerial=0
if progress and progress.userId==player.UserId and progress.placeId==game.PlaceId then
 local receipt=progress.questCompletionReceipt
 if type(receipt)=='table'and receipt.version==1 and receipt.task=='SpeakerForTheDead'and receipt.handedIn==true and receipt.keyVerified==true then
  state.quest.completionReceipt=receipt;state.quest.handedInObserved=true;state.quest.keyCollectedPreviously=true
 end
end
function state.quest.complete()
 local q=state.quest
 if not q.handedInObserved and not state.serverQuestComplete then return false end
 if not q.keyCollectedPreviously then return false end
 local changed=not q.workflowComplete
 q.workflowComplete=true;q.stage='complete';q.phase='COMPLETED';q.currentNPC='';q.currentWaypoint=nil
 state.paused=false;state.awaiting=false
 q.attempt=0;q.lastFailure='';q.terminalFailure=nil;q.equipmentError=nil;state.routeError=''
 q.completionReceipt=q.completionReceipt or {version=1,task='SpeakerForTheDead',handedIn=true,keyVerified=true}
 if changed then checkpoint()end
 if q.render then q.render()end
 return true
end
function state.quest.display()
 local q=state.quest;local active=state.running and state.work.owns('quest',state.token)and not q.workflowComplete
 local phase
 if q.workflowComplete then phase='COMPLETED'
 elseif q.handedInObserved or state.serverQuestComplete then phase='KEY_PICKUP'
 elseif q.stage=='handing_in'then phase='HANDING_IN'
 elseif q.turnInObserved or q.handInReady then phase='TURN_IN'
 elseif q.stage=='failed'then phase='FAILED'
 elseif q.stage=='canceled'then phase='CANCELED'
 elseif q.stage=='recovering'or state.died and active then phase='RECOVERING'
 elseif q.stage=='speaker_pickup'or q.stage=='reacquire_speaker'or q.stage=='speaker_equipped'then phase='AMULET'
 elseif active and (q.stage=='main_ghost'or q.stage=='accepting')then phase='ACCEPTING'
 elseif state.missionVerified then phase='GHOSTS'
 else phase='NOT_STARTED'end
 q.phase=phase
 local view={phase=phase,active=active,status='Not started',objective='Accept Speaker For The Dead',detail='',info='Key possession is checked separately from quest progress.',fill=0,button='Start quest'}
 if phase=='COMPLETED'then
  view.status='FINISHED — SKELETON KEY COLLECTED';view.objective='All ghost objectives completed';view.detail='Quest successfully handed in';view.info='Skeleton Key pickup verified for this account';view.fill=1;view.button='Finished'
 elseif phase=='KEY_PICKUP'then
  view.status='Quest handed in';view.objective='Locating Skeleton Key';view.detail=q.bonesObserved and '30,000 Bones awarded' or 'Hand-in verified; key pickup pending';view.fill=.95;view.button='Pick up key'
 elseif phase=='TURN_IN'or phase=='HANDING_IN'then
  view.status=phase=='HANDING_IN'and 'Handing in quest'or 'Ghost objectives completed';view.objective='Return to the main Ghost';view.detail=phase=='HANDING_IN'and 'Returning to main Ghost'or 'Turn in: 0/1';view.fill=.85;view.button='Turn in'
 elseif phase=='GHOSTS'then
  view.status='Speaking to ghosts';view.objective='Confirmed ghosts: '..state.confirmedGhost..'/'..q.required
  view.detail=(active and q.currentNPC~=''and q.currentNPC..'  ·  'or '')..(active and 'Attempt '..math.max(1,q.attempt)..'/4'or 'Ready to resume')
  view.fill=.15+.65*math.clamp(state.confirmedGhost/math.max(1,q.required),0,1);view.button='Resume quest'
 elseif phase=='AMULET'then view.status='Acquiring or equipping amulet';view.objective='Speaker’s Amulet';view.fill=.1
 elseif phase=='ACCEPTING'then view.status='Accepting mission';view.objective='Speaking to the main Ghost';view.fill=.03
 elseif phase=='RECOVERING'then view.status='Recovering';view.objective='Waiting for safe movement and current quest data';view.button='Resume quest'
 elseif phase=='FAILED'then view.status='Stopped after unsuccessful attempts';view.objective='Quest objective remains unconfirmed';view.button='Retry quest'
 elseif phase=='CANCELED'then view.status='Canceled';view.objective='Progress retained; resume when ready';view.button='Resume quest'end
 if phase~='COMPLETED'and q.lastFailure~=''then view.detail=view.detail..(view.detail~=''and '\n'or '')..q.lastFailure end
 if active and state.paused then view.status='Paused · '..view.status end
 return view
end

function state.quest.properties()
  local tasks=liveModule('ClientTasks')
  if tasks and type(tasks.GetTask)=='function'then
    local ok,obj=pcall(tasks.GetTask,'SpeakerForTheDead')
    if ok and obj and type(obj.GetTaskProperties)=='function'then
      local yes,properties=pcall(obj.GetTaskProperties,obj);if yes and type(properties)=='table'then return properties end
    end
  end
  local list=liveModule('TaskList');return list and list.SpeakerForTheDead
end
function state.quest.keyRequirement()
  local properties=state.quest.properties()
  if not properties or type(properties.steps)~='table'then return nil,'Live quest requirements unavailable'end
  local required=false
  for _,step in ipairs(properties.steps)do
    for _,req in ipairs(step.requirements or {})do
      if req.requirementType=='MeetGhosts'then
        state.quest.required=tonumber(req.required or req.total)or 9;state.quest.identities={}
        for _,name in ipairs(req.validNPCNames or req.validNPCs or {})do state.quest.identities[name]=true end
      end
      -- Only an explicit objective/prerequisite names an item requirement; rewards are not prerequisites.
      if req.itemName=='Skeleton Key'or req.toolName=='Skeleton Key'or req.requiredItem=='Skeleton Key'then required=true end
    end
  end
  local prerequisites=properties.prerequisites
  if type(prerequisites)=='table'then
    for _,field in ipairs({'items','tools','requiredItems'})do
      if type(prerequisites[field])=='table'then
        for key,value in pairs(prerequisites[field])do if key=='Skeleton Key'or value=='Skeleton Key'then required=true end end
      end
    end
  end
  return required,required and 'Live task requires Skeleton Key'or 'Live task has no Skeleton Key requirement'
end
function state.quest.refreshKey()
  local owned=localNamedItem('Skeleton Key')~=nil and localNamedItem('Skeleton Key')~=false
  state.keyInInventory=owned
  local required,why=state.quest.keyRequirement()
  state.quest.keyRequired=required;state.quest.keyReason=why
  if state.serverQuestComplete and not owned then state.quest.keyState='missing';return owned,required end
  if owned then state.quest.keyState='owned'
  elseif required==false then state.quest.keyState='not required'
  elseif required==true then state.quest.keyState='missing'
  else state.quest.keyState='unknown'end
  return owned,required
end
function state.quest.ensureKey(token)
  local owned,required=state.quest.refreshKey()
  if owned or required==false then return true end
  if required==nil then return false,'Key prerequisite unknown: live task definition unavailable'end
  state.quest.stage='acquiring_key';state.quest.keyState='acquiring'
  for attempt=1,3 do
    if not waitUntilActive(token)then return false,'Stopped'end
    local pickup=state.findWorldGizmo('Skeleton Key',15000)
    if not pickup or not pickup.model or not pickup.model.PrimaryPart then
      state.quest.refreshKey();return false,'Skeleton Key is required but no real key pickup is streamed; acquisition location must be observed in the live game'
    end
    local position=bank.interactionPosition(pickup,pickup.model)
    local reached,why=flyTo({x=position.X,y=position.Y+2,z=position.Z},token,'key_check',state.confirmedGhost,2)
    if not reached then return false,why end
    if not valid(token)then return false,'Stopped'end
    local standing,reason=state.standingForInteraction();if not standing then return false,reason end
    local r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
    if not r or (r.Position-position).Magnitude>10 then return false,'Outside Skeleton Key pickup range'end
    state.work.nativeCall(10,pickup,pickup.AttemptCollect,pickup,player)
    for _=1,15 do
      if not valid(token)then return false,'Stopped'end
      if state.quest.refreshKey()then return true end
      task.wait(.2)
    end
  end
  state.quest.refreshKey();return false,'Skeleton Key ownership not confirmed after three attempts'
end

-- Reuse a short-lived model inventory; resolve live gizmos only inside the target radius.
state.npcCache={folder=nil,models={},expires=0}
function state.npcModels()
  local folder=workspace:FindFirstChild('Local');folder=folder and folder:FindFirstChild('Gizmos')
  local c=state.npcCache
  if folder~=c.folder or os.clock()>=c.expires then
    c.folder=folder;c.expires=os.clock()+.75;c.models={}
    if folder then for _,m in ipairs(folder:GetDescendants())do
      if m:IsA('Model')and m:GetAttribute('objectId')~=nil then table.insert(c.models,m)end
    end end
  end
  return c.models,folder
end
function state.resolveNPC(wanted,point,radius,accept)
  local api=liveModule('ClientGizmos')
  if not api or type(api.Get)~='function' then return nil end
  local center=Vector3.new(point.x,point.y,point.z)
  local best,dist=nil,radius or 85
  local models,folder=state.npcModels()
  for _,m in ipairs(models)do
    if m.Parent and m.PrimaryPart and m:IsDescendantOf(folder)then
      local d=(m.PrimaryPart.Position-center).Magnitude
      if d<dist then
        local ok,g=pcall(api.Get,m:GetAttribute('objectId'))
        if ok and type(g)=='table'and type(g.interaction)=='table'and g.interaction.dialogue
          and (not wanted or g.name==wanted)and (not accept or accept(g))then
          best={gizmo=g,model=m,name=g.name,position=m.PrimaryPart.Position};dist=d
        end
      end
    end
  end
  return best
end
function state.npcActive(token)
 local lease=state.work.lease
 if not lease or lease.token~=token or not motion.ownerActive(lease.owner)or not characterAlive()then return false end
 if lease.owner=='quest'then return waitUntilActive(token)end
 return lease.owner=='ammo'or lease.owner=='shop'
end
function state.npcReady(npc,token,rootPart)
  if not state.npcActive(token)then return false,'Stopped or character unavailable'end
  local r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
  if not r or rootPart and rootPart~=r then return false,'Character changed during interaction'end
  if not npc or not npc.model or not npc.model:IsDescendantOf(workspace)or not npc.model.PrimaryPart then return false,'NPC disappeared'end
  local lease=state.work.lease
  if lease.owner=='quest'and lease.ghostCamera then
   local landed,why=motion.landing.verify(r);if not landed then return false,why end
   if not state.camera.current then
    local record=lease.ghostCamera;local ok,reason=state.camera.overhead(record.point,record.focus,record.model);if not ok then return false,reason end
    task.wait(.15)
   end
   local aligned,reason=state.camera.verifyOverhead(lease);if not aligned then return false,reason end
  end
  local g=npc.gizmo
  if g.model and g.model~=npc.model then return false,'NPC instance changed'end
  local manor=lease.ghostCamera and lease.ghostCamera.point.name=='manor ghost'
  local range=(tonumber(g.interaction.promptDistance)or 0)-(manor and 0 or 1)
  if (r.Position-npc.model.PrimaryPart.Position).Magnitude>range then return false,'NPC out of range'end
  if g.isGhost and g.isHidden~=false and g.ghostVisible~=true then return false,'Ghost is hidden'end
  local standing,why=state.standingForInteraction();if not standing then return false,why end
  if manor then
   if type(g._canSee)~='function'then return false,'Manor native visibility check unavailable; interaction withheld'end
   local ok,seen=pcall(g._canSee,g)
   state.diagnostics.snapshot('manor_native_visibility',{queryOK=ok,visible=ok and seen==true,error=not ok and tostring(seen)or '',distance=(r.Position-npc.position).Magnitude,range=range})
   if not ok then return false,'Manor native visibility query failed; obstruction not confirmed'end
   if seen~=true then return false,'Manor native visibility rejects interaction'end
   local prompt=g.prompt
   if prompt then
    if type(prompt.GetAdornee)=='function'then
     local yes,adornee=pcall(prompt.GetAdornee,prompt)
     if not yes or typeof(adornee)~='Instance'or not adornee:IsDescendantOf(npc.model)then return false,'Manor prompt target does not match the NPC'end
    end
    for _,method in ipairs({'IsEnabled','IsVisible','IsVisible2','CanSee'})do
     if not g.hasInteracted and type(prompt[method])=='function'then
      local yes,value=pcall(prompt[method],prompt)
      if not yes or value~=true then return false,'Manor native prompt unavailable: '..method end
     end
    end
   end
  elseif type(g._canSee)=='function'then local ok,seen=pcall(g._canSee,g);if not ok or not seen then return false,'Line of sight blocked'end end
  if not g.hasInteracted and type(g.interaction.canInteract)=='function'then
    local ok,yes=pcall(g.interaction.canInteract,g);if not ok or not yes then return false,'NPC refuses interaction'end
  end
  return true
end
function state.prepareNPC(name,point,token)
  state.quest.currentNPC=name
  local npc
  for _=1,25 do
    if not waitUntilActive(token)or not characterAlive()then return false,'Stopped or character unavailable'end
    npc=state.resolveNPC(name,point,85);if npc then break end;task.wait(.2)
  end
  if not npc then return false,'NPC '..name..' not streamed near the recorded waypoint'end
  state.diagnostics.mark('npc_resolved',name)
  local g=npc.gizmo;local range=tonumber(g.interaction.promptDistance)
  if not range or range<=3 then return false,'NPC prompt range unavailable'end
  if g.isGhost and not equipAmulet(token)then return false,state.quest.terminalFailure or state.quest.equipmentError or 'Speaker missing'end
  local r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
  if not r then return false,'Character unavailable'end
  motion.landing.begin(point)
  local destination=Vector3.new(point.x,point.y,point.z)
  if (r.Position-destination).Magnitude>.35 then
    local reached,why=flyTo(point,token,'npc_approach',state.confirmedGhost,.35);if not reached then return false,why end
  end
  r=root();if not r or (r.Position-destination).Magnitude>.35 then return false,'Recorded character waypoint arrival unconfirmed'end
  state.diagnostics.snapshot('ghost_position',{waypoint=point.name or name,destination=destination,recordedY=point.y,player=r.Position,distance=(r.Position-destination).Magnitude,camera=point.camX and Vector3.new(point.camX,point.camY,point.camZ)or 'not recorded',look=point.lookX and Vector3.new(point.lookX,point.lookY,point.lookZ)or 'not recorded',phase=state.quest.stage,owned=localNamedItem('Speakers Amulet'),equipped=toolEquipped('Speakers Amulet'),attempt=state.quest.attempt})

  local deadline=os.clock()+4
  repeat
    if not waitUntilActive(token)or not characterAlive()then return false,'Stopped or character unavailable'end
    npc=state.resolveNPC(name,point,85)
    if npc then g=npc.gizmo;if not g.isGhost or g.isHidden==false or g.ghostVisible==true then break end end
    task.wait(.2)
  until os.clock()>=deadline
  if not npc then return false,'NPC unstreamed during approach'end
  if g.isGhost and g.isHidden~=false and g.ghostVisible~=true then return false,'Ghost still hidden after amulet, approach and visibility wait'end
  if point.name=='manor ghost' then
   local distance=(r.Position-npc.position).Magnitude
   state.diagnostics.snapshot('manor_target',{npc=npc.name,distance=distance,range=range,hidden=g.isHidden,equipped=toolEquipped('Speakers Amulet'),phase=state.quest.stage})
   if distance>range then
    state.diagnostics.mark('npc_outside_range','Manor exceeds native promptDistance; recorded position retained')
    return false,'Manor outside native interaction range; recorded point retained'
   end
  end


  local landed,landingWhy=motion.landing.verify(r);if not landed then return false,'Landing unstable: '..tostring(landingWhy)end
  local cameraReady,cameraWhy=state.camera.overhead(point,npc.position,npc.model);if not cameraReady then return false,cameraWhy end
  task.wait(.15)
  local aligned,alignWhy=state.camera.verifyOverhead(state.work.lease);if not aligned then return false,alignWhy end
  state.diagnostics.mark('camera_alignment_confirmed',name)
  local ready,why=state.npcReady(npc,token,r);if not ready then return false,why end
  state.diagnostics.mark('interaction_conditions_confirmed','standing, range and visibility checked')
  return npc
end
function state.questOption(panel,control,token)
  if not valid(token)or not panel or not control:IsDescendantOf(panel)then return false end
  local row=control
  while row and row.Parent~=panel:FindFirstChild('Holder')do row=row.Parent end
  local background=row and row:FindFirstChild('Background')
  local button=background and background:FindFirstChild('Button')
  if not button or not button:IsA('GuiButton')then return false end
  if UserInputService.TouchEnabled then
    state.quest.terminalFailure='Unsupported interaction: native task request unconfirmed; select the mission option manually'
    state.diagnostics.mark('option_unavailable',state.quest.terminalFailure);return false
  end
  state.diagnostics.mark('option_action_before','verified option button','desktop click')
  local point=button.AbsolutePosition+button.AbsoluteSize*.5
  local ok=vclick(point.X,point.Y)
  state.diagnostics.mark('option_action_after',tostring(ok),'desktop click');return ok
end
function state.npcDialogueInput(npc,token)
  if not state.npcActive(token)then return false,'Stopped'end
  local ready,why=state.npcReady(npc,token);if not ready then return false,why end
  local g=npc.gizmo;local r=player.Character:FindFirstChild('HumanoidRootPart')
  if g.hasInteracted then
    state.diagnostics.mark('dialogue_observed','intended NPC hasInteracted');return true,'Dialogue already open'
  end
  local distance=(r.Position-npc.model.PrimaryPart.Position).Magnitude
  local api=liveModule('ClientGizmos');local models=state.npcModels()
  if not api or type(api.Get)~='function'then return false,'Cannot verify NPC input target'end
  for _,model in ipairs(models)do
    if model.Parent and model.PrimaryPart and model~=npc.model and (r.Position-model.PrimaryPart.Position).Magnitude<=distance+2 then
      local ok,other=pcall(api.Get,model:GetAttribute('objectId'))
      if ok and other and (other.prompt or other.interaction)then
        local competing=true;local owner=state.work.lease;local view=owner and owner.ghostCamera
        if view and view.point and view.point.name=='manor ghost'then
          -- The native selector considers visible, eligible prompts, not every nearby NPC.
          -- A direct prompt already identifies this exact NPC and cannot select its neighbor.
          if g.prompt and type(g.prompt.HoldBegan)=='function'and type(g.prompt.HoldEnd)=='function'then competing=false end
          if other.hasInteracted or other.isGhost and other.isHidden~=false and other.ghostVisible~=true then competing=false end
          local range=other.interaction and tonumber(other.interaction.promptDistance)
          if range and (r.Position-model.PrimaryPart.Position).Magnitude>range then competing=false end
          if competing and type(other._canSee)=='function'then local yes,visible=pcall(other._canSee,other);if yes and not visible then competing=false end end
          local can=other.interaction and other.interaction.canInteract
          if competing and type(can)=='function'then local yes,eligible=pcall(can,other);if yes and not eligible then competing=false end end
          if not competing then state.diagnostics.mark('manor_inactive_neighbor_ignored',tostring(other.name or model.Name))end
        end
        if competing then return false,'Another interaction is closer; move nearer to '..npc.name end
      end
    end
  end
  local interactions=liveModule('Interactions')
  local direct=g.prompt and type(g.prompt.HoldBegan)=='function'and type(g.prompt.HoldEnd)=='function'
  local native=interactions and type(interactions.QuickInteract)=='function'
  local desktop=not UserInputService.TouchEnabled and ((type(keypress)=='function'and type(keyrelease)=='function')or VirtualInputManager~=nil)
  local path=direct and 'NPC.prompt'or native and 'Interactions.QuickInteract'or desktop and 'desktop E'or 'unavailable'
  if path=='unavailable'then
    state.quest.terminalFailure='Unsupported interaction: native NPC prompt/QuickInteract unavailable; desktop input is not used on touch'
    state.diagnostics.mark('dialogue_unavailable',state.quest.terminalFailure,path)
    return false,state.quest.terminalFailure
  end
  -- Give the game's 0.1-second focus update one cycle after arrival; this is not success evidence.
  task.wait(.15)
  ready,why=state.npcReady(npc,token,r);if not ready then return false,why end
  local lease=state.work.lease
  state.quest.dialogue={npc=npc,root=r,lease=lease,path=path}
  state.diagnostics.mark('dialogue_request_before','begin',path)
  local ok,err
  if direct then ok,err=state.work.nativeCall(4,g,g.prompt.HoldBegan,g.prompt,true)
  elseif native then ok,err=state.work.nativeCall(4,g,interactions.QuickInteract,Enum.UserInputState.Begin)
  else ok=tap(Enum.KeyCode.E,token,.22)end
  state.diagnostics.mark('dialogue_request_after',ok and 'returned; awaiting intended NPC'or tostring(err),path)
  if direct or native then
    -- QuickInteract(true) is the game's quick action, not a sustained key. Release only
    -- while this same transaction still owns the character/focus; never a newer worker.
    if state.work.lease==lease and player.Character and player.Character:FindFirstChild('HumanoidRootPart')==r then
      state.diagnostics.mark('dialogue_release_before','end',path)
      local released,releaseWhy
      if direct then released,releaseWhy=pcall(g.prompt.HoldEnd,g.prompt)
      else released,releaseWhy=pcall(interactions.QuickInteract,Enum.UserInputState.End)end
      state.diagnostics.mark('dialogue_release_after',released and 'returned'or tostring(releaseWhy),path)
      if not released then ok=false;err=releaseWhy end
    end
  end
  if not ok then return false,tostring(err or 'NPC input failed')end
  local deadline=os.clock()+3
  repeat
    ready,why=state.npcReady(npc,token,r);if not ready then return false,why end
    if g.hasInteracted then state.diagnostics.mark('dialogue_observed',npc.name,path);return true,'Intended NPC dialogue observed'end
    task.wait(.15)
  until os.clock()>=deadline
  return false,'Native input returned but intended NPC dialogue was not observed'
end

function bank.stop()
  if state.recovery then state.recovery.cancel('bank')end
  if state.setup then state.setup.cancel('Bank tutorial stopped')end
  if state.work.cancelPending then state.work.cancelPending('Bank tutorial')end
  bank.running=false;bank.token=bank.token+1;stopMotion(false,'bank');state.collision.sync()
  bank.autoStatus='Stopped'
end
function bank.fly(point,token)
  if not point then return false,'Missing saved waypoint' end
  local dest=Vector3.new(point.x,point.y,point.z)
  local start=os.clock();local moved=os.clock();local closest=math.huge
  local startingRoot=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
  local maxTravel=math.max(25,startingRoot and (dest-startingRoot.Position).Magnitude/state.speed*4+17 or 90)
  while bank.active(token) do
    local r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
    if not characterAlive() or not r then stopMotion();return false,'Character not available' end
    local delta=dest-r.Position
    local allowed,why,corrected=motion.watchTravel(r,dest)
    if not allowed then stopMotion();return false,why end
    delta=dest-r.Position
    if corrected then start=os.clock();moved=os.clock();closest=delta.Magnitude;maxTravel=math.max(25,delta.Magnitude/state.speed*4+17)end
    if delta.Magnitude<3 then motion.arrived();stopMotion();return true end
    if delta.Magnitude<closest-2 then closest=delta.Magnitude;moved=os.clock() end
    if (not state.work.lease.travelPlan and os.clock()-moved>13) or os.clock()-start>maxTravel+state.navigationSettings.altitude*3/state.speed then
      stopMotion();return false,'Navigation stalled without a position correction'
    end
    startNoclip()
    motion.travel(r,dest,state.speed,'bank')
    RunService.Heartbeat:Wait()
  end
  stopMotion();return false,'Canceled'
end
-- Bank actions use the exported client APIs; success requires replicated evidence.
function bank.active(token)
  return bank.running and bank.token==token and state.work.owns('bank',token) and characterAlive()
end
function bank.waitFor(token,seconds,predicate)
  local deadline=os.clock()+seconds
  repeat
    if not bank.active(token) then return false,'Canceled or character unavailable' end
    local ok,value=pcall(predicate)
    if ok and value then return true,value end
    task.wait(.15)
  until os.clock()>=deadline
  return false,'Timed out waiting for game confirmation'
end
function bank.taskData()
  local api=liveModule('ClientTasks')
  if api and type(api.GetTaskData)=='function' then
    local ok,data=pcall(api.GetTaskData,'BankTutorial')
    if ok and type(data)=='table' then return data end
  end
  return nil
end
function bank.requirements()
  local tasks=liveModule('ClientTasks')
  if tasks and type(tasks.GetTask)=='function' then
    local ok,taskObject=pcall(tasks.GetTask,'BankTutorial')
    if ok and taskObject and type(taskObject.GetTaskProperties)=='function' then
      local read,properties=pcall(taskObject.GetTaskProperties,taskObject)
      if read and type(properties)=='table' then return properties end
    end
  end
  local list=liveModule('TaskList')
  return list and list.BankTutorial
end
-- Bank elevator: task evidence, geometry and native ride ownership are separate.
bank.elevator={maxHacks=2,maxCalls=2}
function bank.objective(kind,location)
 local data=bank.taskData();local properties=bank.requirements()
 if bank.completionRead()==true then return true,'ClientTasks.IsTaskComplete' end
 if not data or not properties or type(properties.steps)~='table'then return nil,'Bank task data/definition unavailable'end
 for index,step in ipairs(properties.steps)do
  for _,req in ipairs(step.requirements or {})do
   if req.requirementType==kind and (not location or req.locationName==location)then
    local current=tonumber(data.currentStep)
    if current and current>index then return true,'currentStep advanced past '..index,index,req,data end
    local util=liveModule('TaskUtil');local check=util and util.Requirements and util.Requirements[kind]
    if type(check)=='function'then
     local ok,value=pcall(check,data,req)
     if ok and type(value)=='boolean'then return value,'TaskUtil.Requirements.'..kind,index,req,data end
    end
    local tasks=liveModule('ClientTasks');local obj
    if tasks and type(tasks.GetTask)=='function'then local ok,v=pcall(tasks.GetTask,'BankTutorial');if ok then obj=v end end
    if obj and type(obj.IsRequirementComplete)=='function'then
     local ok,value=pcall(obj.IsRequirementComplete,obj,req)
     if ok and type(value)=='boolean'then return value,'ClientTask.IsRequirementComplete',index,req,data end
    end
    -- Confirmed by UPDATE(3) TaskUtil, not inferred from elevator attributes.
    if kind=='UseElevator'then return data.didUse==true,'taskData.didUse',index,req,data end
    if kind=='Locate'then
     local found=data.foundLocations and data.foundLocations[req.locationName]
     if type(req.locations)~='table'or #req.locations==0 then return nil,'Locate definition unavailable',index,req,data end
     return type(found)=='table'and #found>=#req.locations,'taskData.foundLocations',index,req,data
    end
    if kind=='FindBomb'then return data.didFindExplosive==true,'taskData.didFindExplosive',index,req,data end
    return nil,'Native requirement evaluator unavailable',index,req,data
   end
  end
 end
 return nil,'Requirement missing from live definition: '..kind
end
function bank.elevator.clear(lease)
 if not lease or not lease.elevatorRide then return end
 lease.elevatorRide=nil
 if state.work.lease==lease then state.collision.sync()end
end
function bank.elevator.insidePoint(base,point,margin)
 if not base or not base:IsA('BasePart')then return false end
 local p=base.CFrame:PointToObjectSpace(point);local h=base.Size*.5;local m=margin or 0
 return math.abs(p.X)<=h.X-m and math.abs(p.Y)<=h.Y and math.abs(p.Z)<=h.Z-m
end
function bank.elevator.queryParams(overlap)
 local p=overlap and OverlapParams.new()or RaycastParams.new()
 p.FilterType=Enum.RaycastFilterType.Exclude;p.FilterDescendantsInstances={player.Character};p.RespectCanCollide=true
 if overlap then p.MaxParts=64 end
 return p
end
function bank.elevator.bodyClear(position)
 local r=root();if not r or not OverlapParams or type(workspace.GetPartBoundsInBox)~='function'then return false end
 local params=bank.elevator.queryParams(true)
 for _,body in ipairs(player.Character:GetChildren())do
  if body:IsA('BasePart')and (body==r or body.CanCollide or state.collision.original[body]==true)then
   local cf=body.CFrame+(position-r.Position)
   local ok,parts=pcall(workspace.GetPartBoundsInBox,workspace,cf,body.Size*.95,params)
   if not ok then return false end
   for _,obstacle in ipairs(parts)do if obstacle.CanCollide then return false end end
  end
 end
 return true
end
function bank.elevator.pathClear(destination)
 local r=root();if not r or not RaycastParams or type(workspace.Blockcast)~='function'or not bank.elevator.bodyClear(r.Position)or not bank.elevator.bodyClear(destination)then return false end
 local delta=destination-r.Position;if delta.Magnitude<.05 then return true end
 local params=bank.elevator.queryParams(false)
 for _,body in ipairs(player.Character:GetChildren())do
  if body:IsA('BasePart')and (body==r or body.CanCollide or state.collision.original[body]==true)then
   local ok,hit=pcall(workspace.Blockcast,workspace,body.CFrame,body.Size*.95,delta,params)
   if not ok or hit then return false end
  end
 end
 return true
end
function bank.elevator.support(position)
 if not RaycastParams or type(workspace.Raycast)~='function'then return nil end
 local ok,hit=pcall(workspace.Raycast,workspace,position,Vector3.new(0,-8,0),bank.elevator.queryParams(false))
 if ok and hit and hit.Instance and hit.Instance.CanCollide and hit.Normal and hit.Normal.Y>.65
  and position.Y-hit.Position.Y>=.5 and position.Y-hit.Position.Y<=7 and hit.Material~=Enum.Material.Water then return hit end
end
function bank.elevator.boardPoint(floor,controls)
 local base=floor and floor:FindFirstChild('Base');local r=root();local hum=player.Character and player.Character:FindFirstChildOfClass('Humanoid')
 if not base or not base:IsA('BasePart')or not controls or not controls.PrimaryPart or not r or not hum then return nil,'Floor Base or controls unavailable'end
 if not RaycastParams or type(workspace.Raycast)~='function'then return nil,'Elevator floor query unavailable'end
 local hip=tonumber(hum.HipHeight)
 local height=hip and math.max(.5,hip+r.Size.Y*.5)or 2.5
 if hum.RigType==Enum.HumanoidRigType.R6 then local leg=player.Character:FindFirstChild('Left Leg');height=r.Size.Y*.5+(leg and leg.Size.Y or 2)+(hip or 0)end
 local offsets={Vector3.zero,Vector3.new(.24,0,0),Vector3.new(-.24,0,0),Vector3.new(0,0,.24),Vector3.new(0,0,-.24)}
 for _,offset in ipairs(offsets)do
  local origin=base.CFrame:PointToWorldSpace(Vector3.new(offset.X*base.Size.X,base.Size.Y*.5-.1,offset.Z*base.Size.Z))
  local ok,hit=pcall(workspace.Raycast,workspace,origin,Vector3.new(0,-base.Size.Y-8,0),bank.elevator.queryParams(false))
  if ok and hit and hit.Instance and hit.Instance.CanCollide and hit.Normal and hit.Normal.Y>.65 then
   local pos=hit.Position+Vector3.new(0,height+.05,0)
   if bank.elevator.insidePoint(base,pos,1.25)and (pos-controls.PrimaryPart.Position).Magnitude<=12
    and bank.elevator.bodyClear(pos)then return pos,nil,hit end
  end
 end
 return nil,'No clear, supported standing position inside elevator Base (possibly occupied or unstreamed)'
end
function bank.elevator.find()
 local api=liveModule('ClientProps');if not api or type(api.GetFromModel)~='function'then return nil end
 local candidates={};local seen={}
 for _,m in ipairs(game:GetService('CollectionService'):GetTagged('MainBankElevator'))do table.insert(candidates,m);seen[m]=true end
 local props=workspace:FindFirstChild('Props');local folder=props and props:FindFirstChild('Elevator')
 for _,m in ipairs(folder and folder:GetChildren()or {})do if not seen[m]then table.insert(candidates,m)end end
 local best,distance
 for _,m in ipairs(candidates)do
  if m:IsA('Model')and m:IsDescendantOf(workspace)and m:GetAttribute('elevatorType')=='Bank'then
   local floors=m:FindFirstChild('Floors');local ground=floors and floors:FindFirstChild('Ground');local vault=floors and floors:FindFirstChild('Vault')
   local base=ground and ground:FindFirstChild('Base');local ok,prop=pcall(api.GetFromModel,m)
   if base and base:IsA('BasePart')and vault and ok and prop and type(prop.IsInside)=='function'and type(prop.Hack)=='function'and type(prop.Call)=='function'then
    local d=root()and (root().Position-base.Position).Magnitude or math.huge
    if not best or d<distance then best={model=m,prop=prop,ground=ground,vault=vault};distance=d end
   end
  end
 end
 return best
end
function bank.elevator.prompt(control,text)
 if not control or not control.PrimaryPart or not root()or (root().Position-control.PrimaryPart.Position).Magnitude>14 then return false end
 -- Read the game's own prompt visibility/cooldown; never our UI or a synthetic timer alone.
 for _,billboard in ipairs(game:GetService('CollectionService'):GetTagged('PromptBillboard'))do
  if billboard:IsDescendantOf(player:FindFirstChild('PlayerGui'))and billboard.Adornee==control.PrimaryPart and billboard.Enabled==true then
   local frame=billboard:FindFirstChild('Frame')
   if frame and frame.Visible then
    for _,label in ipairs(frame:GetDescendants())do
     if label:IsA('TextLabel')and label.Visible and tostring(label.Text):gsub('<[^>]+>','')==text then return true end
    end
   end
  end
 end
 return false
end
function bank.elevator.releaseCamera(lease,saved)
 if saved and state.camera.current==saved and saved.lease==lease then state.camera.release(lease)end
 if lease and lease.elevatorCamera==saved then lease.elevatorCamera=nil end
end
function bank.elevator.aim(control,token)
 local lease=state.work.lease;local target=control and control.PrimaryPart;local r=root()
 if not lease or not r or not target or (r.Position-target.Position).Magnitude>14 then return false,'Keypad outside interaction range'end
 local saved=state.camera.capture(lease);if not saved then return false,'Keypad camera ownership unavailable'end
 lease.elevatorCamera=saved
 local function fail(why)bank.elevator.releaseCamera(lease,saved);return false,why end
 if not lease.elevatorRide then motion.hold(r)end
 local camera=workspace.CurrentCamera
 if not camera then return fail('Keypad camera unavailable')end
 local function geometry()
  local current=root();if current~=r or not target.Parent then return nil,'Keypad or character changed'end
  if (r.Position-target.Position).Magnitude>14 then return nil,'Keypad outside interaction range'end
  local origin=r.Position+Vector3.new(0,2,0);local direction=target.Position-origin
  if direction.Magnitude<.1 then return nil,'Keypad aiming position invalid'end
  local params=RaycastParams.new();params.FilterType=Enum.RaycastFilterType.Exclude;params.FilterDescendantsInstances={player.Character}
  local ok,hit=pcall(workspace.Raycast,workspace,origin,direction,params)
  if not ok or hit and hit.Instance~=target and not hit.Instance:IsDescendantOf(control)then return nil,'Keypad line of sight obstructed'end
  return origin,direction
 end
 local origin,direction=geometry();if not origin then return fail(direction)end
 if saved.binding then RunService:UnbindFromRenderStep(saved.binding);saved.binding=nil end
 local function align()
  if state.camera.current~=saved then return end
  if not bank.active(token)or workspace.CurrentCamera~=camera then bank.elevator.releaseCamera(lease,saved);return end
  local o,d=geometry();if not o then return end
  camera.CameraType=Enum.CameraType.Scriptable;camera.CFrame=CFrame.lookAt(o,o+d);camera.Focus=CFrame.new(target.Position)
 end
 local priorities=liveModule('Priorities');local priority=Enum.RenderPriority.Camera.Value
 for _,key in ipairs({'ClientCameraCFrame','FirstPersonCamera','VehicleCamera','AimAssist'})do priority=math.max(priority,tonumber(priorities and priorities.Render and priorities.Render[key])or 0)end
 saved.binding='REDLINE_ElevatorCamera_'..saved.id
 local bound=pcall(RunService.BindToRenderStep,RunService,saved.binding,priority+1,align)
 if not bound then return fail('Keypad camera binding unavailable')end
 align();task.wait(.15)
 if not bank.active(token)or workspace.CurrentCamera~=camera or state.camera.current~=saved then return fail('Keypad aiming canceled')end
 origin,direction=geometry();if not origin then return fail(direction)end
 if (camera.CFrame.LookVector-direction.Unit).Magnitude>.025 then return fail('Keypad camera alignment lost')end
 state.diagnostics.mark('keypad_target_verified','range, line of sight and camera direction')
 return true,nil,saved
end

function bank.elevator.request(ctx,control,kind,token)
 local lease=state.work.lease;local field=kind=='hack'and 'elevatorHacks'or 'elevatorCalls'
 local max=kind=='hack'and bank.elevator.maxHacks or bank.elevator.maxCalls
 if not lease or (lease[field]or 0)>=max then return false,'Elevator '..kind..' retry limit reached'end
 if not bank.active(token)or ctx.model:GetAttribute('inTransit')==true then return false,'Elevator state changed before '..kind end
 if kind=='hack'and (ctx.model:GetAttribute('currentFloor')=='Vault'or player:GetAttribute('currentTeam')=='police')then return false,'Hack Lift is unavailable for this floor/team'end
 local insideOK,inside=pcall(ctx.prop.IsInside,ctx.prop)
 if kind=='hack'and (not insideOK or not inside)then return false,'Not inside the elevator; Hack Lift withheld'end
 local standing,why=state.standingForInteraction();if not standing then return false,why end
 if os.clock()-(lease.elevatorLastAction or -math.huge)<1.1 or kind=='hack'and os.clock()-(lease.elevatorLastHack or -math.huge)<15.2 then return false,'Elevator interaction cooling down'end
 local aimed,aimWhy,aimSaved=bank.elevator.aim(control,token);if not aimed then return false,aimWhy end
 local expected=kind=='hack'and 'Hack Lift'or 'Call'
 if not bank.active(token)or ctx.model:GetAttribute('inTransit')==true then bank.elevator.releaseCamera(lease,aimSaved);return false,'Elevator state changed while aiming'end
 local stillInsideOK,stillInside=pcall(ctx.prop.IsInside,ctx.prop)
 if kind=='hack'and (ctx.model:GetAttribute('currentFloor')=='Vault'or player:GetAttribute('currentTeam')=='police'or not stillInsideOK or not stillInside)then bank.elevator.releaseCamera(lease,aimSaved);return false,'Hack Lift conditions changed while aiming'end
 if not bank.elevator.prompt(control,expected)then bank.elevator.releaseCamera(lease,aimSaved);return false,'Native '..expected..' prompt is unavailable or cooling down'end

 lease[field]=(lease[field]or 0)+1;lease.elevatorLastAction=os.clock()
 if kind=='hack'then lease.elevatorLastHack=os.clock()end
 state.diagnostics.mark('bank_elevator_request',kind..' #'..lease[field],'native Elevator.'..(kind=='hack'and 'Hack'or 'Call'))
 -- Hack includes cosmetic waits. Observe task credit concurrently, not after its toasts finish.
 local pending={};lease.elevatorRequest=pending
 pending.thread=task.spawn(function()
  motion.callers[coroutine.running()]=lease
  pending.ok,pending.reason=state.work.nativeCall(6,ctx.prop,kind=='hack'and ctx.prop.Hack or ctx.prop.Call,ctx.prop,kind=='hack'and 'Vault'or 'Ground',control)
  bank.elevator.releaseCamera(lease,aimSaved);pending.finished=true
 end)
 return true
end
function bank.elevator.move(position,token,localOnly,tolerance,swept)
 local lease=state.work.lease;if not lease then return false,'No movement owner'end
 local prior=lease.localRouteTravel;lease.localRouteTravel=localOnly==true;lease.navigation=nil;lease.travelPlan=nil
 local function allowance()
  local cost=state.recovery and state.recovery.cost and not localOnly and state.recovery.cost(root().Position,position)or (root().Position-position).Magnitude/state.speed
  return math.max(20,cost*4+20)
 end
 local deadline=motion.activeClock()+allowance();local corrections=lease.workflow.correctionSerial
 local ok,why=true,nil
 while bank.active(token)and motion.activeClock()<deadline do
  local r=root();if not r then ok=false;why='Character unavailable';break end
  if (r.Position-position).Magnitude<=(tolerance or .35)then motion.hold(r);motion.arrived();lease.localRouteTravel=prior;return true end
  if swept and not bank.elevator.pathClear(position)then ok=false;why='Elevator departure path became obstructed';break end
  ok,why=motion.travel(r,position,state.speed,'bank');if not ok then break end
  if lease.workflow.correctionSerial~=corrections then corrections=lease.workflow.correctionSerial;deadline=motion.activeClock()+allowance()end
  RunService.Heartbeat:Wait()
 end
 lease.localRouteTravel=prior;motion.cancelTween()
 return false,why or 'Elevator approach canceled or timed out'
end
function bank.elevator.locate(token)
 local done,why,_,req=bank.objective('Locate','Bank')
 if done==true then return true end
 if done==nil or not req then return false,why end
 for _,location in ipairs(req.locations or {})do
  local pos=location.position
  if typeof(pos)~='Vector3'then return false,'Bank Locate position unavailable'end
  bank.autoStatus='Approaching Bank; verifying Locate objective'
  local moved,err=bank.elevator.move(pos,token,false,3);if not moved then return false,err end
  local credited=bank.waitFor(token,8,function()return bank.objective('Locate','Bank')==true end)
  if credited then return true end
 end
 return false,'Locate the Bank was not credited by ClientTasks'
end
function bank.elevator.beginRide(ctx,token)
 local lease=state.work.lease;local r=root();local supported=r and bank.elevator.support(r.Position)
 if not bank.active(token)or not supported or not bank.elevator.bodyClear(r.Position)then return false,'Boarding has no clear supporting floor'end
 local ok,inside=pcall(ctx.prop.IsInside,ctx.prop);if not ok or not inside then return false,'Native IsInside did not confirm boarding'end
 -- Cancel world-space hold/velocity control BEFORE yielding to native lift motion.
 motion.release();lease.navigation=nil;lease.travelPlan=nil
 lease.elevatorRide={context=ctx,root=r,character=player.Character,started=os.clock(),lastSupport=os.clock(),lowestY=r.Position.Y}
 state.collision.sync()
 bank.autoStatus='Boarded; native elevator owns movement'
 return true
end
function bank.elevator.rideSafe(lease)
 local ride=lease and lease.elevatorRide;local r=root()
 if not ride or r~=ride.root or player.Character~=ride.character or not characterAlive()then return false,'Elevator ride lost its character'end
 if not ride.context.model:IsDescendantOf(workspace)then return false,'Elevator streamed out during ride'end
 local standing=motion.guard.standing();if standing==false then return false,'Character was knocked/ragdolled during elevator ride'end
 if r.Position.Y<ride.lowestY-8 then return false,'Character fell below the elevator floor'end
 local support=bank.elevator.support(r.Position)
 if support then ride.lastSupport=os.clock();ride.lowestY=support.Position.Y end
 if not support and os.clock()-ride.lastSupport>1 then return false,'Character slipped off elevator support; ride stopped'end
 return true
end
function bank.elevator.depart(ctx,token)
 local lease=state.work.lease
 if not lease or not bank.active(token) then return false,'Elevator handoff canceled or character unavailable' end
 local credited,source,_,_,taskData=bank.objective('UseElevator')
 if credited~=true then return false,'Elevator handoff requires confirmed Bank Tutorial objective credit' end
 local r=root()
 if not r then return false,'Character unavailable at elevator handoff' end
 -- Native lift movement must release ownership before REDLINE's own CFrame
 -- navigation may start. Clearing the ride also re-enables farm noclip.
 bank.elevator.releaseCamera(lease,lease.elevatorCamera)
 bank.elevator.clear(lease)
 lease.navigation=nil;lease.travelPlan=nil
 -- Hold current position only until the next (non-yielding) bank.fly call
 -- starts the existing direct-to-free_c4 tween. No door/shaft checks.
 motion.hold(r)
 if not bank.active(token) then return false,'Elevator handoff was canceled' end
 bank.elevatorStatus='Complete'
 bank.autoStatus='ROB VAULT active; flying to recorded free C4'
 local target=bank.points.free_c4
 state.diagnostics.snapshot('bank_elevator_handoff',{
  objective=source or 'UseElevator',currentStep=taskData and taskData.currentStep or 'Unknown',
  from=r.Position,destination=target and Vector3.new(target.x,target.y,target.z) or 'Missing free_c4'
 })
 return true
end
function bank.elevator.run(token)
 local lease=state.work.lease;bank.elevatorStatus='Checking objective'
 local ready=bank.waitFor(token,8,function()return bank.objective('UseElevator')~=nil end)
 if not ready then return false,'Bank UseElevator task data/definition unavailable'end
 local located,why=bank.elevator.locate(token);if not located then return false,why end
 local done,source=bank.objective('UseElevator')
 if done then bank.elevatorStatus='Already complete';return true end
 bank.autoStatus='Locating live Bank elevator'
 local ctx=bank.elevator.find()
 if not ctx then
  local _,_,_,loc=bank.objective('Locate','Bank');local point=loc and loc.locations and loc.locations[1]and loc.locations[1].position
  if typeof(point)=='Vector3'then
   local moved,err=bank.elevator.move(point,token,false,3);if not moved then return false,err end
   if type(player.RequestStreamAroundAsync)=='function'then state.work.nativeCall(6,bank.elevator,player.RequestStreamAroundAsync,player,point,4)end
  end
  bank.waitFor(token,12,function()ctx=bank.elevator.find();return ctx~=nil end)
 end
 if not ctx then return false,'Bank elevator or native client object is missing/not streamed'end
 local tools=itemClient()
 if tools and type(tools.GetLocalEquippedTool)=='function'and tools.GetLocalEquippedTool()then
  if type(tools.ToggleEquip)~='function'then return false,'Cannot free the native elevator interaction controls'end
  local unequipped,err=state.work.nativeCall(5,tools,tools.ToggleEquip,nil)
  if not unequipped then return false,err end
  if not bank.waitFor(token,3,function()return not tools.GetLocalEquippedTool()end)then return false,'Native item unequip was not confirmed'end
 end
 local deadline=os.clock()+100;local boarded=false;local lastHack;local observedTransit=false;local controls;local vaultWaitStarted
 while bank.active(token)and os.clock()<deadline do
  local pending=lease.elevatorRequest
  -- Quest credit can arrive mid-ascent. Never apply shaft/support tests after credit.
  done,source=bank.objective('UseElevator')
  if done then
   bank.elevatorStatus='Objective verified';bank.elevator.releaseCamera(lease,lease.elevatorCamera);state.diagnostics.mark('bank_elevator_credit',source)
   -- Hand off immediately to REDLINE CFrame flight / noclip; no door-search timeout.
   if lease.elevatorRide then return bank.elevator.depart(ctx,token)end
   return true
  end
  if lease.elevatorRide then
   local safe,err=bank.elevator.rideSafe(lease);if not safe then return false,err end
  end
  if pending and pending.finished and not pending.ok then return false,'Native elevator action failed: '..tostring(pending.reason)end
  local floor=ctx.model:GetAttribute('currentFloor');local transit=ctx.model:GetAttribute('inTransit')==true;local nextFloor=ctx.model:GetAttribute('nextFloor')
  if not ctx.model:IsDescendantOf(workspace)then return false,'Bank elevator no longer streamed'end
  local ok,inside=pcall(ctx.prop.IsInside,ctx.prop)
  if not boarded and ok and inside and transit and nextFloor=='Vault'then
   local yes,err=bank.elevator.beginRide(ctx,token);if not yes then return false,err end
   boarded=true;observedTransit=true
  elseif not boarded and not transit and floor=='Ground'then
   controls=ctx.ground:FindFirstChild('Buttons')
   local position,err=bank.elevator.boardPoint(ctx.ground,controls)
   if not position then bank.autoStatus=err;task.wait(.2)
   else
    bank.autoStatus='Boarding Bank elevator'
    local moved,moveWhy=bank.elevator.move(position,token,true,.35);if not moved then return false,moveWhy end
    if ctx.model:GetAttribute('inTransit')~=true and ctx.model:GetAttribute('currentFloor')=='Ground'then
     local yes,rideWhy=bank.elevator.beginRide(ctx,token);if not yes then return false,rideWhy end;boarded=true
    end
   end
  elseif not boarded then
   bank.autoStatus=transit and 'Waiting for occupied/moving elevator'or 'Calling elevator to Ground'
   if not transit and (not pending or pending.finished)and (lease.elevatorCalls or 0)<bank.elevator.maxCalls then
    local button=ctx.ground:FindFirstChild('Button');local part=button and button.PrimaryPart
    if not part then return false,'Ground elevator call control unavailable'end
    local base=ctx.ground:FindFirstChild('Base');local away=Vector3.new(part.Position.X-base.Position.X,0,part.Position.Z-base.Position.Z)
    if away.Magnitude<.1 then return false,'Cannot resolve a safe call-button approach'end
    local pos=part.Position+away.Unit*3
    local moved,err=bank.elevator.move(pos,token,true,1);if not moved then return false,err end
    if os.clock()-(lease.elevatorLastAction or -math.huge)>=8 then
     local yes,callWhy=bank.elevator.request(ctx,button,'call',token)
     if not yes and state.work.nativeUnknown[ctx.prop]then return false,callWhy end
    end
   end
  elseif transit then
   if nextFloor=='Vault'then observedTransit=true;bank.autoStatus='Riding elevator; waiting for Use the elevator credit'
   elseif nextFloor and nextFloor~='Vault'then return false,'Elevator changed destination during ride'end
  elseif floor=='Vault'then
   bank.autoStatus='Vault reached; waiting briefly for task replication'
   vaultWaitStarted=vaultWaitStarted or os.clock()
   if os.clock()-vaultWaitStarted>=5 then return false,'Elevator arrived but Use the elevator was not credited'end
  elseif floor=='Ground'then
   if observedTransit then return false,'Elevator returned to Ground without objective credit'end
   if pending and not pending.finished or lastHack and os.clock()-lastHack<15.2 then bank.autoStatus='Hack sent; awaiting transition/task credit'
   elseif (lease.elevatorHacks or 0)>=bank.elevator.maxHacks then return false,'Hack Lift did not start a verified transition after two attempts'
   else
    controls=controls or ctx.ground:FindFirstChild('Buttons')
    local count=lease.elevatorHacks or 0
    local yes,err=bank.elevator.request(ctx,controls,'hack',token)
    if (lease.elevatorHacks or 0)>count then lastHack=lease.elevatorLastAction end
    if not yes and state.work.nativeUnknown[ctx.prop]then return false,err end
    bank.autoStatus=yes and 'Hack Lift sent once; verifying transition'or tostring(err)
   end
  end
  task.wait(.1)
 end
 return false,bank.active(token)and 'Elevator stage timed out; '..tostring(bank.autoStatus)or 'Elevator stage canceled/dead'
end
function bank.useElevator(token)
 local lease=state.work.lease
 local ok,result,reason=pcall(bank.elevator.run,token)
 if lease then bank.elevator.releaseCamera(lease,lease.elevatorCamera);bank.elevator.clear(lease)end
 if not ok then result,reason=false,tostring(result)end
 if not result and lease then lease.elevatorFatal=true end
 return result==true,reason
end

function bank.cashRequirement()
  local properties=bank.requirements()
  for _,step in ipairs(properties and properties.steps or {}) do
    for _,req in ipairs(step.requirements or {}) do
      if req.requirementType=='StealBankCash' and tonumber(req.total) then return tonumber(req.total) end
    end
  end
  return 5000 -- Export fallback, never used as local progress evidence.
end

function bank.cashObjectiveMet()
  local data=bank.taskData();if not data then return false end
  bank.cashStolen=tonumber(data.bankCashStolen or data.cashStolen)or 0
  return bank.cashStolen>=bank.cashRequirement()
end

function bank.unconfirmedObjective()
  local data=bank.taskData();local properties=bank.requirements()
  local step=properties and properties.steps and data and properties.steps[tonumber(data.currentStep)or 1]
  local pending={}
  for _,req in ipairs(step and step.requirements or {})do
    if req.isOptional~=true then
      local done=bank.objective(req.requirementType,req.locationName)
      if done~=true then table.insert(pending,tostring(req.requirementType)..(req.locationName and ' ('..req.locationName..')'or ''))end
    end
  end
  return #pending>0 and ('Pending tutorial objective(s): '..table.concat(pending,', '))or 'Tutorial completion is not yet confirmed by ClientTasks'
end
function bank.stageReady()
  local data=bank.taskData();if not data then return false end
  bank.cashStolen=tonumber(data.bankCashStolen or data.cashStolen)or 0
  local properties=bank.requirements()
  for index,step in ipairs(properties and properties.steps or {})do
    for _,req in ipairs(step.requirements or {})do
      local kind=tostring(req.requirementType or ''):lower()
      if kind:find('escape',1,true)then return (tonumber(data.currentStep)or 0)>=index end
    end
  end
  return false -- Unknown task schema is not evidence that earlier objectives passed.
end

-- v30: ClientProps registers CollectionService "Prop" models by propName.
-- The export's vaultType="Badlands" is location metadata, NOT bank rarity.
-- Main-bank identity additionally requires proximity to the unchanged recorded vault route.
function bank.findDoor()
  local point=bank.points.vault_throw
  if not point then return nil,'Recorded main-bank vault position unavailable' end
  local target=Vector3.new(point.x,point.y,point.z)
  local candidates,seen={},{}
  local function add(model,prop,source,legacy)
    if typeof(model)~='Instance' or not model:IsA('Model') or not model:IsDescendantOf(workspace) then return end
    local kind=model:GetAttribute('propName')
    if kind and kind~='VaultDoor' then return end
    if kind~='VaultDoor' and not (type(prop)=='table' and prop.ClassName=='VaultDoor') and not legacy then return end
    if model:GetAttribute('vaultType')=='Badlands' then return end
    local position=model.PrimaryPart and model.PrimaryPart.Position or objectWorldPosition(model)
    if not position or (position-target).Magnitude>=180 then return end
    if seen[model] then return end
    seen[model]=true;table.insert(candidates,{model=model,prop=prop,position=position,source=source})
  end
  local api=liveModule('ClientProps')
  if api and type(api.worldProps)=='table' then
    for model,prop in pairs(api.worldProps) do add(model,prop,'ClientProps.worldProps') end
  end
  if api and type(api.worldPropsById)=='table' then
    for _,prop in pairs(api.worldPropsById) do if type(prop)=='table' then add(prop.model,prop,'ClientProps.worldPropsById') end end
  end
  local ok,tagged=pcall(function()return game:GetService('CollectionService'):GetTagged('Prop')end)
  if ok then for _,model in ipairs(tagged) do add(model,nil,'Prop tag / propName') end end
  -- Source-backed legacy container fallback, not the only discovery path.
  local props=workspace:FindFirstChild('Props');local folder=props and props:FindFirstChild('VaultDoor')
  if folder then
    add(folder,nil,'Props.VaultDoor',true)
    for _,model in ipairs(folder:GetDescendants()) do
      if model:GetAttribute('objectId')~=nil then add(model,nil,'Props.VaultDoor',true) end
    end
  end
  table.sort(candidates,function(a,b)return (a.position-target).Magnitude<(b.position-target).Magnitude end)
  local chosen=candidates[1]
  if not chosen then return nil,'No registered/tagged main-bank VaultDoor near the recorded route (may be unstreamed)' end
  return chosen.model,nil,chosen
end
bank.opening=setmetatable({},{__mode="k"})

function bank.ownedStickies()
  local models={}
  local props=workspace:FindFirstChild('Props')
  local folder=props and props:FindFirstChild('StickyBomb')
  if folder then
    for _,m in ipairs(folder:GetDescendants()) do
      if m:IsA('Model') and m.PrimaryPart and m:GetAttribute('ownerId')==player.UserId then models[m]=true end
    end
  end
  return models
end
function bank.vaultState(model)
  if not model or not model:IsDescendantOf(workspace) then return 'UNKNOWN','Vault not replicated' end
  local attribute=model:GetAttribute('isBroken')
  local props=liveModule('ClientProps');local prop
  if props and type(props.GetFromModel)=='function'then local ok,value=pcall(props.GetFromModel,model);if ok then prop=value end end
  if attribute==true or prop and prop.broken==true then
    bank.opening[model]=nil;return 'OPEN','Replicated breach'
  end
  if bank.opening[model] and os.clock()-bank.opening[model]<18 then return 'OPENING','Awaiting breach replication' end
  if attribute==false or prop and prop.broken==false then return 'CLOSED','Replicated closed door' end
  return 'UNKNOWN','No reliable door state'
end
function bank.isOpen(model)return bank.vaultState(model)=='OPEN'end
function bank.requireKnownDoor(token,door)
  local ok,value=bank.waitFor(token,6,function()
    local status=bank.vaultState(door)
    if status=='OPEN'or status=='CLOSED'then return status end
  end)
  return ok,value
end
function bank.hasPlanted(door)
  local planted=bank.planted
  if not planted or planted.door~=door or not planted.model.Parent or not planted.model.PrimaryPart then return false end
  local point=objectWorldPosition(door)
  return point~=nil and (planted.model.PrimaryPart.Position-point).Magnitude<=25 and bank.ownedStickies()[planted.model]==true
end
function bank.throwC4(token,door)
  if not bank.active(token)then return false,'Canceled'end
  local known,status=bank.requireKnownDoor(token,door)
  if not known then return false,'Vault state unknown; C4 not spent'end
  if status=='OPEN'then return true,'already_open'end
  if bank.hasPlanted(door)then bank.planted.token=token;return true,'planted'end
  local lease=state.work.lease;local cameraState=state.camera.capture(lease)
  if not cameraState then return false,'Camera is owned by another task or unavailable'end
  state.work.critical=true
  local outcome='planted'
  local tools=itemClient();local previousId
  pcall(function()local tool=tools.GetLocalEquippedTool();previousId=tool and (tool.toolId or tool.id) end)
  local ok,why=xpcall(function()
    if bank.isOpen(door)then outcome='already_open';return end
    if not state.tryEquipTool('C4',function()return bank.active(token)end)then error('C4 equip not confirmed')end
    local ready,tool=bank.waitFor(token,7,function()
      if bank.isOpen(door)then return 'already_open'end
      local equipped=tools and tools.GetLocalEquippedTool()
      if equipped and equipped.name=='C4'and equipped.loaded and equipped.synced
        and type(equipped.GetComponent)=='function'and equipped:GetComponent('Thrower')then return equipped end
    end)
    if not ready then error('C4 did not load and synchronize within seven seconds')end
    if tool=='already_open'then outcome='already_open';return end
    cameraState.tool=tool
    local thrower=tool:GetComponent('Thrower')
    local ammo=tonumber(thrower.ammo or tool.toolState and tool.toolState.ammo)
    if not ammo or ammo<1 then error('C4 ammunition unconfirmed or empty')end
    local point=objectWorldPosition(door:FindFirstChild('BigDoor')or door)
    local r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
    local range=tonumber(tool.maxThrowDist)or 50
    if not r or not point or (r.Position-point).Magnitude>range then error('Saved throw position is outside native C4 range')end
    local readyAt=(tonumber(thrower.lastThrow)or 0)+(tonumber(tool.throwDebounce)or 3)
    local deadline=os.clock()+5
    while bank.active(token)and os.clock()<readyAt and os.clock()<deadline do
      if bank.isOpen(door)then outcome='already_open';return end
      task.wait(.1)
    end
    if not bank.active(token)or os.clock()<readyAt then error('C4 input not ready')end
    local camera=workspace.CurrentCamera
    if camera~=cameraState.camera then error('Camera changed before throw')end
    local existing=bank.ownedStickies()
    local planted=bank.planted
    if planted and planted.door==door and planted.model.Parent and existing[planted.model]then planted.token=token;return end
    local function aim()
      if state.camera.current~=cameraState or not state.work.owns('bank',token)or not characterAlive()then return end
      if workspace.CurrentCamera~=camera then return end
      if (point-camera.CFrame.Position).Magnitude>.1 then camera.CFrame=CFrame.lookAt(camera.CFrame.Position,point)end
    end
    -- Run immediately before the game's tool-input priority, not at arbitrary callback order.
    local priorities=liveModule('Priorities')
    local toolPriority=priorities and priorities.Render and tonumber(priorities.Render.ClientToolInput)
    cameraState.binding='REDLINE_C4_'..tostring(cameraState.id)
    RunService:BindToRenderStep(cameraState.binding,toolPriority and toolPriority-1 or Enum.RenderPriority.Camera.Value+1,aim)
    bank.autoStatus='Aiming C4 · waiting for native trajectory'
    aim();task.wait(.3)
    if not bank.active(token)then error('Canceled before throw')end
    if bank.isOpen(door)then outcome='already_open';return end
    if bank.vaultState(door)~='CLOSED'then error('Vault no longer confirmed closed')end
    if thrower.withinRange==false then error('Native Thrower rejects the target range')end
    if typeof(thrower.aimPoint)=='Vector3'and (thrower.aimPoint-point).Magnitude>25 then error('Native C4 aim is blocked; no throw issued')end
    if type(tool._inputPrimary)~='function'then error('Native C4 primary-input method unavailable')end
    tool:_inputPrimary(Enum.UserInputState.Begin)
    bank.autoStatus='Throwing C4 · verifying owned planted bomb'
    local planted,model=bank.waitFor(token,9,function()
      if bank.isOpen(door)then return 'already_open'end
      for candidate in pairs(bank.ownedStickies())do
        if not existing[candidate]and candidate.PrimaryPart and (candidate.PrimaryPart.Position-point).Magnitude<=25 then return candidate end
      end
    end)
    if not planted then error('No newly owned C4 near vault; detonation withheld')end
    if model=='already_open'then outcome='already_open';return end
    local prior=model.PrimaryPart.Position;task.wait(.25)
    if not bank.active(token)then error('Canceled before planted confirmation')end
    if bank.isOpen(door)then outcome='already_open';return end
    if not model.Parent or not model.PrimaryPart or (model.PrimaryPart.Position-prior).Magnitude>2 then error('C4 did not settle near vault')end
    bank.planted={model=model,door=door,token=token}
  end,function(err)return tostring(err)end)
  -- Stop native input and disengage C4 before restoring the player's previous camera.
  local ownsCamera=state.camera.current==cameraState
  if ownsCamera and cameraState.tool then pcall(function()cameraState.tool:_inputPrimary(Enum.UserInputState.End);cameraState.tool.throwing=false end)end
  if ownsCamera and tools and type(tools.ToggleEquip)=='function'then
    pcall(function()
      local current=tools.GetLocalEquippedTool()
      if current and current.name=='C4'then tools.ToggleEquip(previousId)end
    end)
  end
  state.camera.release(lease);state.work.critical=false
  if not ok then return false,why end
  return true,outcome
end
function bank.breachInner(token,door)
  local known,status=bank.requireKnownDoor(token,door)
  if not known then return false,'Vault state unknown'end
  if status=='OPEN'then return true,'already_open'end
  local thrown,why
  for attempt=1,2 do
    if not bank.active(token)then return false,'Canceled'end
    if bank.isOpen(door)then return true,'already_open'end
    bank.autoStatus='C4 attempt '..attempt..'/2'
    thrown,why=bank.throwC4(token,door)
    if thrown then break end
    if not bank.active(token)or not localNamedItem('C4')then break end
    task.wait(.5)
  end
  if not thrown then return false,why end
  if why=='already_open'or bank.isOpen(door)then return true,'already_open'end
  -- Yield is permitted after a planted bomb; a resumed run revalidates the vault first.
  local reached,reason=bank.fly(bank.points.retreat_detonate,token)
  if not reached then return false,reason end
  if not bank.active(token)then return false,'Canceled'end
  if bank.isOpen(door)then return true,'already_open'end
  local planted=bank.planted
  if not planted or planted.token~=token or not planted.model.Parent then return false,'Owned planted bomb no longer confirmed'end
  bank.autoStatus='Detonating confirmed C4';bank.opening[door]=os.clock()
  local players=liveModule('ClientPlayers');local native
  if players and type(players.Get)=='function'then local ok,value=pcall(players.Get);if ok then native=value end end
  if not native or type(native.Detonate)~='function'then return false,'Native Character.Detonate unavailable'end
  local sent,why=state.work.nativeCall(6,planted.model,native.Detonate,native)
  if not sent then return false,'Native detonation: '..tostring(why)end
  local opened=bank.waitFor(token,12,function()return bank.isOpen(door)end)
  if not opened then return false,'Breach not confirmed after detonation'end
  bank.breaching=false
  -- No fixed gas delay: a duration constant is not evidence of an active hazard.
  return bank.active(token),'Canceled'
end

function bank.breach(token,door)
  bank.breaching=true
  local ok,result,reason=pcall(bank.breachInner,token,door)
  bank.breaching=false
  if not ok then return false,tostring(result)end
  return result,reason
end
function bank.cashAmount(gizmo)
  local data=type(gizmo.gizmoState)=='table' and gizmo.gizmoState or {}
  local amount=tonumber(data.amount)
  if amount==nil then amount=tonumber(gizmo.cashLeft) end
  if amount==nil and type(gizmo.state)=='table' then amount=tonumber(gizmo.state.amount) end
  return amount
end
function bank.cashKind(g)
  if not g then return nil end
  if g.ClassName=='MainCashPile' or g.name=='MainCashPile' then return 'main' end
  if g.ClassName=='CashPallet' or g.name=='CashPallet' then return 'small' end
end
function bank.cashList(center,radius,mainOnly)
  local folder=workspace:FindFirstChild('Local');folder=folder and folder:FindFirstChild('Gizmos')
  local api=liveModule('ClientGizmos');local entries={};local seen={}
  if not folder or not api or type(api.Get)~='function' then return entries,false end
  for _,model in ipairs(folder:GetDescendants()) do
    if model:IsA('Model') and model.PrimaryPart and (model.PrimaryPart.Position-center).Magnitude<radius then
      local id=model:GetAttribute('objectId')
      if id~=nil and not seen[id] then
        seen[id]=true
        local ok,g=pcall(api.Get,id)
        local kind=ok and type(g)=='table' and bank.cashKind(g)
        if kind and (not mainOnly or kind=='main') and type(g.AttemptCollect)=='function' then
          local location=g.properties and g.properties.locationName
          if not location or location=='Bank' then
            table.insert(entries,{id=tostring(id),objectId=id,model=model,gizmo=g,kind=kind,cash=true,
              name=kind=='main' and 'MainCashPile' or 'CashPallet',amount=bank.cashAmount(g)})
          end
        end
      end
    end
  end
  table.sort(entries,function(a,b)
    if a.kind~=b.kind then return a.kind=='main' end
    local da=(a.model.PrimaryPart.Position-center).Magnitude;local db=(b.model.PrimaryPart.Position-center).Magnitude
    if math.abs(da-db)>.01 then return da<db end
    return a.id<b.id
  end)
  return entries,true
end
function bank.drainCash(candidate,token,tutorial,beforeCollect)
  local kind=bank.cashKind(candidate.gizmo)
  if not kind or tutorial and kind~='main' then return false,'Wrong cash object for this objective' end
  local start,lastProgress=os.clock(),os.clock()
  local lastAmount=bank.cashAmount(candidate.gizmo)
  local observed=lastAmount~=nil
  local unknownSince=nil
  bank.cashTarget=candidate.id
  while bank.active(token) and os.clock()-start<240 do
    if tutorial and bank.stageReady() then bank.cashTarget=nil;return true,'objective' end
    local g=candidate.gizmo
    local amount=bank.cashAmount(g)
    bank.cashRemaining=amount
    if amount~=nil and amount<=0 then
      bank.cashTarget=nil
      if tutorial then
        bank.autoStatus='Main pile empty - checking tutorial credit before exit'
        if bank.waitFor(token,8,function()return bank.stageReady()or bank.cashObjectiveMet()end)then return true,'cash_verified'end
        return false,'Main pile depleted; server cash credit '..tostring(bank.cashStolen)..'/'..tostring(bank.cashRequirement()),'depleted'
      end
      return true,'empty'
    end
    if amount~=nil then
      if lastAmount~=nil and amount>lastAmount then bank.cashTarget=nil;return false,'Cash target reset; rescan the vault cycle' end
      if lastAmount~=nil and amount<lastAmount then lastProgress=os.clock() end
      observed=true;lastAmount=amount;unknownSince=nil
    else unknownSince=unknownSince or os.clock() end
    local model=g.model or candidate.model
    if not model or not model.Parent or not model.PrimaryPart then
      -- Streaming is not depletion. Reacquire this exact ID, never a different pile.
      local api=liveModule('ClientGizmos')
      local ok,current=pcall(function()return api and api.Get(candidate.objectId)end)
      if ok and current and bank.cashKind(current)==kind then candidate.gizmo=current end
      if (not state.work.lease.travelPlan and os.clock()-lastProgress>12) then bank.cashTarget=nil;return false,'Cash target unstreamed; zero balance not confirmed' end
      task.wait(.25)
    elseif amount==nil then
      if os.clock()-(unknownSince or start)>10 then bank.cashTarget=nil;return false,'Cash balance unavailable; zero not assumed' end
      task.wait(.25)
    else
      if tutorial and bank.cashStolen>=bank.cashRequirement() then
        bank.cashTarget=nil;return true,'cash_verified'
      end
      if beforeCollect then
        local suspended=os.clock()
        local yes,reason=beforeCollect(candidate)
        if yes==false then bank.cashTarget=nil;return false,reason end
        local elapsed=os.clock()-suspended;lastProgress=lastProgress+elapsed;start=start+elapsed
      end
      if not bank.active(token) then break end
      local r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
      local position=bank.interactionPosition(g,model)
      local distance=kind=='main' and 14 or 10
      if not r or not position then bank.cashTarget=nil;return false,'Cash interaction position unavailable' end
      if (r.Position-position).Magnitude>distance-2 then
        if tutorial then bank.cashTarget=nil;return false,'Recorded cash_pickup is outside MainCashPile interaction range; update that waypoint' end
        local p=position+Vector3.new(0,2,0)
        local reached,why=bank.fly({x=p.X,y=p.Y,z=p.Z},token)
        if not reached then bank.cashTarget=nil;return false,why end
      end
      local standing,reason=state.standingForInteraction()
      if not standing then bank.cashTarget=nil;return false,reason end
      bank.autoStatus='Collecting '..(kind=='main' and 'main pile' or 'small pile')..' · $'..math.floor(amount)..' left'
      local callStart=os.clock()
      if not g.collecting then
        local ok,why=state.work.nativeCall(10,g,g.AttemptCollect,g,player)
        if not ok then note('WARN','Cash interaction: '..tostring(why)) end
      end
      -- Calls are sequential. Respect native delays even if an implementation returns early.
      local delay=kind=='main' and 1.1 or .5
      while bank.active(token) and os.clock()-callStart<delay do task.wait(.1) end
      if os.clock()-lastProgress>14 then bank.cashTarget=nil;return false,'Cash balance stalled at $'..tostring(amount)..'; target not marked complete' end
    end
  end
  bank.cashTarget=nil
  return false,bank.active(token) and (observed and 'Cash collection time limit reached' or 'Cash state unavailable') or 'Canceled or character unavailable'
end
function bank.collectCash(token,center,tutorial)
  local started=os.clock()
  while bank.active(token) and os.clock()-started<18 do
    if tutorial and bank.stageReady() then return true,'objective' end
    local entries=bank.cashList(center,90,tutorial)
    if #entries>0 then
      if tutorial then return bank.drainCash(entries[1],token,true) end
      for _,entry in ipairs(entries) do
        local yes,why=bank.drainCash(entry,token,false)
        if not yes then return false,why end
      end
      return true,'empty'
    end
    bank.autoStatus=tutorial and 'Waiting for main cash pile' or 'Waiting for cash objects'
    task.wait(.3)
  end
  return false,bank.active(token) and 'MainCashPile not loaded near recorded cash_pickup; small piles are not a tutorial substitute' or 'Canceled'
end

function bank.escape(token)
  for _,id in ipairs({'escape_exit','escape'}) do
    bank.autoStatus=id=='escape_exit' and 'Following recorded exit' or 'Following recorded escape'
    local ok,err=bank.fly(bank.points[id],token)
    if not ok then return false,err end
  end
  local complete=bank.waitFor(token,15,function()bank.check();return bank.done end)
  if complete then return true end
  local data=bank.taskData()or {}
  return false,'Saved exit reached; tutorial incomplete (step '..tostring(data.currentStep)..', cash '..tostring(data.bankCashStolen or data.cashStolen or 0)..'/'..tostring(bank.cashRequirement())..', elevator '..tostring(data.didUse)..'). Empty main pile needs replenishment if cash credit is insufficient'
end

function bank.start()
  if state.work.lease or bank.running or state.running or af.running or bag.selling or (state.combat and state.combat.buying) or (state.shop and state.shop.running) then
    warning('Stop the active navigation task before starting the tutorial');return
  end
  local routeOK,routeWhy=bank.validateRoute()
  if not routeOK then warning(routeWhy);bank.autoStatus=routeWhy;return end
  bank.check()
  if bank.done then log('Bank tutorial already complete');return end
  if state.work.dispatching and state.work.dispatching.canceled then return end
  bank.running=true;bank.isTutorial=true;bank.token=bank.token+1
  local token=bank.token
  state.work.launch('bank',token,function()
    if bank.completionRead()==true and bank.verifyTwice(token)then return end
    local ok,err
    for rerun=0,2 do
      if not bank.active(token)then break end
      bank.reruns=rerun
      ok,err=pcall(function()
      local function move(id,message)
        bank.autoStatus=message
        local reached,why=bank.fly(bank.points[id],token)
        if not reached then error(why) end
      end
      if bank.stageReady() then
        local escaped,why=bank.escape(token)
        if not escaped then error(why) end
        return
      end
      local rode,rideWhy=bank.useElevator(token)
      if not rode then error(rideWhy)end
      move('free_c4','Collecting free C4')
      local found,door=bank.waitFor(token,15,bank.findDoor)
      if not found then error('Main bank vault door not replicated near the saved route') end
      local required,credited=bank.c4Objective()
      state.diagnostics.snapshot('bank_c4',{objective=bank.status,vault=bank.vaultState(door),required=required,credited=credited,owned=bank.c4Ready(),equipped=toolEquipped('C4'),rerun=bank.reruns})
      if required or (not credited and not bank.c4Ready()) then
        local acquired,why=bank.acquireC4(token,door,'tutorial_pickup')
        state.diagnostics.snapshot('bank_c4_pickup',{success=acquired,reason=why or '',owned=bank.c4Ready(),required=required});if not acquired then error(why)end
      end
      -- Even when the door is already OPEN, tutorial must VISIT the vault door first.
      move('vault_throw','Visiting vault door · verifying tutorial progression')
      local vaultLocate=bank.objective('Locate','Vault')
      state.diagnostics.snapshot('bank_tutorial_vault_visit',{door=bank.vaultState(door),locate=tostring(vaultLocate),c4=bank.c4Ready()})
      if vaultLocate==false then
        local visited=bank.waitFor(token,6,function()return bank.objective('Locate','Vault')==true end)
        if not visited then error('Visited recorded vault door, but Locate Vault objective still uncredited; inspect vault waypoint/trigger')end
      end
      if not bank.isOpen(door) then
        local acquired,why=bank.hasPlanted(door),nil
        if not acquired then acquired,why=bank.acquireC4(token,door)end
        if not acquired then error(why) end
        local breached,why=bank.breach(token,door)
        if not breached then error(why) end
      end
      move('vault_enter','Entering breached vault')
      move('cash_pickup','Reading vault cash')
      local point=bank.points.cash_pickup
      local cleared,why,cashState=bank.collectCash(token,Vector3.new(point.x,point.y,point.z),true)
      if not cleared then
        if not bank.active(token) then error('Canceled') end
        if cashState~='depleted'and not bank.stageReady()and not bank.cashObjectiveMet()then error(why)end
        note('WARN',tostring(why)..'; following saved exit and checking actual completion')
      end
      local ready=bank.stageReady()or bank.cashObjectiveMet()
      if not ready and cashState~='depleted'then error(bank.unconfirmedObjective())end
      bank.lastTutorialCashState=cashState or why
      local escaped,escapeWhy=bank.escape(token)
      if not escaped then error(escapeWhy) end
      end)
      if not bank.active(token)then break end
      if state.work.lease.elevatorFatal then ok=false;err=tostring(err)..' | '..bank.unconfirmedObjective();break end
      local verified=bank.verifyTwice(token)
      if verified then ok=true;break end
      ok=false;err=tostring(err or 'Tutorial completion not confirmed')..' | '..bank.unconfirmedObjective()
      if bank.completionRead()~=false or rerun>=2 or state.work.lease.navigationFailed or state.work.lease.elevatorFatal then break end
      bank.autoStatus='Tutorial incomplete; rerun '..(rerun+1)..'/2'
      local deadline=os.clock()+2
      while bank.active(token)and os.clock()<deadline do task.wait(.1)end
    end
    if bank.token==token then
      bank.running=false;stopMotion()
      if ok then bank.autoStatus='Completed · game confirmed';log('Bank tutorial completed')
      else bank.autoStatus='Stopped · '..tostring(err);warning(bank.autoStatus) end
    end
  end)
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
-- BEGIN_TESTABLE questFoundSet
-- The game counts the task's `found` table with TableUtil.Count, which counts every entry
-- whatever its shape. Accept both map form (found[Name]=truthy) and list form ({Name,...}).
local function questFoundSet(found,ids)
  local set,count={},0
  if type(found)~='table' then return set,0 end
  for key,value in pairs(found) do
    local name=nil
    if type(key)=='string' and ids[key] and value then name=key
    elseif type(value)=='string' and ids[value] then name=value end
    if name and not set[name] then set[name]=true;count=count+1 end
  end
  return set,count
end
-- END_TESTABLE
local function readQuestEvidence()
  local result={mission=false,progress=nil,source='unavailable',found=nil,completed=false,known=false,handInReady=false,ghostsComplete=false}
  local tasks=liveModule('ClientTasks');if not tasks then return result end
  if type(tasks.HasCompletedTutorial)=='function'then local ok,yes=pcall(tasks.HasCompletedTutorial);if ok then result.tutorialComplete=yes==true end end
  if type(tasks.IsTaskComplete)=='function'then
    local ok,yes=pcall(tasks.IsTaskComplete,'SpeakerForTheDead')
    if ok and type(yes)=='boolean'then result.completionKnown=true;result.completed=yes==true end
  end
  local data
  if type(tasks.GetTaskStatus)=='function'then
    local ok,obj,value=pcall(tasks.GetTaskStatus,'SpeakerForTheDead')
    if ok then data=value;result.known=true;result.mission=obj~=nil end
  end
  if type(data)~='table'and type(tasks.GetTaskData)=='function'then
    local ok,value=pcall(tasks.GetTaskData,'SpeakerForTheDead')
    if ok and type(value)=='table'then data=value;result.known=true end
  end
  state.quest.keyRequirement()
  if type(data)=='table'then
    result.mission=true;result.currentStep=tonumber(data.currentStep)
    if type(data.found)=='table'then
      result.found,result.progress=questFoundSet(data.found,state.quest.identities and next(state.quest.identities)and state.quest.identities or ghostIds)
      result.source='ClientTasks.found'
    end
    local properties=state.quest.properties()
    local meetIndex,returnIndex
    for index,step in ipairs(properties and properties.steps or {})do
      for _,req in ipairs(step.requirements or {})do
        if req.requirementType=='MeetGhosts'then meetIndex=index end
        if req.requirementType=='ReturnToNPC'then
          for _,name in ipairs(req.validNPCs or {})do if name=='Ghost'then returnIndex=index end end
        end
      end
    end
    -- ClientTask replaces taskData on each step. The found table can disappear at Turn In.
    -- Advancing past MeetGhosts is server evidence that that objective finished.
    if result.currentStep and meetIndex and returnIndex and returnIndex>meetIndex
      and result.currentStep>=returnIndex then
      result.handInReady=true;result.ghostsComplete=true
      result.source='ClientTasks.currentStep: ReturnToNPC';result.returned=data.hasReturned==true
    end
    result.ghostsComplete=result.ghostsComplete or result.progress~=nil and result.progress>=state.quest.required
  end
  -- Exported MissionsPage owns MissionFrame/HeaderFrame/MissionLabel. Restrict
  -- fallback to that selected native mission, never REDLINE's own status labels.
  if not result.handInReady and not result.completed then
    local gui=player:FindFirstChildOfClass('PlayerGui')
    for _,frame in ipairs(gui and gui:GetDescendants()or {})do
      if frame.Name=='MissionFrame'and frame:IsA('GuiObject')and labelVisible(frame)then
        local header=frame:FindFirstChild('HeaderFrame');local title=header and header:FindFirstChild('MissionLabel')
        local titleText=title and (title:IsA('TextLabel')or title:IsA('TextButton'))and title.Text:lower():gsub('[%s%p]','')or ''
        if titleText=='speakerforthedead'then
          local text={}
          for _,label in ipairs(frame:GetDescendants())do
            if (label:IsA('TextLabel')or label:IsA('TextButton'))and labelVisible(label)then table.insert(text,label.Text:lower())end
          end
          local content=table.concat(text,' ')
          if content:find('return to ghost',1,true)and (content:match('0%s*/%s*1')or content:find('turn in',1,true))then
            result.handInReady=true;result.ghostsComplete=true;result.mission=true;result.known=true;result.source='Native MissionsPage Return to Ghost'
          end
        end
      end
    end
  end

  if result.completed then
    result.known=true;result.ghostsComplete=true;result.source='ClientTasks.IsTaskComplete'
  end
  return result
end
local function refreshQuestEvidence()
  local q=state.quest;q.evidenceSerial=q.evidenceSerial+1;local serial=q.evidenceSerial
  local evidence=readQuestEvidence()
  if serial~=q.evidenceSerial or state.closed then
    return {known=true,mission=state.missionVerified,completed=q.handedInObserved==true,handInReady=q.turnInObserved==true,ghostsComplete=q.turnInObserved==true or q.handedInObserved==true,found=state.foundGhosts,progress=state.confirmedGhost,source='Newer evidence retained'}
  end
  if evidence.tutorialComplete~=nil then state.tutorialReady=evidence.tutorialComplete end
  if evidence.completed then q.handedInObserved=true end
  if evidence.handInReady then q.turnInObserved=true end
  -- A verified one-time completion/turn-in cannot be undone by obsolete collection data.
  if q.handedInObserved then evidence.completed=true;evidence.known=true;evidence.ghostsComplete=true end
  if q.turnInObserved and not evidence.completed then evidence.handInReady=true;evidence.ghostsComplete=true end
  if evidence.known then
    state.missionVerified=evidence.mission;state.missionStarted=evidence.mission
    state.foundGhosts=evidence.found or state.foundGhosts or {}
    q.handInReady=evidence.handInReady;q.ghostsComplete=evidence.ghostsComplete;q.currentStep=evidence.currentStep
  end
  if evidence.completionKnown or q.handedInObserved then state.serverQuestComplete=evidence.completed;state.questCompleted=evidence.completed end
  state.verificationSource=evidence.source
  if evidence.progress~=nil and not q.turnInObserved and not q.handedInObserved and evidence.progress~=state.confirmedGhost then
    state.confirmedGhost=evidence.progress;checkpoint()
    note('INFO','Quest progress '..evidence.progress..'/'..q.required..' from '..evidence.source)
  elseif evidence.known and not evidence.mission and not evidence.completed and not q.turnInObserved then state.confirmedGhost=0 end
  local owned=localNamedItem('Skeleton Key');state.keyInInventory=owned==true
  if evidence.completed and (owned or q.keyCollectedPreviously)then
    q.keyCollectedPreviously=true;q.complete()
  elseif not q.workflowComplete and evidence.known and not state.running then
    if evidence.completed then q.stage='key_missing'
    elseif evidence.handInReady then q.stage='ready_to_turn_in'
    elseif evidence.mission and q.stage~='failed'and q.stage~='canceled'then q.stage='collecting_ghosts'end
  end
  q.display();if q.render then q.render()end
  return evidence
end

-- Observe only actual game modules/current inventory, not REDLINE's own cached checkpoint.
local lastSnapshot={}
local function recordObserved(key,value,event,phase,ghost,details)
  if not isListed or value~=true or lastSnapshot[key] then return end
  lastSnapshot[key]=true
  report(event,phase,ghost,details,true)
end
syncExisting=function()
  if not isListed or state.closed then return end
  local evidence=readQuestEvidence()
  if evidence.tutorialComplete==true then
    state.tutorialReady=true
    recordObserved('tutorial',true,'tutorial_complete','bank_tutorial',0,'ClientTasks confirmed completed tutorial')
  end
  if type(evidence.progress)=='number' then
    local ghosts=math.clamp(math.floor(evidence.progress),0,9)
    if ghosts>0 and (not lastSnapshot.ghosts or ghosts>lastSnapshot.ghosts) then
      lastSnapshot.ghosts=ghosts
      report('ghost_verified','ghost_dialogue',ghosts,'ClientTasks ghost progress',true)
    end
  end
  local item=localNamedItem('Skeleton Key')
  state.keyInInventory=(item~=nil and item~=false)
  if state.keyInInventory and not lastSnapshot.key then
    lastSnapshot.key=true
    if not lastSnapshot.ghosts or lastSnapshot.ghosts<9 then
      -- The item is stronger possession evidence than local quest progress, but don't fabricate ghost counts.
      note('INFO','Skeleton Key seen in inventory; ghost progress still needs separate verification')
    end
    report('key_verified','key_check',lastSnapshot.ghosts or 0,'Skeleton Key observed in ClientTools inventory',true)
  elseif not state.keyInInventory then
    if lastSnapshot.key then report('key_lost','key_check',0,'Skeleton Key no longer in current inventory',true) end
    lastSnapshot.key=nil
  end
  checkpoint()
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
  local before=refreshQuestEvidence()
  if before.mission or before.completed then return true end
  local tasks=liveModule('ClientTasks')
  if tasks and type(tasks.IsTaskAvailable)=='function' then
    local good,available=pcall(tasks.IsTaskAvailable,'SpeakerForTheDead')
    if good and available==false then
      return false,'SpeakerForTheDead not available; check event and prerequisites'
    end
  end
  local mainOK,mainWhy=state.prepareNPC('Ghost',route.main,token)
  if not mainOK then return false,mainWhy end
  -- The exported dialogue uses Network.InvokeServer("startTask", "SpeakerForTheDead").
  local network=liveModule('Network')
  if network and type(network.InvokeServer)=='function' then
    local ok,result=state.work.nativeCall(10,'startTask',network.InvokeServer,'startTask','SpeakerForTheDead')
    if not ok or result==false then note('WARN','Ghost mission start: '..tostring(result)) end
    task.wait(1)
    local evidence=refreshQuestEvidence()
    if evidence.mission then
      state.missionStarted=true;state.missionVerified=true;checkpoint()
      report('phase','quest_accepted',0,'Game confirmed quest after startTask',false)
      return true
    end
  end
  local opened,why=state.npcDialogueInput(mainOK,token)
  if not opened then return false,why end
  task.wait(.8)
  for _=1,15 do
    if not valid(token) then return false end
    local found,control=visibleText('Start Mission')
    if found and control then
      state.questOption(player.PlayerGui:FindFirstChild('NPCOptionsBillboard'),control,token)
      break
    end
    task.wait(.2)
  end
  task.wait(.8)
  local evidence=refreshQuestEvidence()
  if not evidence.mission then return false,'Mission unverified after startTask/dialogue' end
  state.missionStarted=true;state.missionVerified=true;checkpoint()
  return true
end
local function pickupSpeaker(token)
  local reason='Speaker’s Amulet pickup has not streamed in'
  local deadline=os.clock()+8;local attempted=false
  while valid(token)and os.clock()<deadline do
    if not waitUntilActive(token) or not characterAlive() then return false,'Stopped or character unavailable' end
    if state.quest.terminalFailure then return false,state.quest.terminalFailure end
    if toolEquipped('Speakers Amulet') then return true end
    if localNamedItem('Speakers Amulet') then
      if equipAmulet(token) then return true end
      reason=state.quest.equipmentError or 'Amulet owned, but equip not confirmed'
    else
      local api=liveModule('ClientGizmos')
      local ok,spawn=pcall(function()return api and api.GetGizmoByTag and api.GetGizmoByTag('SpeakersAmulet')end)
      local pickup=ok and type(spawn)=='table' and spawn or state.findSpeakerPickup()
      if pickup then
        local r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
        local position=bank.interactionPosition(pickup,pickup.model)
        if not r or not position then reason='Amulet interaction position unavailable'
        elseif (r.Position-position).Magnitude>12 then
          local p=position+Vector3.new(0,2,0)
          local travelStarted=os.clock()
          local reached,why=flyTo({x=p.X,y=p.Y,z=p.Z},token,'speaker_pickup',state.confirmedGhost)
          deadline=deadline+(os.clock()-travelStarted)
          if not reached then return false,why end
        elseif pickup.used or pickup.gizmoState and pickup.gizmoState.used then reason='Amulet spawn is on cooldown'
        else
          local standing,why=state.standingForInteraction()
          if standing then
            local callback=pickup.Interact or pickup.AttemptCollect
            if type(callback)=='function' then
              if not attempted then
                attempted=true
                local sent,err=state.work.nativeCall(10,pickup,callback,pickup,player)
                reason=sent and 'Waiting for amulet inventory replication' or tostring(err)
              end
            else reason='Amulet native pickup callback unavailable' end
          else reason=why end
        end
      end
    end
    task.wait(1.1)
  end
  return false,reason
end

local function ghostNameAtPoint(point)
  if type(point)~='table' then return nil end
  -- Restrict candidates to ghost identities before choosing the nearest: a closer ordinary
  -- NPC must not shadow the ghost standing at this waypoint.
  local npc=state.resolveNPC(nil,point,85,function(g)return ghostIds[g.name]==true or state.quest.identities and state.quest.identities[g.name]==true end)
  if npc then return npc.name end
  return nil
end

-- NPC.Reset is the exported game's cancellation/cleanup entry point. It does not grant credit.
function state.quest.cleanupDialogue(lease)
  local transaction=state.quest.dialogue
  if not transaction or transaction.lease~=lease then return true end
  if state.work.lease~=lease then return false,'Dialogue owner changed'end
  local npc=transaction.npc;local g=npc.gizmo
  if not player.Character or player.Character:FindFirstChild('HumanoidRootPart')~=transaction.root or not npc.model.Parent then
    state.quest.dialogue=nil;return true
  end
  local panel=player.PlayerGui:FindFirstChild('NPCOptionsBillboard')
  if not g.hasInteracted and (not panel or panel.Enabled==false)then state.quest.dialogue=nil;return true end
  if type(g.Reset)~='function'then return false,'Native NPC.Reset unavailable; close the dialogue manually'end
  if transaction.resetAttempted then return false,'Prior native cleanup was not confirmed; automatic retry withheld'end
  transaction.resetAttempted=true
  state.diagnostics.mark('option_action_before','dismiss via native cleanup','NPC.Reset')
  local ok,why=pcall(g.Reset,g)
  state.diagnostics.mark('option_action_after',ok and 'returned'or tostring(why),'NPC.Reset')
  if not ok then return false,tostring(why)end
  -- CleanupOptions animates its removal. Do not interpret the method's return as closure.
  local deadline=os.clock()+1.5
  repeat
    if state.work.lease~=lease then return false,'Dialogue owner changed'end
    panel=player.PlayerGui:FindFirstChild('NPCOptionsBillboard')
    if not g.hasInteracted and (not panel or panel.Enabled==false)then
      state.quest.dialogue=nil;state.diagnostics.mark('interaction_cleanup_completed','NPC flag and panel closed','NPC.Reset');return true
    end
    task.wait(.1)
  until os.clock()>=deadline
  return false,'Native cleanup returned; dialogue closure not observed'
end
local function dismissGhostDialogue(token,npc)
  if not valid(token)then return false end
  local lease=state.work.lease
  if not state.quest.dialogue and npc then
    state.quest.dialogue={npc=npc,root=player.Character and player.Character:FindFirstChild('HumanoidRootPart'),lease=lease}
  end
  return state.quest.cleanupDialogue(lease)
end
function state.quest.interactionFailure(reason)
 local text=tostring(reason or ''):lower();local stage
 if text:find('range',1,true)then stage='npc_outside_range'
 elseif text:find('camera',1,true)or text:find('line of sight',1,true)or text:find('alignment',1,true)then stage='camera_not_aligned'
 elseif text:find('not streamed',1,true)or text:find('unstreamed',1,true)or text:find('identified',1,true)or text:find('disappeared',1,true)then stage='npc_not_found'
 elseif text:find('prompt',1,true)or text:find('refuses',1,true)or text:find('hidden',1,true)or text:find('input target',1,true)or text:find('closer',1,true)then stage='interaction_prompt_unavailable'
 elseif text:find('landing',1,true)or text:find('standing',1,true)then stage='interaction_landing_unstable'
 else stage='dialogue_failed_to_open'end
 state.diagnostics.mark(stage,tostring(reason));return false,reason
end
local function talkGhost(token,i)
  state.quest.stage='identifying_ghost';state.quest.currentWaypoint=i
  local ghostName
  for _=1,25 do
    if not waitUntilActive(token)then return false,'Stopped'end
    ghostName=ghostNameAtPoint(route.ghosts[i]);if ghostName then break end;task.wait(.2)
  end
  local evidence=refreshQuestEvidence()
  if evidence.completed or evidence.handInReady then return true,'Ghost stage complete; returning to giver'end
  if not ghostName then return state.quest.interactionFailure('No quest ghost identified at saved waypoint '..i)end
  state.quest.waypoints[i]=ghostName;state.quest.currentNPC=ghostName
  if evidence.found and evidence.found[ghostName]then return true,'Already credited'end
  if not equipAmulet(token)then return false,state.quest.terminalFailure or state.quest.equipmentError or 'Speaker missing'end
  local npc,why=state.prepareNPC(ghostName,route.ghosts[i],token)
  if not npc then return state.quest.interactionFailure(why)end
  state.attemptedGhost=math.max(state.attemptedGhost,i);checkpoint()
  state.quest.stage='opening_dialogue'
  local opened,inputWhy=state.npcDialogueInput(npc,token)
  if not opened then return state.quest.interactionFailure(inputWhy)end
  state.quest.stage='verifying_ghost'
  local credited=false;local deadline=os.clock()+10
  repeat
    if not waitUntilActive(token)or not characterAlive()then return false,'Stopped or character unavailable'end
    local actual=refreshQuestEvidence()
    credited=actual.found and actual.found[ghostName]==true or actual.completed==true or actual.handInReady==true
    if credited then break end
    task.wait(.2)
  until os.clock()>=deadline
  state.diagnostics.snapshot('ghost_acknowledgment',{npc=ghostName,acknowledged=credited,phase=state.quest.stage,attempt=state.quest.attempt,owned=localNamedItem('Speakers Amulet'),equipped=toolEquipped('Speakers Amulet')})
  if credited then state.diagnostics.mark('ghost_credit_observed',ghostName,'ClientTasks.found')end
  if not credited and route.ghosts[i].name=='manor ghost'then
   -- Keep the already-open transaction for a bounded retry of credit verification.
   state.diagnostics.mark('quest_credit_unconfirmed',ghostName)
   return false,'No task-data credit for '..ghostName..'; existing dialogue retained for retry'
  end
  -- Wait for actual credit before dismissing: native talkedToNPC is scheduled after dialogue.
  local dismissed,closeWhy=dismissGhostDialogue(token,npc)
  if not dismissed then
    state.diagnostics.mark('dialogue_response_failed',tostring(closeWhy))
    state.quest.terminalFailure='Dialogue cleanup unconfirmed: '..tostring(closeWhy)
    return false,state.quest.terminalFailure
  end
  if not credited then state.diagnostics.mark('quest_credit_unconfirmed',ghostName);return false,'No task-data credit for '..ghostName..'; arrival/input is not success'end
  report('ghost_verified','ghost_dialogue',state.confirmedGhost,'NPC credited: '..ghostName,true)
  state.camera.release(state.work.lease);state.quest.lastFailure='';return true,'NPC identity verified in task data'
end

-- Live observation supplied by the owner: turn-in awards bones and drops a key near Ghost.
-- A reward entry alone is not possession. Watch the real world pickup and then current inventory.
function state.quest.collectDroppedKey(token)
  if not state.serverQuestComplete then return false,'Quest completion must be verified before reward pickup'end
  if state.quest.refreshKey()or state.quest.keyCollectedPreviously then
    state.quest.keyCollectedPreviously=true;state.quest.handedInObserved=true;state.quest.complete();return true
  end
  state.quest.stage='waiting_for_key_drop';state.quest.keyState='missing';state.quest.workflowComplete=false
  local giver=state.resolveNPC('Ghost',route.main,85)
  local center=giver and giver.position or Vector3.new(route.main.x,route.main.y,route.main.z)
  local deadline=os.clock()+35;local lastAttempt=-math.huge;local attempts=0
  while valid(token)and os.clock()<deadline do
    if not waitUntilActive(token)then return false,'Stopped'end
    if not characterAlive()then return false,'death'end
    if localNamedItem('Skeleton Key')then
      task.wait(.2)
      if not valid(token)then return false,'Stopped'end
      if localNamedItem('Skeleton Key')then
        state.keyInInventory=true;state.quest.keyCollectedPreviously=true;state.quest.keyState='owned';state.quest.handedInObserved=true;state.quest.complete()
        report('key_verified','key_check',state.confirmedGhost,'Skeleton Key possession verified after Ghost turn-in',true)
        checkpoint();return true,'Quest complete and Skeleton Key owned'
      end
    end
    local pickup=state.findWorldGizmo('Skeleton Key',120)
    local position=pickup and bank.interactionPosition(pickup,pickup.model)
    if pickup and position and (position-center).Magnitude<=110 then
      state.quest.stage='collecting_key';state.quest.keyState='acquiring'
      local r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
      if not r then return false,'Character unavailable'end
      if (r.Position-position).Magnitude>8 then
        local travelStarted=os.clock()
        local reached,why=flyTo({x=position.X,y=position.Y+2,z=position.Z},token,'key_check',state.confirmedGhost,2)
        deadline=deadline+(os.clock()-travelStarted)
        if not reached then return false,why end
      elseif os.clock()-lastAttempt>=1.25 and attempts<4 then
        local standing,why=state.standingForInteraction()
        if not standing then return false,why end
        if not valid(token)then return false,'Stopped'end
        attempts=attempts+1;state.quest.attempt=attempts;lastAttempt=os.clock()
        local ok,why=state.work.nativeCall(10,pickup,pickup.AttemptCollect,pickup,player)
        if not ok then state.quest.lastFailure='Key pickup: '..tostring(why)end
      end
    else state.quest.stage='waiting_for_key_drop'end
    task.wait(.25)
  end
  state.quest.refreshKey();state.quest.workflowComplete=false
  state.quest.terminalFailure='Turn-in confirmed; Skeleton Key pickup not verified after '..attempts..'/4 attempts (35-second window). Quest will not be replayed'
  return false,state.quest.terminalFailure
end
local function collectKey(token)
  local currency=liveModule('ClientData');local bonesBefore
  if currency and type(currency.Get)=='function'then local ok,v=pcall(currency.Get,'bones');if ok and type(v)=='number'then bonesBefore=v end end
  local evidence=refreshQuestEvidence()
  if not evidence.completed and not evidence.ghostsComplete then return false,'Ghost collection stage is not confirmed complete'end
  if not evidence.completed then
    state.quest.stage='waiting_for_turn_in'
    local stageDeadline=os.clock()+8
    while valid(token)and not evidence.handInReady and not evidence.completed and os.clock()<stageDeadline do
      task.wait(.2);evidence=refreshQuestEvidence()
    end
    if not valid(token)then return false,'Stopped'end
    if not evidence.completed and not evidence.handInReady then return false,'All ghosts credited; waiting for the game to activate Turn In'end
  end
  if not evidence.completed then
    state.quest.stage='handing_in'
    local npc,why=state.prepareNPC('Ghost',route.main,token)
    if not npc then return false,why end
    local opened,inputWhy=state.npcDialogueInput(npc,token)
    if not opened then return false,inputWhy end
    if not valid(token)then return false,'Stopped'end
    local ready,reason=state.npcReady(npc,token);if not ready then return false,reason end
    evidence=refreshQuestEvidence()
    if not evidence.completed and not evidence.handInReady then return false,'Turn In stage changed before hand-in'end
    if not evidence.completed then
      -- DialogUtil.FinishTaskOption's actual callback sends this exact task event.
      -- Using it avoids assuming option 1 is always the correct mission or injecting a mobile key.
      local network=liveModule('Network')
      if not network or type(network.FireServer)~='function'then
        state.quest.terminalFailure='Turn-in unavailable: native Network.FireServer missing';return false,state.quest.terminalFailure
      end
      state.diagnostics.mark('turn_in_before','SpeakerForTheDead at main Ghost','native taskEvent/turnIn')
      local ok,err=state.work.nativeCall(5,'SpeakerForTheDeadTurnIn',network.FireServer,'taskEvent','SpeakerForTheDead','turnIn')
      state.diagnostics.mark('turn_in_after',ok and 'request returned; verifying completion'or tostring(err),'native taskEvent/turnIn')
      if not ok then return false,'Turn-in request: '..tostring(err)end
      local deadline=os.clock()+12
      repeat
        if not waitUntilActive(token)or not characterAlive()then return false,'Stopped or character unavailable'end
        evidence=refreshQuestEvidence();if evidence.completed then break end
        task.wait(.2)
      until os.clock()>=deadline
      if not evidence.completed then return false,'Turn-in request sent, but ClientTasks did not confirm quest completion'end
    end
    state.diagnostics.mark('turn_in_verified','Game confirmed SpeakerForTheDead complete','ClientTasks.IsTaskComplete')
    local closed,closeWhy=dismissGhostDialogue(token,npc)
    if not closed then return false,'Turn-in confirmed; dialogue cleanup failed: '..tostring(closeWhy)end
  end
  state.serverQuestComplete=true;state.questCompleted=true;checkpoint()
  state.quest.stage='verifying_reward'
  if bonesBefore and currency then
    local ok,value=pcall(currency.Get,'bones')
    state.quest.bonesObserved=ok and type(value)=='number'and value-bonesBefore>=30000 or false
    if state.quest.bonesObserved then note('INFO','Observed Bones increase of at least 30,000 after hand-in')end
  end
  return state.quest.collectDroppedKey(token)
end

local function waitRespawn(token)
  report('death','respawning',state.confirmedGhost,'Waiting for a new living character',false)
  return valid(token)and state.recovery.wait(state.work.lease)
end
local function pause(token,what)
  return waitUntilActive(token)
end
local function recoverIfDead(token)
  if not state.died and characterAlive() then return true end
  if not waitRespawn(token) then return false end
  for recoveryAttempt=1,3 do
    if not valid(token)then return false end
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
  local attempts=0;state.quest.attempt=0
  while valid(token) do
    state.quest.stage=phase
    if not waitUntilActive(token) then return false end
    if not recoverIfDead(token) then return false end
    local reached,why=flyTo(target,token,phase,ghost)
    if not reached and why=='death' then
      if not recoverIfDead(token) then return false end
    elseif not reached then state.routeError=tostring(why);state.quest.lastFailure=state.routeError;warning(state.routeError);return false
    else
      if not valid(token) then return false end
      local ok,reason=action()
      if state.work.lease then state.camera.release(state.work.lease)end
      if state.died or not characterAlive()then
        if not recoverIfDead(token)then return false end
        continue
      end
      if not valid(token) then return false end
      if ok then return pause(token,phase) end
      local activeLease=state.work.lease
      if activeLease and activeLease.navigationFailed then
        state.routeError=activeLease.navigationFailed;state.quest.lastFailure=state.routeError;warning(state.routeError);return false
      end
      if state.quest.terminalFailure then
        state.quest.stage='failed';state.quest.lastFailure=state.quest.terminalFailure;state.routeError=state.quest.terminalFailure
        state.diagnostics.mark('quest_terminal_failure',state.quest.terminalFailure);warning(state.quest.terminalFailure);return false
      end
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
      state.quest.attempt=attempts;state.quest.lastFailure=tostring(reason or phase);state.quest.stage='retrying'
      if attempts>=4 then
        state.quest.stage='failed';state.routeError='Stopped after four attempts: '..state.quest.lastFailure
        warning(state.routeError);return false
      end
      if not valid(token) then return false end
      log('Retry scheduled: '..phase)
      task.wait(math.min(8,1+attempts))
    end
  end
  return false
end
local function startQuest()
  if state.work.lease or af.running or bank.running or bag.selling or (state.combat and state.combat.buying) or (state.shop and state.shop.running) then warning('Stop other navigation before Skeleton Key');return end
  if state.running then return end
  state.quest.lastFailure='';state.quest.terminalFailure=nil;state.quest.attempt=0;state.routeError=''
  local preflight=refreshQuestEvidence()
  if state.questCompleted and not preflight.completed then state.questCompleted=false end
  if preflight.completed and (localNamedItem('Skeleton Key')or state.quest.keyCollectedPreviously)then
    state.questCompleted=true;state.serverQuestComplete=true;state.quest.keyCollectedPreviously=true;state.quest.handedInObserved=true;state.quest.complete()
    state.quest.refreshKey();log('Finished · Skeleton Key pickup verified for this account');return
  end
  if not preflight.completed and not state.tutorialReady then log('Finish the bank tutorial first') return end
  if not liveModule('ClientTasks')then
    warning('ClientTasks unavailable; Ghost Quest progress cannot be verified');return
  end
  if state.work.dispatching and state.work.dispatching.canceled then return end
  state.running=true;state.stopping=false;state.paused=false;state.died=false;state.token=state.token+1
  local token=state.token
  state.work.launch('quest',token,function()
    state.work.lease.questManaged=true
    syncExisting()
    if preflight.completed then
      state.quest.stage='returning_for_key'
      local ok,why=pcall(function()
        local reached,reason=flyTo(route.main,token,'key_check',state.confirmedGhost)
        if not reached then error(reason)end
        local owned,message=state.quest.collectDroppedKey(token)
        if not owned then error(message)end
      end)
      if not ok then state.quest.stage='key_missing';state.quest.lastFailure=tostring(why);warning(state.quest.lastFailure)end
      return
    end
    report('start','main_ghost',0,'',false)
    local liveEvidence=refreshQuestEvidence()
    if liveEvidence.mission then state.missionStarted=true;state.missionVerified=true;checkpoint() end
    if isListed and liveEvidence.progress and liveEvidence.progress>0 then
      -- Resynchronize the separate tracker using the currently visible quest counter.
      for verified=1,liveEvidence.progress do
        report('ghost_verified','ghost_dialogue',verified,'Observed game counter',true)
      end
    end
    if state.confirmedGhost>0 and liveEvidence.progress==nil and not liveEvidence.ghostsComplete then
      state.routeError='Saved ghost progress could not be checked in-game. No ghosts will be skipped.'
      report('error','ghost_dialogue',state.confirmedGhost,state.routeError,false)
      state.running=false;warning(state.routeError);return
    end
    local ok,err=pcall(function()
      if not liveEvidence.mission and not liveEvidence.completed then
        if not doStage(token,route.main,'main_ghost',0,function() return beginMission(token) end) then return end
      end
      if not ensureMissionEvidence(token) then return end
      local stage=refreshQuestEvidence()
      if stage.handInReady or stage.ghostsComplete then
        state.quest.stage='returning_to_giver'
        doStage(token,route.main,'return_main',state.quest.required,function()return collectKey(token)end)
        return
      end
      local speakerReady=equipAmulet(token)
      if not speakerReady then
        if state.quest.terminalFailure then state.routeError=state.quest.terminalFailure;warning(state.routeError);return end
        if not speakerDestinationValid() then return end
        local owned=localNamedItem('Speakers Amulet');local r=root()
        local destination=owned and r and {x=r.Position.X,y=r.Position.Y,z=r.Position.Z}or route.speaker
        if not doStage(token,destination,'speaker_pickup',0,function() return pickupSpeaker(token) end) then return end
      else
        report('phase','speaker_equipped',state.confirmedGhost,'Speaker already in inventory; pickup skipped',false)
      end
      -- A count such as 4/9 does not identify which four waypoints were visited.
      -- Check each waypoint against the source-backed found set instead of jumping to #5.
      for i=1,#route.ghosts do
        if not valid(token) then return end
        local evidence=refreshQuestEvidence()
        if evidence.ghostsComplete then break end
        local resolved=ghostNameAtPoint(route.ghosts[i])
        if resolved then state.quest.waypoints[i]=resolved;checkpoint()end
        local matchedName=resolved or state.quest.waypoints[i]
        if matchedName and evidence.found and evidence.found[matchedName] then
          log('Skipping credited ghost: '..matchedName)
        else
          if not doStage(token,route.ghosts[i],'ghost_travel',i,function()
            return talkGhost(token,i)
          end) then return end
        end
      end
      local last=refreshQuestEvidence()
      if not last.ghostsComplete then
        warning('Quest remains at '..tostring(last.progress or '?')..'/9 after saved route. Copy error log; an unlisted ghost may be required.')
        report('error','ghost_dialogue',last.progress or 0,'All recorded locations checked; task not yet at 9/9',false)
        return
      end
      if valid(token) then
        state.quest.stage='returning_to_giver'
        if not doStage(token,route.main,'return_main',state.quest.required,function() return collectKey(token) end) then return end
      end
    end)
    if not ok then report('error',state.phase,state.confirmedGhost,tostring(err):sub(1,220),false);log('Quest interrupted: '..tostring(err)) end
    if state.token==token then
      state.running=false;state.awaiting=false;stopMotion()
      if not state.quest.workflowComplete then state.quest.stage=state.serverQuestComplete and 'key_missing'or 'failed';state.quest.lastFailure=state.routeError~=''and state.routeError or tostring(err or 'Objective not confirmed');warning(state.quest.lastFailure)end
      if state.quest.render then state.quest.render()end
    end
  end)
end
local function attachDeath(ch)
  if state.boundDeathCharacter==ch then return end
  state.boundDeathCharacter=ch
  if state.deathConnection then
    state.deathConnection:Disconnect();local index=table.find(state.connected,state.deathConnection);if index then table.remove(state.connected,index)end
    state.deathConnection=nil
  end
  local hum=ch:FindFirstChildOfClass('Humanoid') or ch:WaitForChild('Humanoid',12)
  if not hum or state.closed or player.Character~=ch then return end
  state.deathConnection=hum.Died:Connect(function()
    if state.died then return end
    if state.recovery then state.recovery.onDeath(ch)end
    state.died=true;if state.camera.current then state.camera.release(state.camera.current.lease)end;state.amuletHeld=false;stopMotion();log('Died; recovery will begin after respawn')
  end)
  table.insert(state.connected,state.deathConnection)
end
if player.Character then attachDeath(player.Character) end
if player.CharacterRemoving then table.insert(state.connected,player.CharacterRemoving:Connect(function(ch)
  if state.recovery then state.recovery.onDeath(ch)end
  state.died=true;if state.camera.current then state.camera.release(state.camera.current.lease)end
  stopMotion(true);restoreCollision()
end))end
table.insert(state.connected,player.CharacterAdded:Connect(function(ch)
  if state.boundDeathCharacter and state.boundDeathCharacter~=ch and state.recovery then state.recovery.onDeath(state.boundDeathCharacter)end
  if state.camera.current then state.camera.release(state.camera.current.lease)end
  stopMotion(true);restoreCollision();state.died=false
  attachDeath(ch);startNoclip()
end))

task.spawn(function()
  while not state.closed do
    task.wait(25)
    if isListed then
      if state.running then report('heartbeat',state.phase,state.confirmedGhost,'',false)
      else report('client_seen','waiting',0,'',false) end
    end
    if isListed and #outbox>0 then flushOutbox() end
  end
end)


local sessionStarted=os.clock()
local function setPaused(paused)
  if not state.running then log('No quest running');return end
  state.paused=paused
  if paused then
    if state.camera.current then state.camera.release(state.camera.current.lease)end
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
  autoSpas=true,spasStatus='Waiting',lastEquip=0,lastWarn=0,spasTool=nil,lastShotAttempt=0,headAssist=false,
  fovPixels=175,whitelist={},selectedTargets={},manualTargetOnly=true} 
state.combat=combat
if configSaved and type(configSaved.combatWhitelist)=='table' then
  for _,id in ipairs(configSaved.combatWhitelist) do
    if type(id)=='number' then combat.whitelist[id]=true end
  end
end
if configSaved and tonumber(configSaved.fovPixels) then
  combat.fovPixels=math.clamp(math.floor(configSaved.fovPixels),50,450)
end
combat.fovColor=(configSaved and configSaved.fovColor) or {207,87,115}
combat.hitColor=(configSaved and configSaved.hitColor) or {100,200,237}
combat.fovAlpha=math.clamp(tonumber(configSaved and configSaved.fovAlpha) or .68,0,1)
combat.hitAlpha=math.clamp(tonumber(configSaved and configSaved.hitAlpha) or .55,0,1)
if configSaved and type(configSaved.ignoreFriends)=='boolean' then combat.ignoreFriends=configSaved.ignoreFriends end
function combat.savePrefs()
  local ids={}
  for id,on in pairs(combat.whitelist) do if on and type(id)=='number' then table.insert(ids,id) end end
  local config=readFile(settingsFile) or {}
  config.combatWhitelist=ids;config.fovPixels=combat.fovPixels
  config.fovColor=combat.fovColor;config.hitColor=combat.hitColor;config.fovAlpha=combat.fovAlpha;config.hitAlpha=combat.hitAlpha;config.ignoreFriends=combat.ignoreFriends
  if configSaved then configSaved.combatWhitelist=ids;configSaved.fovPixels=combat.fovPixels end
  if combat.v30 then config.combat30=combat.v30.settings;config.combatPresets=combat.v30.presets end
  saveFile(settingsFile,config)
end
-- v30 combat state: one schema, independent visual colors, stable UserId protection.
combat.v30={records={},thumbs={},hooks={},effects={},lastData=0,lastDraw=0,lastDiagnostic='',lastDiagnosticAt=0}
do
 local v=combat.v30
 function v.copy(t)if type(t)~='table'then return t end;local r={};for k,x in pairs(t)do r[k]=v.copy(x)end;return r end
 local function color(r,g,b,a)return {r=r,g=g,b=b,a=a or 1}end
 v.defaults={
  aim={enabled=false,part='Head',priority='Crosshair',distance=200,visibility=true,team=true,knocked=true,safe=true,alive=true,friends=true,party=true,retain=true,switching=true,chance=100,prediction=false,indicator=true,information=true,diagnostics=false},
  fov={show=true,radius=175,thickness=1.5,outline=true,fill=false,center='Screen',rainbow=false,rainbowSpeed=.15,color=color(190,154,237,.8),fillColor=color(190,154,237,.08)},
  esp={enabled=false,box='Corner',boxEnabled=true,boxThickness=1.5,boxOutline=true,boxOutlineThickness=1,boxFill=false,corner=.25,
   skeleton=false,skeletonThickness=1.5,skeletonOutline=true,skeletonDistance=1200,chams=false,chamsTeam=false,chamsVisibilityColors=false,chamsDistance=1200,
   healthBar=true,healthNumber=false,healthPercent=false,healthPosition='Left',healthThickness=3,healthGradient=true,healthTextSize=12,
   username=true,displayName=false,avatar=false,avatarSize=32,avatarPosition='Top',avatarBorder=true,distanceLabel=true,distancePrecision=0,distanceSize=11,distanceMax=1500,
   teamLabel=false,aliveLabel=false,knockedLabel=false,safeLabel=false,arrows=false,arrowSize=14,arrowPadding=34,arrowDistance=true,arrowMax=1500,
   team=false,friends=false,whitelist=true,alive=true,knocked=false,safe=false,visibleOnly=false,occluded=true,distance=1500,scale=true,textSize=12,
   boxColor=color(190,154,237),boxOutlineColor=color(0,0,0),boxFillColor=color(120,87,155,.1),skeletonColor=color(235,235,242),skeletonOutlineColor=color(0,0,0),
   chamsFill=color(117,53,73,.35),chamsOutline=color(25,22,28,.8),visibleColor=color(148,121,188,.35),occludedColor=color(117,53,73,.35),
   healthBackground=color(25,25,30,.8),healthyColor=color(110,211,144),damagedColor=color(229,184,91),criticalColor=color(224,87,105),healthTextColor=color(240,240,244),
   usernameColor=color(240,240,244),displayNameColor=color(199,173,231),distanceColor=color(223,193,132),statusColor=color(181,182,195),avatarBorderColor=color(153,119,177),avatarOpacity=1,arrowColor=color(123,171,230)},
  hbe={enabled=false,part='Head',head=8,body=8,distance=200,team=true,safe=true,knocked=true,alive=true,friends=true,party=true,preview=false,color=color(137,171,215,.3)},
  projectile={tracers=false,impacts=false,material=false,lifetime=.7,thickness=1.5,color=color(201,166,233,.8),impactColor=color(224,128,145,.9)},
  advanced={performance='Balanced',hz=60,infoHz=5,maxPlayers=50,friendAuto=false,party=true,theme='REDLINE Default'},
  legacy={loopbring=false,autoSpas=true},ammo={automatic=false,cooldown=90},
 }
 v.choices={part={Head=true,Torso=true,['Closest Part']=true,Body=true,Both=true},priority={Crosshair=true,Distance=true,Health=true},center={Screen=true,Cursor=true},box={Off=true,['2D']=true,['3D']=true,Corner=true},healthPosition={Left=true,Right=true,Bottom=true},avatarPosition={Top=true,Left=true},performance={Normal=true,Balanced=true,Performance=true},theme={['REDLINE Default']=true,Purple=true,Burgundy=true,['Minimal White']=true,Custom=true}}
 v.bounds={radius={10,700},distance={25,5000},distanceMax={25,5000},distancePrecision={0,2},distanceSize={9,20},textSize={9,20},healthTextSize={9,20},chance={0,100},thickness={.5,6},boxThickness={.5,6},boxOutlineThickness={.5,4},skeletonThickness={.5,6},corner={.1,.5},head={2,18},body={3,18},skeletonDistance={25,5000},chamsDistance={25,5000},arrowMax={25,5000},arrowSize={6,32},arrowPadding={12,120},avatarSize={20,64},avatarOpacity={0,1},healthThickness={2,10},lifetime={.1,3},rainbowSpeed={.02,2},hz={15,120},infoHz={2,15},maxPlayers={5,100},cooldown={15,300}}
 function v.sanitize(src,defaults)
  local out=v.copy(defaults)
  if type(src)~='table'then return out end
  for k,d in pairs(defaults)do
   local x=src[k]
   if type(d)=='table'then out[k]=v.sanitize(x,d)
   elseif type(x)==type(d)then
    if type(d)=='number'then local b=v.bounds[k]or ((k=='r'or k=='g'or k=='b')and {0,255})or (k=='a'and {0,1});if x==x and math.abs(x)<math.huge then out[k]=b and math.clamp(x,b[1],b[2])or x end
    elseif type(d)=='string'then if not v.choices[k]or v.choices[k][x]then out[k]=x end
    else out[k]=x end
   end
  end
  if defaults==v.defaults or defaults.aim and defaults.hbe then
   if not ({Head=true,Torso=true,['Closest Part']=true})[out.aim.part]then out.aim.part='Head'end
   if not ({Head=true,Body=true,Both=true})[out.hbe.part]then out.hbe.part='Head'end
  end
  return out
 end
 local saved=configSaved and configSaved.combat30
 v.settings=v.sanitize(saved,v.defaults)
 if not saved then
  v.settings.fov.radius=combat.fovPixels;v.settings.aim.friends=combat.ignoreFriends
  local c=type(combat.fovColor)=='table'and combat.fovColor or {190,154,237};v.settings.fov.color=color(tonumber(c[1])or 190,tonumber(c[2])or 154,tonumber(c[3])or 237,combat.fovAlpha)
 end
 v.presets={};local presetCount=0
 for name,preset in pairs(configSaved and type(configSaved.combatPresets)=='table'and configSaved.combatPresets or {})do
  if type(name)=='string'and #name>0 and #name<=40 and type(preset)=='table'and presetCount<30 then v.presets[name]=v.sanitize(preset,v.defaults);presetCount=presetCount+1 end
 end
 function v.rgb(c)return Color3.fromRGB(c.r,c.g,c.b)end
 function v.syncLegacy()
  combat.silent=v.settings.aim.enabled;combat.hitbox=v.settings.hbe.enabled;combat.hitboxSize=v.settings.hbe.head
  combat.fovPixels=v.settings.fov.radius;combat.fovColor={v.settings.fov.color.r,v.settings.fov.color.g,v.settings.fov.color.b};combat.fovAlpha=v.settings.fov.color.a
  combat.hitColor={v.settings.hbe.color.r,v.settings.hbe.color.g,v.settings.hbe.color.b};combat.hitAlpha=v.settings.hbe.color.a
  combat.range=v.settings.aim.distance;combat.ignoreFriends=v.settings.aim.friends;combat.loopbring=v.settings.legacy.loopbring;combat.autoSpas=v.settings.legacy.autoSpas
 end
 v.syncLegacy()
 function v.changed()
  v.syncLegacy();combat.currentTarget=nil;v.target=nil
  if v.restoreHBE then v.restoreHBE()end
  if v.settings.aim.enabled or combat.loopbring and combat.autoSpas or v.settings.projectile.tracers or v.settings.projectile.impacts then v.install()else v.uninstall()end
  combat.savePrefs();if v.refreshUI then v.refreshUI()end
 end
 function v.diagnostic(reason)
  if not v.settings.aim.diagnostics or os.clock()-v.lastDiagnosticAt<1 then return end
  v.lastDiagnostic=reason;v.lastDiagnosticAt=os.clock();note('INFO','Combat: '..reason)
 end
 function v.whitelisted(p)return p and (combat.whitelist[p.UserId]or combat.whitelist[p.Name:lower()] or state.auth and state.auth.protected and state.auth.protected[p.UserId])==true end
 function v.friend(p)
  local id=p.UserId
  if combat.friendCache[id]==nil then
   combat.friendCache[id]=true
   task.spawn(function()local ok,yes=pcall(player.IsFriendsWith,player,id);if p.Parent then combat.friendCache[id]=not ok or yes==true end end)
  end
  return combat.friendCache[id]
 end
 function v.playerState(p)
  if not p or p==player or not p.Parent then return nil,'Player unavailable'end
  local ch=p.Character;local hum=ch and ch:FindFirstChildOfClass('Humanoid');local r=ch and ch:FindFirstChild('HumanoidRootPart');local mine=root()
  if not ch or not ch.Parent or not hum or not r or not mine then return nil,'Character unavailable'end
  local knocked=p:GetAttribute('knocked');local cp=liveModule('ClientPlayers')
  if cp and type(cp.GetByPlayerId)=='function'then local ok,obj=pcall(cp.GetByPlayerId,p.UserId);if ok and obj and type(obj.GetPlayerProperty)=='function'then local yes,value=pcall(obj.GetPlayerProperty,obj,'knocked');if yes and value~=nil then knocked=value end end end
  local team=p:GetAttribute('currentTeam');local myTeam=player:GetAttribute('currentTeam')
  local same=(team~=nil and myTeam~=nil and team==myTeam)or (p.Team~=nil and player.Team~=nil and p.Team==player.Team)
  return {player=p,character=ch,humanoid=hum,root=r,health=hum.Health,maxHealth=hum.MaxHealth,alive=hum.Health>0,knocked=knocked==true,
   safe=p:GetAttribute('safe')==true or p:GetAttribute('PVEZone')==true or p:GetAttribute('god')==true or ch:FindFirstChildOfClass('ForceField')~=nil,
   team=team or (p.Team and p.Team.Name)or 'None',sameTeam=same,distance=(mine.Position-r.Position).Magnitude,
   party=player:GetAttribute('partyId')~=nil and player:GetAttribute('partyId')==p:GetAttribute('partyId')}
 end
 function v.eligible(p,options,offensive)
  local d,why=v.playerState(p);if not d then return nil,why end
  if offensive and state.auth and state.auth.enabled and not state.auth.ownerListReady then return nil,'Owner protection list unavailable' end
  if (offensive or options.whitelist)and v.whitelisted(p)then return nil,'Whitelisted / Owner excluded'end
  if (options.friends or v.settings.advanced.friendAuto)and v.friend(p)then return nil,'Friend excluded'end
  if options.team and d.sameTeam then return nil,'Same team'end
  if (options.party or offensive and v.settings.advanced.party)and d.party then return nil,'Same party'end
  if (offensive or options.alive)and not d.alive then return nil,'Dead'end
  if options.knocked and d.knocked then return nil,'Knocked'end
  if options.safe and d.safe then return nil,'Protected zone'end
  if d.distance>options.distance then return nil,'Beyond distance'end
  if offensive then
   local util=liveModule('CombatUtil')
   if not util or type(util.CanPlayersPVP)~='function'then return nil,'PvP eligibility unavailable'end
   local ok,yes=pcall(util.CanPlayersPVP,player,p)
   if not ok or yes~=true then return nil,'Game PvP protection'end
  end
  return d
 end
 function v.center()
  local cam=workspace.CurrentCamera;if not cam then return Vector2.zero end
  -- Overlay uses IgnoreGuiInset=true and WorldToViewportPoint: both use viewport pixels.
  if v.settings.fov.center=='Cursor'and not UserInputService.TouchEnabled and UserInputService.MouseEnabled then return UserInputService:GetMouseLocation()end
  return cam.ViewportSize*.5
 end
 function v.visible(position,ch)
  local cam=workspace.CurrentCamera;if not cam then return false end
  local params=RaycastParams.new();params.FilterType=Enum.RaycastFilterType.Exclude;params.FilterDescendantsInstances={player.Character,ch};params.IgnoreWater=true
  local ok,hit=pcall(workspace.Raycast,workspace,cam.CFrame.Position,position-cam.CFrame.Position,params)
  return ok and hit==nil
 end
 function v.targetPart(d)
  local c=d.character;local head=c:FindFirstChild('Head_Hitbox',true)or c:FindFirstChild('Head');local torso=c:FindFirstChild('HumanoidRootPart_Hitbox',true)or c:FindFirstChild('UpperTorso')or c:FindFirstChild('Torso')or d.root
  if v.settings.aim.part=='Head'then return head end
  if v.settings.aim.part=='Torso'then return torso end
  local best,dist=nil,math.huge;local cam=workspace.CurrentCamera;local center=v.center()
  for _,part in ipairs({head or torso,torso,c:FindFirstChild('LowerTorso')or torso})do
   if part and part:IsA('BasePart')then local p,on=cam:WorldToViewportPoint(part.Position);local n=(Vector2.new(p.X,p.Y)-center).Magnitude;if on and p.Z>0 and n<dist then best=part;dist=n end end
  end
  return best
 end
 function v.candidate(p)
  local d,reason=v.eligible(p,v.settings.aim,true);if not d then return nil,reason end
  if combat.loopbring and combat.manualTargetOnly and not combat.selectedTargets[p.UserId]then return nil,'Not selected'end
  local part=v.targetPart(d);local cam=workspace.CurrentCamera;if not part or not cam then return nil,'Target part missing'end
  local s,on=cam:WorldToViewportPoint(part.Position);local delta=(Vector2.new(s.X,s.Y)-v.center()).Magnitude
  if not on or s.Z<=0 or delta>v.settings.fov.radius then return nil,'Outside FOV'end
  if v.settings.aim.visibility and not v.visible(part.Position,d.character)then return nil,'Occluded'end
  d.part=part;d.screen=s;d.fovDistance=delta;return d
 end
 function v.select()
  local prior=v.target and v.target.player
  if prior and (v.settings.aim.retain or not v.settings.aim.switching)then local d=v.candidate(prior);if d then v.target=d;return prior,d end end
  v.target=nil;local best
  for _,p in ipairs(Players:GetPlayers())do
   if p~=player then
    local d,why=v.candidate(p)
    if d then local priority=v.settings.aim.priority;local score=priority=='Distance'and d.distance or priority=='Health'and d.health or d.fovDistance
     if not best or score<best then best=score;v.target=d end
    else v.diagnostic(p.Name..': '..tostring(why))end
   end
  end
  return v.target and v.target.player,v.target
 end
 function v.weapon()
  local tools=liveModule('ClientTools');if not tools or type(tools.GetLocalEquippedTool)~='function'then return end
  local ok,tool=pcall(tools.GetLocalEquippedTool);if not ok or type(tool)~='table'or type(tool.GetComponent)~='function'then return end
  local yes,shooter=pcall(tool.GetComponent,tool,'Shooter');if not yes or type(shooter)~='table'or type(shooter._shoot)~='function'then return end
  return tool,shooter
 end
 function v.velocity(tool)
  local objects=liveModule('Objects');local units=liveModule('UnitUtil');if not objects or not units or type(objects.GetData)~='function'or type(units.StudsFromMeters)~='function'then return end
  local ok,data=pcall(objects.GetData,tool.name,true);if not ok or type(data)~='table'or type(data.projectile)~='table'then return end
  local meters=tonumber(data.projectile.muzzleVelocity);if not meters or meters<=0 then return end
  local attachment=tool.attachments and tool.attachments.Muzzle
  if attachment then local good,a=pcall(objects.GetData,attachment,true);if not good or not a then return end;if tonumber(a.velocityMod)then meters=meters*a.velocityMod end end
  if workspace:GetAttribute('bulletTime')and workspace:GetAttribute('bulletTime')~=100 then return end
  local good,speed=pcall(units.StudsFromMeters,meters);if good and type(speed)=='number'and speed>0 then return speed,meters end
 end
 function v.predict(d,tool,origin)
  local speed=v.velocity(tool);if not speed then return d.part.Position,nil end
  local r=d.part.Position-origin;local velocity=d.root.AssemblyLinearVelocity
  local a=velocity:Dot(velocity)-speed*speed;local b=2*r:Dot(velocity);local c=r:Dot(r);local time
  if math.abs(a)<1e-6 then if math.abs(b)>1e-6 then time=-c/b end
  else local disc=b*b-4*a*c;if disc>=0 then local t1=(-b-math.sqrt(disc))/(2*a);local t2=(-b+math.sqrt(disc))/(2*a);if t1>0 and t2>0 then time=math.min(t1,t2)else time=t1>0 and t1 or t2>0 and t2 or nil end end end
  if not time or time>3 then return d.part.Position,nil end
  return d.part.Position+velocity*time,time -- linear lead estimate; wind/drag/gravity intentionally not claimed exact.
 end
 function v.uninstall()
  for obj,h in pairs(v.hooks)do if rawget(obj,'_shoot')==h.wrapper then obj._shoot=h.raw end end
  v.hooks={};combat.headAssist=false
 end
 function v.install()
  local tool,shooter=v.weapon();if not shooter then v.uninstall();combat.silentStatus='Waiting for an equipped native gun';return false end
  for obj,h in pairs(v.hooks)do if obj~=shooter then if rawget(obj,'_shoot')==h.wrapper then obj._shoot=h.raw end;v.hooks[obj]=nil end end
  combat.headAssist=combat.loopbring and combat.autoSpas
  if v.hooks[shooter]then return true end
  local h={raw=rawget(shooter,'_shoot'),original=shooter._shoot};local wrapper
  wrapper=function(self,...)
   if state.closed or self~=shooter then return h.original(self,...)end
   local before=self.lastShot;local old1,old2=self.aimpoint,self.aimpoint2;local altered=false
   if (combat.silent or combat.headAssist)and not state.work.lease and math.random()*100<v.settings.aim.chance then
    local _,d=v.select();if d then
     local cam=workspace.CurrentCamera;local point=d.part.Position
     if v.settings.aim.prediction then point=v.predict(d,tool,cam.CFrame.Position)end
     -- Recheck the predicted point too: correction never leaves the visible FOV.
     local p,on=cam:WorldToViewportPoint(point)
     if on and p.Z>0 and (Vector2.new(p.X,p.Y)-v.center()).Magnitude<=v.settings.fov.radius then self.aimpoint=point;self.aimpoint2=point;altered=true end
    end
   end
   local result=table.pack(pcall(h.original,self,...))
   if altered then self.aimpoint=old1;self.aimpoint2=old2 end
   if self.lastShot~=before and v.observeShot then v.observeShot(tool)end
   if not result[1]then error(result[2],0)end
   return table.unpack(result,2,result.n)
  end
  h.wrapper=wrapper
  local ok=pcall(function()shooter._shoot=wrapper end)
  if not ok then combat.silentStatus='Unsupported: native Shooter is not writable';return false end
  v.hooks[shooter]=h;combat.silentStatus='Native aim integration · server hits unverified';combat.headAssist=combat.loopbring and combat.autoSpas
  return true
 end
 v.hbeOriginal={}
 function v.restoreHBE()
  for part,old in pairs(v.hbeOriginal)do
   if part.Parent and part.Size==old.written then pcall(function()part.Size=old.size end)end
   if old.preview then old.preview:Destroy()end
  end
  v.hbeOriginal={}
 end
 function v.applyHBE()
  local active={};local opts=v.settings.hbe
  if combat.hitbox then
   for _,p in ipairs(Players:GetPlayers())do
    local d=v.eligible(p,opts,true)
    if d then
     for _,name in ipairs(opts.part=='Both'and {'Head_Hitbox','HumanoidRootPart_Hitbox'}or {opts.part=='Body'and 'HumanoidRootPart_Hitbox'or 'Head_Hitbox'})do
      local part=d.character:FindFirstChild(name,true)
      if part and part:IsA('BasePart')and part.Parent.Name=='Hitbox'and part:GetAttribute('hitboxPart')then
       active[part]=true;local old=v.hbeOriginal[part]
       if not old then old={size=part.Size};v.hbeOriginal[part]=old elseif old.written and part.Size~=old.written then old.size=part.Size end
       local size=name=='Head_Hitbox'and opts.head or opts.body;old.written=Vector3.new(size,size,size);part.Size=old.written
       if opts.preview then
        if not old.preview then old.preview=Instance.new('BoxHandleAdornment');old.preview.Name='REDLINE_HBE_Preview';old.preview.Adornee=part;old.preview.AlwaysOnTop=true;old.preview.ZIndex=1;old.preview.Parent=part end
        old.preview.Size=part.Size;old.preview.Color3=v.rgb(opts.color);old.preview.Transparency=1-opts.color.a
       elseif old.preview then old.preview:Destroy();old.preview=nil end
      end
     end
    end
   end
  end
  for part,old in pairs(v.hbeOriginal)do if not active[part]then if part.Parent and part.Size==old.written then part.Size=old.size end;if old.preview then old.preview:Destroy()end;v.hbeOriginal[part]=nil end end
 end
 function v.protect(id,on)
  id=tonumber(id);if not id or id<=0 or id%1~=0 then return false,'Invalid UserId'end
  if state.auth and state.auth.protected and state.auth.protected[id] and not on then return false,'Owner exclusion is server-provided and cannot be removed here' end
  combat.whitelist[id]=on==true or nil;if on then combat.selectedTargets[id]=nil end
  v.target=nil;combat.currentTarget=nil;v.restoreHBE();combat.savePrefs();return true
 end
 function v.preset(action,name,other)
  name=tostring(name or ''):match('^%s*(.-)%s*$');if name==''or #name>40 then return false,'Use a name of 1–40 characters'end
  if action=='save'then local n=0;for _ in pairs(v.presets)do n=n+1 end;if n>=30 and not v.presets[name]then return false,'30 preset limit'end;v.presets[name]=v.copy(v.settings)
  elseif action=='load'then if not v.presets[name]then return false,'Preset not found'end;v.settings=v.sanitize(v.presets[name],v.defaults)
  elseif action=='delete'then v.presets[name]=nil
  elseif action=='rename'then other=tostring(other or ''):match('^%s*(.-)%s*$');if not v.presets[name]or other==''or #other>40 or v.presets[other]then return false,'Choose an unused name'end;v.presets[other]=v.presets[name];v.presets[name]=nil
  else return false,'Unknown preset action'end
  v.changed();return true
 end
 function v.reset(section)
  if section then if not v.defaults[section]then return false end;v.settings[section]=v.copy(v.defaults[section])else v.settings=v.copy(v.defaults)end
  v.changed();return true
 end
end

local function isFriendly(other)
 local v=combat.v30
 return v.whitelisted(other) or ((combat.ignoreFriends or v.settings.advanced.friendAuto) and v.friend(other))or (v.settings.advanced.party and player:GetAttribute('partyId')~=nil and player:GetAttribute('partyId')==other:GetAttribute('partyId'))
end
local function selectCombatTarget()return combat.v30.select()end
local function restoreHitboxes()combat.v30.restoreHBE()end
local function applyHitboxes()combat.v30.applyHBE()end
combat.originalVisibility={};combat.cloneCharacters={}
local function restoreVisuals()
 for part,value in pairs(combat.originalVisibility) do
  if part and part.Parent then pcall(function()part.LocalTransparencyModifier=value end)end
 end
 combat.originalVisibility={}
end
local function discardClones()
 for _,model in pairs(combat.clones)do if model then pcall(function()model:Destroy()end)end end
 combat.clones={};combat.cloneCharacters={};restoreVisuals()
end
local function cloneVisual(other)
 local ch=other.Character
 if not ch then return nil end
 local archivable=ch.Archivable;ch.Archivable=true
 local ok,model=pcall(function()return ch:Clone()end);ch.Archivable=archivable
 if not ok or not model then return nil end
 model.Name='REDLINE_LOCAL_VISUAL_'..other.UserId
 for _,obj in ipairs(model:GetDescendants())do
  if obj:IsA('Script') or obj:IsA('LocalScript') or obj:IsA('ModuleScript') then obj:Destroy()
  elseif obj:IsA('BasePart') then obj.Anchored=true;obj.CanCollide=false;obj.CanTouch=false;obj.CanQuery=false end
 end
 model.Parent=workspace.CurrentCamera
 return model
end
local function updateLoopbring()
 if not combat.loopbring then if next(combat.clones) then discardClones()end;return end
 local myRoot=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
 if not myRoot then return end
 local seen={}
 for _,other in ipairs(Players:GetPlayers())do
  if other~=player and combat.selectedTargets[other.UserId] and not isFriendly(other) then
   local ch=other.Character
   local rootPart=ch and ch:FindFirstChild('HumanoidRootPart')
   local hum=ch and ch:FindFirstChildOfClass('Humanoid')
   if rootPart and hum and hum.Health>0 then
    seen[other.UserId]=true
    local visual=combat.clones[other.UserId]
    if visual and combat.cloneCharacters[other.UserId]~=ch then visual:Destroy();visual=nil;restoreVisuals()end
    if not visual or not visual.Parent then visual=cloneVisual(other);combat.clones[other.UserId]=visual;combat.cloneCharacters[other.UserId]=ch end
    if visual then
     local pos=myRoot.Position+myRoot.CFrame.LookVector*8
     pcall(function()visual:PivotTo(CFrame.lookAt(pos,myRoot.Position))end)
     for _,part in ipairs(ch:GetDescendants())do
      if part:IsA('BasePart') then
       if combat.originalVisibility[part]==nil then combat.originalVisibility[part]=part.LocalTransparencyModifier end
       part.LocalTransparencyModifier=1
      end
     end
    end
   end
  end
 end
 local remove=false
 for id,model in pairs(combat.clones)do
  if not seen[id] then
   if model then model:Destroy()end
   combat.clones[id]=nil;combat.cloneCharacters[id]=nil;remove=true
  end
 end
 if remove then
  restoreVisuals()
  -- The next update reapplies local visibility for still-selected players.
 end
end
local function installSilentAim()return combat.v30.install()end
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
-- SPAS shop acquisition is a best-effort, game-validated purchase.
-- Never claims success until ClientTools shows ownership.
function combat.buySpas()
 if state.work.lease or state.work.pending or combat.buying or state.closed or state.running or af.running or bank.running or bag.selling or (state.shop and state.shop.running) then return end
 combat.buying=true
 combat.spasStatus='Checking nearest gunshop'
 combat.buyToken=(combat.buyToken or 0)+1
 state.work.launch('combatShop',combat.buyToken,function()
  local ok,reason=pcall(function()
   local shops=liveModule('GameShops')
   local utility=liveModule('GameShopUtil')
   local network=liveModule('Network')
   if not shops or not utility or not network or type(network.InvokeServer)~='function'
    or type(shops.GetCategoryData)~='function' or type(utility.GetClosestShopPart)~='function' then
      error('Gunshop server modules unavailable')
   end
   local got,cat=pcall(shops.GetCategoryData,'GunShop','Medium')
   if not got or type(cat)~='table' or type(cat.data)~='table' or not cat.data['SPAS-12'] then
     error('SPAS-12 not sold in current GunShop Medium category')
   end
   local found,shopPart=pcall(utility.GetClosestShopPart,player,'GunShop')
   if not found or not shopPart or not shopPart:IsA('BasePart') then error('Gunshop location unknown')end
   local destination=shopPart.Position+Vector3.new(0,2,0)
   local initialRoot=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
   local distance=initialRoot and (destination-initialRoot.Position).Magnitude or 0
   local deadline=os.clock()+math.max(65,distance/state.speed*3+20);local best=math.huge;local lastProgress=os.clock()
   while not state.closed and combat.buying and os.clock()<deadline do
    if state.running or af.running or bank.running or bag.selling then error('Navigation task took priority')end
    local rootPart=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
    if not rootPart or not characterAlive() then error('Player unavailable')end
    local delta=destination-rootPart.Position
    local allowed,why,corrected=motion.watchTravel(rootPart,destination)
    if not allowed then error(why)end
    delta=destination-rootPart.Position
    if corrected then deadline=os.clock()+math.max(65,delta.Magnitude/state.speed*3+20);best=math.huge;lastProgress=os.clock()end
    if delta.Magnitude<=8 then motion.arrived();break end
    if delta.Magnitude<best-2 then best=delta.Magnitude;lastProgress=os.clock()end
    if os.clock()-lastProgress>13 then error('Gunshop navigation stalled')end
    startNoclip()
    motion.travel(rootPart,destination,state.speed,'combatShop')
    RunService.Heartbeat:Wait()
   end
   stopMotion()
   if not combat.buying then error('Canceled') end
   local rootPart=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
   if not rootPart or (rootPart.Position-shopPart.Position).Magnitude>15 then error('Not in shop range')end
   local okBuy,approved,result=state.work.nativeCall(10,'purchaseTool',network.InvokeServer,'purchaseTool',{
     itemType='Tool',shopName='GunShop',categoryName='Medium',itemName='SPAS-12'})
   if not okBuy or approved~=true then error('Server declined SPAS-12 purchase: '..tostring(result))end
   for _=1,10 do if toolIdNamed('SPAS-12') then return end;task.wait(.2)end
   error('SPAS-12 purchase not visible in inventory')
  end)
  combat.buying=false;stopMotion()
  if ok then combat.spasStatus='SPAS-12 purchased (inventory confirmed)'
  else combat.spasStatus='Purchase failed: '..tostring(reason);note('WARN',combat.spasStatus)end
 end)
end
local function isCombatAllowed(target)return combat.v30.eligible(target,combat.v30.settings.aim,true)~=nil end
function combat.updateSpas()
  if not combat.loopbring or not combat.autoSpas or state.work.lease or state.running or af.running or bank.running or bag.selling or (state.shop and state.shop.running) or not characterAlive() then
    combat.cancelSpasFire()
    if state.running or af.running or bank.running or bag.selling then combat.spasStatus='Paused during farming' end
    return
  end
  local target=selectCombatTarget()
  local ch=target and target.Character
  local head=ch and (ch:FindFirstChild('Head_Hitbox',true) or ch:FindFirstChild('Head'))
  if not head then combat.cancelSpasFire();combat.spasStatus='No target in current FOV/range';return end
  if not isCombatAllowed(target) then combat.cancelSpasFire();combat.spasStatus='Target protected or in known safe zone';return end
  if combat.buying then combat.cancelSpasFire();combat.spasStatus='Purchasing SPAS-12';return end
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
      if not tool and combat.spasStatus=='SPAS-12 not owned' then
        if os.clock()-(combat.lastPurchaseAttempt or 0)>60 then
          combat.lastPurchaseAttempt=os.clock()
          combat.buySpas()
        end
      elseif not tool and os.clock()-combat.lastWarn>20 then
        combat.lastWarn=os.clock();note('WARN','Loopbring: '..combat.spasStatus)
      end
    end
  end
  if not tool then return end
  combat.spasTool=tool
  local ammo=tonumber(tool.ammo or (tool.toolState and tool.toolState.ammo))
  if ammo and ammo<=0 then
    combat.cancelSpasFire();combat.spasStatus='Empty magazine; reload needed'
    local reload=tool.Reload or tool.reload
    if type(reload)=='function' then pcall(reload,tool)end
    return
  end
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
  if combat.silent or combat.loopbring and combat.autoSpas or combat.v30.settings.projectile.tracers or combat.v30.settings.projectile.impacts then combat.v30.install()else combat.v30.uninstall()end
  if not combat.loopbring and next(combat.clones)then discardClones();combat.cancelSpasFire()end
  if combat.hitbox then applyHitboxes() end
  if combat.loopbring then updateLoopbring() end
  combat.updateSpas()
  if combat.silent or combat.hitbox or combat.loopbring then
    combat.currentTarget=selectCombatTarget()
  else combat.currentTarget=nil end
end))
local function endCombat()
  combat.silent=false;combat.hitbox=false;combat.loopbring=false;combat.headAssist=false
  combat.cancelSpasFire();combat.buying=false;restoreHitboxes();discardClones();combat.v30.uninstall();combat.v30.clearRender()
end


-- One renderer; pooled native GUI lines and Highlights, no Drawing API dependency.
do
 local v=combat.v30
 function v.make(class,parent,props)
  local o=Instance.new(class);for k,x in pairs(props or {})do o[k]=x end;o.Parent=parent;return o
 end
 function v.overlay()
  if v.gui and v.gui.Parent then return v.gui end
  local parent=state.gui and state.gui.Parent or player:FindFirstChildOfClass('PlayerGui')
  if not parent then return end
  v.gui=v.make('ScreenGui',parent,{Name='REDLINECombatOverlay',IgnoreGuiInset=true,ResetOnSpawn=false,DisplayOrder=50,ZIndexBehavior=Enum.ZIndexBehavior.Sibling})
  return v.gui
 end
 function v.removeRecord(id)
  local r=v.records[id];if not r then return end
  if r.jointConnection then r.jointConnection:Disconnect()end
  if r.frame then r.frame:Destroy()end;if r.highlight then r.highlight:Destroy()end
  v.records[id]=nil
 end
 function v.clearESP()local ids={};for id in pairs(v.records)do table.insert(ids,id)end;for _,id in ipairs(ids)do v.removeRecord(id)end end
 function v.clearRender()
  v.clearESP();if v.gui then v.gui:Destroy()end;v.gui=nil;v.fov=nil;v.marker=nil;v.effects={};v.projectiles={};v.shotCount=0
 end
 function v.label(parent)
  return v.make('TextLabel',parent,{BackgroundTransparency=1,BorderSizePixel=0,Text='',Font=Enum.Font.GothamMedium,TextSize=12,TextColor3=Color3.new(1,1,1),TextStrokeTransparency=.25,Size=UDim2.fromOffset(220,18),Visible=false})
 end
 function v.record(p,ch)
  local r=v.records[p.UserId];if r and r.character~=ch then v.removeRecord(p.UserId);r=nil end
  if r then return r end
  r={character=ch,lines={},labels={},joints={},visibilityAt=0};v.records[p.UserId]=r
  r.frame=v.make('Frame',v.overlay(),{Name='Player_'..p.UserId,Size=UDim2.fromScale(1,1),BackgroundTransparency=1})
  r.fill=v.make('Frame',r.frame,{BorderSizePixel=0,Visible=false})
  r.healthBg=v.make('Frame',r.frame,{BorderSizePixel=0,Visible=false});r.health=v.make('Frame',r.frame,{BorderSizePixel=0,Visible=false})
  r.avatar=v.make('ImageLabel',r.frame,{BackgroundTransparency=1,BorderSizePixel=0,Visible=false});r.avatarStroke=v.make('UIStroke',r.avatar,{Thickness=1})
  for _,key in ipairs({'username','displayName','health','distance','status','arrowDistance'})do r.labels[key]=v.label(r.frame)end
  for _,j in ipairs(ch:GetDescendants())do if j:IsA('Motor6D')then table.insert(r.joints,j)end end
  r.jointConnection=ch.DescendantAdded:Connect(function(j)if j:IsA('Motor6D')and not table.find(r.joints,j)then table.insert(r.joints,j)end end)
  return r
 end
 function v.line(r,key,a,b,width,c,outline,oc,ow)
  local pair=r.lines[key]
  if not pair then pair={v.make('Frame',r.frame,{AnchorPoint=Vector2.new(.5,.5),BorderSizePixel=0,ZIndex=1}),v.make('Frame',r.frame,{AnchorPoint=Vector2.new(.5,.5),BorderSizePixel=0,ZIndex=2})};r.lines[key]=pair end
  local delta=b-a;local length=delta.Magnitude
  if length~=length or length<.1 or length>30000 then pair[1].Visible=false;pair[2].Visible=false;return end
  for i,o in ipairs(pair)do
   o.Visible=i==2 or outline;o.Position=UDim2.fromOffset((a.X+b.X)/2,(a.Y+b.Y)/2);o.Size=UDim2.fromOffset(length,width+(i==1 and (ow or 1)*2 or 0));o.Rotation=math.deg(math.atan2(delta.Y,delta.X))
   local color=i==1 and oc or c;o.BackgroundColor3=v.rgb(color);o.BackgroundTransparency=1-color.a
  end
 end
 function v.hide(r)
  for _,pair in pairs(r.lines)do pair[1].Visible=false;pair[2].Visible=false end
  for _,label in pairs(r.labels)do label.Visible=false end
  r.fill.Visible=false;r.health.Visible=false;r.healthBg.Visible=false;r.avatar.Visible=false
  if r.highlight then r.highlight.Enabled=false end
 end
 function v.boundsFor(ch,cam)
  -- Bounding box is derived from actual body parts, excluding accessories and expanded hitboxes.
  local rootPart=ch:FindFirstChild('HumanoidRootPart');if not rootPart then return end
  local cf=rootPart.CFrame;local low=Vector3.new(math.huge,math.huge,math.huge);local high=Vector3.new(-math.huge,-math.huge,-math.huge)
  for _,part in ipairs(ch:GetChildren())do if part:IsA('BasePart')and not part.Name:find('Hitbox',1,true)then
   for x=-1,1,2 do for y=-1,1,2 do for z=-1,1,2 do
    local p=cf:PointToObjectSpace(part.CFrame:PointToWorldSpace(Vector3.new(x*part.Size.X/2,y*part.Size.Y/2,z*part.Size.Z/2)))
    low=Vector3.new(math.min(low.X,p.X),math.min(low.Y,p.Y),math.min(low.Z,p.Z));high=Vector3.new(math.max(high.X,p.X),math.max(high.Y,p.Y),math.max(high.Z,p.Z))
   end end end
  end end
  if low.X==math.huge then return end
  local corners={};local minX,minY,maxX,maxY=math.huge,math.huge,-math.huge,-math.huge
  for x=0,1 do for y=0,1 do for z=0,1 do
   local p=cam:WorldToViewportPoint(cf:PointToWorldSpace(Vector3.new(x==0 and low.X or high.X,y==0 and low.Y or high.Y,z==0 and low.Z or high.Z)))
   if p.Z<=.1 then return end
   table.insert(corners,Vector2.new(p.X,p.Y));minX=math.min(minX,p.X);minY=math.min(minY,p.Y);maxX=math.max(maxX,p.X);maxY=math.max(maxY,p.Y)
  end end end
  return {x=minX,y=minY,w=maxX-minX,h=maxY-minY,corners=corners}
 end
 function v.thumbnail(p)
  local cached=v.thumbs[p.UserId]
  if cached then return cached.image end
  cached={};v.thumbs[p.UserId]=cached
  task.spawn(function()
   local ok,url=pcall(Players.GetUserThumbnailAsync,Players,p.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size100x100)
   if ok and p.Parent and not state.closed then cached.image=url end
  end)
 end
 function v.textAt(label,text,x,y,size,c,width)
  label.Text=text;label.Position=UDim2.fromOffset(x,y);label.Size=UDim2.fromOffset(width or 220,size+5);label.TextSize=size;label.TextColor3=v.rgb(c);label.TextTransparency=1-c.a;label.Visible=true
 end
 function v.drawPlayer(p,d,r,cam)
  local s=v.settings.esp;v.hide(r)
  local now=os.clock()
  if now>=r.visibilityAt then r.visibilityAt=now+1/v.settings.advanced.infoHz;r.visible=v.visible(d.root.Position,d.character)end
  if s.visibleOnly and not r.visible or not s.occluded and not r.visible then return end
  local position,on=cam:WorldToViewportPoint(d.root.Position);local view=cam.ViewportSize
  if not on or position.Z<=0 then
   if s.arrows and d.distance<=s.arrowMax then
    local localPoint=cam.CFrame:PointToObjectSpace(d.root.Position);local dx,dy=localPoint.X,-localPoint.Y
    if localPoint.Z>=0 then dy=math.abs(dy)+math.max(1,math.abs(localPoint.Z))end
    local length=math.sqrt(dx*dx+dy*dy);if length<.001 then dx,dy,length=0,-1,1 end
    local dir=Vector2.new(dx/length,dy/length);local padding=s.arrowPadding+s.arrowSize;local half=Vector2.new(math.max(1,view.X/2-padding),math.max(1,view.Y/2-padding))
    local factor=math.min(half.X/math.max(.001,math.abs(dir.X)),half.Y/math.max(.001,math.abs(dir.Y)));local tip=view*.5+dir*factor;local side=Vector2.new(-dir.Y,dir.X)
    local a=tip-dir*s.arrowSize+side*s.arrowSize*.55;local b=tip-dir*s.arrowSize-side*s.arrowSize*.55
    v.line(r,'arrow1',a,tip,2,s.arrowColor,false,s.arrowColor);v.line(r,'arrow2',b,tip,2,s.arrowColor,false,s.arrowColor);v.line(r,'arrow3',a,b,2,s.arrowColor,false,s.arrowColor)
    if s.arrowDistance then v.textAt(r.labels.arrowDistance,math.floor(d.distance)..' st',tip.X-40,tip.Y+8,11,s.arrowColor,80)end
   end
   return
  end
  local box=v.boundsFor(d.character,cam);if not box then return end
  local x,y,w,h=box.x,box.y,box.w,box.h
  if w<=0 or h<=0 or w>view.X*4 or h>view.Y*4 then return end
  if s.boxEnabled and s.box~='Off'then
   local points={Vector2.new(x,y),Vector2.new(x+w,y),Vector2.new(x+w,y+h),Vector2.new(x,y+h)}
   if s.box=='3D'then
    local edges={{1,2},{1,3},{1,5},{2,4},{2,6},{3,4},{3,7},{4,8},{5,6},{5,7},{6,8},{7,8}}
    for i,e in ipairs(edges)do v.line(r,'box'..i,box.corners[e[1]],box.corners[e[2]],s.boxThickness,s.boxColor,s.boxOutline,s.boxOutlineColor,s.boxOutlineThickness)end
   elseif s.box=='Corner'then
    for i,a in ipairs(points)do local b=points[i%4+1];local c=points[(i+2)%4+1];v.line(r,'box'..i,a,a+(b-a)*s.corner,s.boxThickness,s.boxColor,s.boxOutline,s.boxOutlineColor,s.boxOutlineThickness);v.line(r,'corner'..i,a,a+(c-a)*s.corner,s.boxThickness,s.boxColor,s.boxOutline,s.boxOutlineColor,s.boxOutlineThickness)end
   else for i,a in ipairs(points)do v.line(r,'box'..i,a,points[i%4+1],s.boxThickness,s.boxColor,s.boxOutline,s.boxOutlineColor,s.boxOutlineThickness)end end
   if s.boxFill and s.box~='3D'then r.fill.Visible=true;r.fill.Position=UDim2.fromOffset(x,y);r.fill.Size=UDim2.fromOffset(w,h);r.fill.BackgroundColor3=v.rgb(s.boxFillColor);r.fill.BackgroundTransparency=1-s.boxFillColor.a end
  end
  if s.skeleton and d.distance<=s.skeletonDistance then
   for i=#r.joints,1,-1 do local j=r.joints[i];if not j.Parent then table.remove(r.joints,i)elseif j.Part0 and j.Part1 and j.Part0:IsDescendantOf(d.character)and j.Part1:IsDescendantOf(d.character)then
    local a,ao=cam:WorldToViewportPoint(j.Part0.Position);local b,bo=cam:WorldToViewportPoint(j.Part1.Position)
    if ao and bo and a.Z>0 and b.Z>0 then v.line(r,'joint'..i,Vector2.new(a.X,a.Y),Vector2.new(b.X,b.Y),s.skeletonThickness,s.skeletonColor,s.skeletonOutline,s.skeletonOutlineColor,1)end
   end end
  end
  if s.chams and d.distance<=s.chamsDistance then
   if not r.highlight then r.highlight=v.make('Highlight',v.gui,{Name='REDLINEChams',Adornee=d.character})end
   r.highlight.Enabled=true;r.highlight.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
   local c=s.chamsVisibilityColors and (r.visible and s.visibleColor or s.occludedColor)or s.chamsFill
   r.highlight.FillColor=s.chamsTeam and p.Team and p.Team.TeamColor.Color or v.rgb(c)
   r.highlight.FillTransparency=1-c.a;r.highlight.OutlineColor=v.rgb(s.chamsOutline);r.highlight.OutlineTransparency=1-s.chamsOutline.a
  end
  local ratio=math.clamp(d.health/math.max(1,d.maxHealth),0,1)
  local hc=ratio>.6 and s.healthyColor or ratio>.25 and s.damagedColor or s.criticalColor
  if s.healthGradient then local a,b,t;if ratio>.5 then a,b,t=s.damagedColor,s.healthyColor,(ratio-.5)*2 else a,b,t=s.criticalColor,s.damagedColor,ratio*2 end;local c=v.rgb(a):Lerp(v.rgb(b),t);hc={r=c.R*255,g=c.G*255,b=c.B*255,a=a.a+(b.a-a.a)*t}end
  if s.healthBar then
   local bottom=s.healthPosition=='Bottom';local hx=s.healthPosition=='Right'and x+w+4 or bottom and x or x-s.healthThickness-4;local hy=bottom and y+h+4 or y
   r.healthBg.Visible=true;r.healthBg.Position=UDim2.fromOffset(hx,hy);r.healthBg.Size=UDim2.fromOffset(bottom and w or s.healthThickness,bottom and s.healthThickness or h);r.healthBg.BackgroundColor3=v.rgb(s.healthBackground);r.healthBg.BackgroundTransparency=1-s.healthBackground.a
   r.health.Visible=true;r.health.Position=UDim2.fromOffset(hx,bottom and hy or hy+h*(1-ratio));r.health.Size=UDim2.fromOffset(bottom and w*ratio or s.healthThickness,bottom and s.healthThickness or h*ratio);r.health.BackgroundColor3=v.rgb(hc);r.health.BackgroundTransparency=1-hc.a
  end
  local scale=s.scale and math.clamp(1-(d.distance/5000),.72,1)or 1;local size=math.max(9,math.floor(s.textSize*scale));local top=y-4
  if s.displayName then top=top-size-5;v.textAt(r.labels.displayName,p.DisplayName,x+w/2-110,top,size,s.displayNameColor)end
  if s.username then top=top-size-5;v.textAt(r.labels.username,'@'..p.Name,x+w/2-110,top,size,s.usernameColor)end
  if s.avatar then
   r.avatar.Image=v.thumbnail(p)or '';r.avatar.Visible=true;r.avatar.Size=UDim2.fromOffset(s.avatarSize,s.avatarSize)
   r.avatar.Position=UDim2.fromOffset(s.avatarPosition=='Left'and x-s.avatarSize-12 or x+w/2-s.avatarSize/2,s.avatarPosition=='Left'and y or top-s.avatarSize-4)
   r.avatar.ImageTransparency=1-s.avatarOpacity;r.avatarStroke.Enabled=s.avatarBorder;r.avatarStroke.Color=v.rgb(s.avatarBorderColor);r.avatarStroke.Transparency=1-s.avatarBorderColor.a
  end
  local bottom=y+h+(s.healthBar and s.healthPosition=='Bottom'and s.healthThickness+6 or 3)
  if s.healthNumber or s.healthPercent then local parts={};if s.healthNumber then table.insert(parts,math.floor(d.health)..' / '..math.floor(d.maxHealth))end;if s.healthPercent then table.insert(parts,math.floor(ratio*100)..'%')end;v.textAt(r.labels.health,table.concat(parts,'  '),x+w/2-110,bottom,s.healthTextSize,s.healthTextColor);bottom=bottom+s.healthTextSize+5 end
  if s.distanceLabel and d.distance<=s.distanceMax then v.textAt(r.labels.distance,string.format('%.'..math.floor(s.distancePrecision)..'f studs',d.distance),x+w/2-110,bottom,s.distanceSize,s.distanceColor);bottom=bottom+s.distanceSize+5 end
  local status={};if s.teamLabel then table.insert(status,d.team)end;if s.aliveLabel then table.insert(status,d.alive and 'Alive'or 'Dead')end;if s.knockedLabel and d.knocked then table.insert(status,'Knocked')end;if s.safeLabel and d.safe then table.insert(status,'Protected')end
  if #status>0 then v.textAt(r.labels.status,table.concat(status,' · '),x+w/2-110,bottom,size,s.statusColor)end
 end
 function v.drawFov()
  local s=v.settings.fov;local gui=v.overlay();if not gui then return end
  if not v.fov then
   local f=v.make('Frame',gui,{Name='FOV',AnchorPoint=Vector2.new(.5,.5),BorderSizePixel=0});v.make('UICorner',f,{CornerRadius=UDim.new(1,0)})
   local outline=v.make('Frame',f,{Name='Outline',AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(.5,.5),Size=UDim2.fromScale(1,1),BackgroundTransparency=1});v.make('UICorner',outline,{CornerRadius=UDim.new(1,0)})
   v.fov={frame=f,stroke=v.make('UIStroke',f,{}),outline=v.make('UIStroke',outline,{Color=Color3.new(0,0,0)})}
   v.marker={label=v.label(gui),lines={},frame=v.make('Frame',gui,{Size=UDim2.fromScale(1,1),BackgroundTransparency=1})}
  end
  local f=v.fov;local center=v.center();f.frame.Visible=s.show and combat.silent;f.frame.Position=UDim2.fromOffset(center.X,center.Y);f.frame.Size=UDim2.fromOffset(s.radius*2,s.radius*2)
  f.frame.BackgroundColor3=v.rgb(s.fillColor);f.frame.BackgroundTransparency=s.fill and 1-s.fillColor.a or 1
  f.stroke.Color=s.rainbow and Color3.fromHSV((os.clock()*s.rainbowSpeed)%1,.8,1)or v.rgb(s.color);f.stroke.Thickness=s.thickness;f.stroke.Transparency=1-s.color.a
  f.outline.Enabled=s.outline;f.outline.Thickness=1;f.outline.Parent.Size=UDim2.new(1,s.thickness+2,1,s.thickness+2);f.outline.Transparency=1-s.color.a
  local m=v.marker;for _,pair in pairs(m.lines)do pair[1].Visible=false;pair[2].Visible=false end;m.label.Visible=false
  if combat.silent and v.target then
   local d=v.candidate(v.target.player);if not d then v.target=nil;combat.currentTarget=nil;return end
   local p=Vector2.new(d.screen.X,d.screen.Y)
   if v.settings.aim.indicator then v.line(m,'cross1',p-Vector2.new(5,0),p+Vector2.new(5,0),1.5,s.color,true,{r=0,g=0,b=0,a=1});v.line(m,'cross2',p-Vector2.new(0,5),p+Vector2.new(0,5),1.5,s.color,true,{r=0,g=0,b=0,a=1})end
   if v.settings.aim.information then v.textAt(m.label,d.player.Name..' · '..math.floor(d.health)..' HP · '..math.floor(d.distance)..' st',p.X-110,p.Y+12,11,s.color)end
  end
 end
 v.projectiles={}
 function v.observeShot(tool)v.shotCount=(v.shotCount or 0)+1;v.lastWeapon=tool.name end
 function v.drawProjectiles(cam)
  local opts=v.settings.projectile
  if not opts.tracers and not opts.impacts then
   for _,e in ipairs(v.effects)do e.frame:Destroy()end;v.effects={};v.projectiles={};return
  end
  local api=liveModule('ClientProjectiles');local list
  if api and type(api.GetProjectiles)=='function'then local ok,t=pcall(api.GetProjectiles);if ok and type(t)=='table'then list=t end end
  local now=os.clock();local seen={};local count=0
  for id,proj in pairs(list or {})do
   if type(proj)=='table'and proj.ownerId==player.UserId and typeof(proj.currentPos)=='Vector3'and count<80 then
    count=count+1;seen[id]=true;local old=v.projectiles[id]
    if old and (proj.currentPos-old.pos).Magnitude>.1 then
     local e={a=old.pos,b=proj.currentPos,untilTime=now+opts.lifetime,lines={},frame=v.make('Frame',v.overlay(),{Size=UDim2.fromScale(1,1),BackgroundTransparency=1})}
     if opts.tracers then table.insert(v.effects,e)else e.frame:Destroy()end
    end
    v.projectiles[id]={pos=proj.currentPos,object=proj}
   end
  end
  for id,old in pairs(v.projectiles)do if not seen[id]then
   -- Removal may be impact, rejection, or lifetime expiry. Do not call it a hit.
   if opts.impacts then table.insert(v.effects,{a=old.pos,b=old.pos,endpoint=true,untilTime=now+opts.lifetime,lines={},frame=v.make('Frame',v.overlay(),{Size=UDim2.fromScale(1,1),BackgroundTransparency=1})})end
   v.projectiles[id]=nil
  end end
  while #v.effects>240 do local e=table.remove(v.effects,1);e.frame:Destroy()end
  for i=#v.effects,1,-1 do
   local e=v.effects[i]
   if now>=e.untilTime then e.frame:Destroy();table.remove(v.effects,i)
   else
    local a,ao=cam:WorldToViewportPoint(e.a);local b,bo=cam:WorldToViewportPoint(e.b);e.frame.Visible=ao and bo and a.Z>0 and b.Z>0
    if e.frame.Visible then local x,y=Vector2.new(a.X,a.Y),Vector2.new(b.X,b.Y)
     if e.endpoint then v.line(e,'end1',x-Vector2.new(3,3),x+Vector2.new(3,3),opts.thickness,opts.impactColor,false,opts.impactColor);v.line(e,'end2',x-Vector2.new(3,-3),x+Vector2.new(3,-3),opts.thickness,opts.impactColor,false,opts.impactColor)
     else v.line(e,'trace',x,y,opts.thickness,opts.color,false,opts.color)end
    end
   end
  end
 end
 function v.inspectMaterial()
  if not v.settings.projectile.material then v.materialInfo='';return end
  local cam=workspace.CurrentCamera;if not cam then return end
  local params=RaycastParams.new();params.FilterType=Enum.RaycastFilterType.Exclude;params.FilterDescendantsInstances={player.Character};params.IgnoreWater=false
  local ok,hit=pcall(workspace.Raycast,workspace,cam.CFrame.Position,cam.CFrame.LookVector*1000,params)
  if not ok then v.materialInfo='Material query unavailable';return end
  if not hit then v.materialInfo='No surface in inspection range';return end
  local info=tostring(hit.Material):gsub('Enum.Material.','')
  if hit.Instance==workspace.Terrain then v.materialInfo=info..' · terrain penetration unsupported';return end
  if hit.Instance and hit.Instance:GetAttribute('impenetrable')then v.materialInfo=info..' · marked impenetrable';return end
  local effects=liveModule('ClientEffects');local impacts=effects and effects.ProjectileImpacts
  if impacts and type(impacts.GetPenetrationThickness)=='function'then
   local yes,thickness=pcall(impacts.GetPenetrationThickness,hit)
   if yes and type(thickness)=='number'then info=info..' · native material limit '..thickness..' st'else info=info..' · native limit unavailable'end
  else info=info..' · material rules unavailable'end
  v.materialInfo=info..' (not a penetration guarantee)'
 end
 function v.render()
  if state.closed then return end
  local now=os.clock();local settings=v.settings;local hz=math.min(settings.advanced.hz,settings.advanced.performance=='Performance'and 30 or settings.advanced.performance=='Balanced'and 60 or 120)
  if now-v.lastDraw<1/hz then return end;v.lastDraw=now
  local cam=workspace.CurrentCamera;if not cam then return end
  if combat.silent then combat.currentTarget=v.select()end
  v.drawFov();v.drawProjectiles(cam)
  if now>=(v.nextMaterial or 0)then v.nextMaterial=now+.3;v.inspectMaterial()end
  if not settings.esp.enabled then if next(v.records)then v.clearESP()end;return end
  local seen={};local count=0
  for _,p in ipairs(Players:GetPlayers())do if p~=player then
   local d=v.eligible(p,settings.esp,false)
   if d and count<settings.advanced.maxPlayers then count=count+1;seen[p.UserId]=true;v.drawPlayer(p,d,v.record(p,d.character),cam)end
  end end
  local remove={};for id in pairs(v.records)do if not seen[id]then table.insert(remove,id)end end;for _,id in ipairs(remove)do v.removeRecord(id)end
 end
 table.insert(state.connected,RunService.RenderStepped:Connect(function()
  local ok,why=pcall(v.render);if not ok and os.clock()-(v.lastErrorAt or -10)>5 then v.lastErrorAt=os.clock();note('WARN','Combat overlay: '..tostring(why))end
 end))
 table.insert(state.connected,Players.PlayerRemoving:Connect(function(p)v.removeRecord(p.UserId);v.thumbs[p.UserId]=nil;combat.friendCache[p.UserId]=nil;combat.selectedTargets[p.UserId]=nil;if v.target and v.target.player==p then v.target=nil;combat.currentTarget=nil end;v.restoreHBE()end))
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
    if not af.seen[crate] and crate.PrimaryPart and (not af.retryAt or (af.retryAt[crate]or 0)<=os.clock())then
      local d=r and (crate.PrimaryPart.Position-r.Position).Magnitude or 0
      if d<dist then best=crate;dist=d end
    end
  end
  return best
end
-- Track the moving crate all the way down. Recompute its position each heartbeat.
local function afFlight(crate,token,untilGrounded)
  if crate and crate.PrimaryPart then local ok,why=state.recovery.smart(crate.PrimaryPart.Position);if not ok then return false,why end end
  local lastProgress=os.clock()
  local priorDist=math.huge
  local flightDeadline=os.clock()+180
  while af.running and af.token==token and not state.closed and crate.Parent and crate.PrimaryPart and os.clock()<flightDeadline do
    af.lastPos=crate.PrimaryPart.Position
    if bag.selling then stopMotion(false,'airdrop');repeat task.wait(.2) until not bag.selling or not af.running;lastProgress=os.clock();priorDist=math.huge end
    if state.running then stopMotion(false,'airdrop');return false,'Quest running' end
    if not characterAlive() then
      stopMotion(false,'airdrop');afSetStatus('Waiting to respawn')
      if not state.recovery.wait(state.work.lease)then return false,'Respawn not confirmed'end
      priorDist=math.huge;lastProgress=os.clock()
    else
      local r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
      if not r then task.wait(.25) else
        local grounded=crate:GetAttribute('isGrounded')==true
        -- Stop chasing the crate once anybody opened it; collect scattered drops instead.
        if crate:GetAttribute('isLooted')==true then stopMotion(false,'airdrop');return true end
        local target=crate.PrimaryPart.Position+Vector3.new(0,3,0)
        local diff=target-r.Position
        local allowed,why,corrected=motion.watchTravel(r,target)
        if not allowed then stopMotion(false,'airdrop');return false,why end
        if corrected then lastProgress=os.clock();priorDist=math.huge;flightDeadline=os.clock()+180 end
        local close=diff.Magnitude<7
        if close and (not untilGrounded or grounded) then motion.arrived();stopMotion(false,'airdrop');return true end
        startNoclip()
        if close then
          motion.hold(r)
        else
          motion.travel(r,target,state.speed,'airdrop')
        end
        RunService.Heartbeat:Wait()
        local current=(target-r.Position).Magnitude
        if current+3<priorDist or (untilGrounded and close) then
          priorDist=current;lastProgress=os.clock()
        end
        if not state.work.lease.travelPlan and os.clock()-lastProgress>17 then stopMotion(false,'airdrop');return false,'Tracking crate stalled' end
      end
    end
  end
  stopMotion(false,'airdrop');return false,'Crate disappeared'
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
function af.collectFloorOnce(cratePos,baseline,token)
  local inspected,done={},{}
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
        if not baseline[id] and not done[id] and not inspected[id] and not af.knownFloorIds[id] then
          local name,gizmo,err=af.readLoot(model)
          if name and gizmo then
            inspected[id]=true;lastDiscovery=os.clock()
            if baseLootName(name)=='golden barrett m82' then af.goldenSeen[id]=true end
            if filterMatches(name) then
              local isGem=false
              for _,gem in ipairs({'Ruby','Emerald','Sapphire','Diamond','Amethyst'}) do
                if name:find(gem,1,true) then isGem=true;break end
              end
              local sellValue=0
              if isGem then
                local objects=liveModule('Objects')
                if objects and type(objects.GetDataProperty)=='function' then
                  local read,value=pcall(objects.GetDataProperty,name,'sellValue')
                  if read and type(value)=='number' then sellValue=value end
                end
              end
              table.insert(candidates,{id=id,name=name,model=model,gizmo=gizmo,
                priority=state.globalLoot.priority(name),value=sellValue})
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
        if done[id] or not entry.model.Parent or not entry.model.PrimaryPart or entry.model:GetAttribute('isDestroyed')==true
           or not filterMatches(entry.name) then
          af.pending[id]=nil
        else table.insert(list,entry) end
      end
      table.sort(list,function(a,b)
        if a.priority~=b.priority then return a.priority<b.priority end
        if a.value~=b.value then return a.value>b.value end
        local root=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
        local pos=root and root.Position or cratePos
        return (a.model.PrimaryPart.Position-pos).Magnitude<(b.model.PrimaryPart.Position-pos).Magnitude
      end)
      if #list>0 then
        local entry=list[1];afSetStatus('Collecting '..entry.name)
        local deferredForGolden=false
        local root=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
        if root and entry.model.PrimaryPart and (root.Position-entry.model.PrimaryPart.Position).Magnitude>8 then
          -- Ground loot uses one CFrame tween per destination after a crate opens.
          local destination=entry.model.PrimaryPart.Position+Vector3.new(0,2,0)
          local before=os.clock();local lastDist=math.huge;local changed=os.clock()
          local lastGoldenCheck=0
          while af.running and af.token==token and characterAlive() and entry.model.Parent and entry.model.PrimaryPart
            and (root.Position-destination).Magnitude>7 and os.clock()-before<22 do
            -- Preempt lower-priority travel if a selected Golden Barrett appears mid-route.
            if entry.priority>0 and os.clock()-lastGoldenCheck>=.35 then
              lastGoldenCheck=os.clock()
              for candidateId,candidateModel in pairs(af.groundModels(cratePos,85)) do
                if not baseline[candidateId] and not done[candidateId] then
                  local candidateName=af.readLoot(candidateModel)
                  if candidateName and baseLootName(candidateName)=='golden barrett m82'
                      and filterMatches(candidateName) then
                    deferredForGolden=true;break
                  end
                end
              end
            end
            if deferredForGolden then break end
            local allowed,why,corrected=motion.watchTravel(root,destination)
            if not allowed then return false,why end
            if corrected then before=os.clock();changed=os.clock();lastDist=math.huge;started=os.clock()end
            local diff=destination-root.Position
            if diff.Magnitude+2<lastDist then lastDist=diff.Magnitude;changed=os.clock() end
            if os.clock()-changed>9 then break end
            startNoclip()
            motion.travel(root,destination,state.speed,'airdrop')
            RunService.Heartbeat:Wait()
          end
          if (root.Position-destination).Magnitude<=7 then motion.arrived()end
          stopMotion(false,'airdrop')
        end
        if deferredForGolden then
          afSetStatus('Golden Barrett detected — priority pickup')
          task.wait(.05) -- Keep original lower-priority entry queued for later.
        elseif not filterMatches(entry.name) then
          -- Don't collect an item that was excluded while we were traveling to it.
          done[entry.id]=true;af.pending[entry.id]=nil
        elseif af.running and af.token==token and entry.model.Parent and entry.model.PrimaryPart then
          local r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
          if r and (r.Position-entry.model.PrimaryPart.Position).Magnitude<=11 then
            local full=false
            if entry.model:GetAttribute('gizmoType')=='Lootable' and bag.informationReady then
              local objects=liveModule('Objects')
              if objects and type(objects.GetDataProperty)=='function' then
                local okMass,mass=pcall(objects.GetDataProperty,entry.name,'weight')
                full=okMass and type(mass)=='number' and mass>0 and bag.weight+mass>bag.capacity+.001
              end
            end
            if full then
              afSetStatus('Bag cannot fit '..entry.name..'; waiting for sell')
              af.needsSell=true;state.sellRequested=true
              return false,'Bag sale required; floor target retained for rescan'
            else
            local cannotFit=false
            if entry.model:GetAttribute('gizmoType')=='Lootable' then
              local bagOK=bag.read()
              if bagOK then
                local objects=liveModule('Objects');local weight
                if objects and type(objects.GetDataProperty)=='function' then
                  local got,mass=pcall(objects.GetDataProperty,entry.name,'weight')
                  if got and type(mass)=='number' then weight=mass end
                end
                cannotFit=bag.nearFull or (weight~=nil and weight>bag.freeWeight+.001)
              end
            end
            if cannotFit then
              if bag.value<=0 then return false,'Bag full with no sellable valuables' end
              af.needsSell=true;state.sellRequested=true
              afSetStatus('Bag full / item cannot fit · selling')
              return false,'Bag sale queued; return after selling'
            end
            local ok,err=state.work.nativeCall(10,entry.gizmo,function()
              if type(entry.gizmo.AttemptCollect)~='function' then error('No AttemptCollect') end
              if not af.running or af.token~=token or not state.work.owns('airdrop',token)then error('Canceled')end
              entry.gizmo:AttemptCollect()
            end)
            if not ok then note('WARN','Airdrop '..entry.name..' pickup: '..tostring(err)) end
            task.wait(.24) -- WorldItem/Lootable client rate limiter is 0.2s
            local grabbed=entry.gizmo.isCollected==true or entry.gizmo.gizmoState and entry.gizmo.gizmoState.isCollected==true
            if grabbed then
              picked=picked+1;done[entry.id]=true;af.knownFloorIds[entry.id]=entry.model;af.pending[entry.id]=nil
              if baseLootName(entry.name)=='golden barrett m82' then af.goldenCount=af.goldenCount+1 end
            else
              entry.retries=(entry.retries or 0)+1
              if entry.retries>=3 then
                skipped=skipped+1;done[entry.id]=true;af.pending[entry.id]=nil
                note('WARN','Airdrop loot refused: '..entry.name)
              else task.wait(.24) end
            end
            end -- weight check
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
function af.collectFloor(cratePos,baseline,token)
  if af.sweeping then return false,'Another loot sweep is active' end
  af.sweeping=true
  local ok,result,why=pcall(af.collectFloorOnce,cratePos,baseline,token)
  af.sweeping=false
  if not ok then return false,tostring(result)end
  return result,why
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
      if crate:GetAttribute('isGrounded')~=true or (crate.PrimaryPart.Position-r.Position).Magnitude>10 then return false,'Crate is not grounded in interaction range'end
      local standing,why=state.standingForInteraction();if not standing then return false,why end
      local network=liveModule('Network');local id=crate:GetAttribute('objectId')
      if id==nil or not network or type(network.FireServer)~='function'then return false,'Native airdrop interaction unavailable'end
      local sent,why=state.work.nativeCall(5,crate,network.FireServer,'propInteraction',id,'loot')
      if not sent then return false,why end
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
    afSetStatus('Fresh crate loot detected (opener unverified)')
    return af.collectFloor(pos,baseline,token)
  end
  if not crate.Parent or crate:GetAttribute('isLooted')==true then
    afSetStatus('Crate claimed; scanning floor loot')
    return af.collectFloor(pos,baseline,token)
  end
  return false,'No newly dropped loot; crate may already have been claimed by this account'
end
-- BEGIN_TESTABLE drainQueuedSweeps
-- Watcher coroutines add entries while collectFloor yields; adding keys during a pairs()
-- traversal is undefined in Lua, so iterate a snapshot instead.
function af.drainQueuedSweeps(alive,collect)
  local batch={}
  for watched,pending in pairs(af.queuedSweeps) do batch[#batch+1]={watched,pending} end
  for _,item in ipairs(batch) do
    if not alive() then break end
    -- A watcher may have replaced this entry with newer data; leave that for the next pass.
    if af.queuedSweeps[item[1]]==item[2] then
      af.queuedSweeps[item[1]]=nil
      collect(item[2].position,item[2].baseline)
    end
  end
end
-- END_TESTABLE
local function afStop()
  if state.recovery then state.recovery.cancel('airdrop')end
  af.enabled=false;af.requested=false;af.oneShot=false;af.running=false;af.token=af.token+1
  af.currentCrate=nil;af.pending={};af.queuedSweeps={};af.needsSell=false
  if not (state.bankFarm and (state.bankFarm.autoMode or state.bankFarm.requested))and not bag.selling then state.sellRequested=false;state.bankFarmSellPending=false end
  stopMotion(false,'airdrop');state.collision.sync();afSetStatus('Disabled')
end
local function afStart(oneShot)
  motion.newWorkflow('airdrop')
  if state.closed then return false end
  if oneShot then af.requested=true else af.enabled=true end
  state.collision.sync();afSetStatus('Queued · waiting for eligible airdrop');return true
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

state.shopState={running=false,token=0,status='Ready'}
state.shop=state.shopState
local function openGunshop()
 if state.work.lease or state.shopState.running then warning('Stop navigation before opening Gunshop');return end
 state.shopState.running=true;state.shopState.token=state.shopState.token+1;local token=state.shopState.token
 state.work.launch('shop',token,function()
  local ok,why=pcall(function()
   local npc,reason=state.shopInteraction.approach();if not npc then error(reason)end
   local opened,err=state.shopInteraction.open(npc);if not opened then error(err)end
   local option=state.shopInteraction.findOption(state.shopInteraction.options(npc),'browse');if not option then error('Native Browse Shop option unavailable')end
   state.camera.release(state.work.lease)
   local called,result=state.work.nativeCall(10,option,option.callback);if not called or result==false then error('Native Browse Shop request refused')end
   local shops=liveModule('ClientGameShops');local observed=false;local deadline=os.clock()+8
   repeat
    if not state.npcActive(token)then error('Gunshop canceled')end
    if shops and type(shops.InShop)=='function'then local yes,v=pcall(shops.InShop);observed=yes and v==true end
    if observed then break end;task.wait(.15)
   until os.clock()>=deadline
   if not observed then error('Browse Shop returned; actual shop interface not observed')end
   state.shopState.status='Gunshop opened';state.quest.dialogue=nil
  end)
  if state.camera.current then state.camera.release(state.work.lease)end
  if not ok then state.shopState.status='Failed: '..tostring(why);warning(state.shopState.status)end
 end)
end

-- v23 bank farm: separate from the verified nine-step tutorial.
local bankFarm={running=false,token=0,status='Idle',selected={Regular=true,Silver=true,Gold=true,Sapphire=true,Ruby=true,Emerald=true,Amethyst=true,Diamond=true},
  unknownPolicy='allow_all',traceVault=true,observerDirty=true,collectSmall=true,skipGold=false,skipSilver=false,currentVault='Unknown',lastObserved=0,lastDoor=nil,lastNotified={},looted=0,lastError=''}
state.bankFarm=bankFarm
if configSaved then
 if configSaved.bankUnknownPolicy=='wait' or configSaved.bankUnknownPolicy=='allow_all' then bankFarm.unknownPolicy=configSaved.bankUnknownPolicy end
 if type(configSaved.bankVaults)=='table' then
  for n,v in pairs(configSaved.bankVaults) do if bankFarm.selected[n]~=nil and type(v)=='boolean' then bankFarm.selected[n]=v end end
 end
 for k,field in pairs({collectSmall='bankCollectSmall',skipGold='bankSkipGold',skipSilver='bankSkipSilver'}) do
  if type(configSaved[field])=='boolean' then bankFarm[k]=configSaved[field] end
 end
end
local bankVaultNames={Regular=true,Silver=true,Gold=true,Sapphire=true,Ruby=true,Emerald=true,Amethyst=true,Diamond=true}
local function normalizeVault(value)
 if type(value)~='string' then return nil end
 local lower=value:lower()
 for name in pairs(bankVaultNames) do if lower==name:lower() or lower==name:lower()..' vault' then return name end end
 if lower=='basic' or lower=='normal' or lower=='common' then return 'Regular' end
 return nil
end
-- Uses the game's standard, server-validated shop purchase route; never forges ownership.
local function buyFromGunShop(name,category,flyPoint)
 if localNamedItem(name) and (name~='C4'or bank.c4Ready())then return true end
 local shops=liveModule('GameShops')
 local util=liveModule('GameShopUtil')
 local net=liveModule('Network')
 if not shops or not util or not net or type(net.InvokeServer)~='function'
   or type(util.GetClosestShopPart)~='function' or type(shops.GetCategoryData)~='function' then
   return false,'Native gunshop modules unavailable'
 end
 local ok,data=pcall(shops.GetCategoryData,'GunShop',category)
 if not ok or type(data)~='table' or type(data.data)~='table' or not data.data[name] then
   return false,'Gunshop catalog does not offer '..name..' in '..category
 end
 local okPart,shopPart=pcall(util.GetClosestShopPart,player,'GunShop')
 if not okPart or not shopPart or not shopPart:IsA('BasePart') then
   return false,'No gunshop interaction found'
 end
 local arrived,msg=pcall(flyPoint,shopPart.Position+Vector3.new(0,2,0),'Traveling to gunshop')
 if not arrived then return false,'Shop navigation: '..tostring(msg) end
 local lease=state.work.lease
 if not lease or motion.callers[coroutine.running()]~=lease or not motion.ownerActive(lease.owner)then return false,'Canceled'end
 if name=='C4'and bank.isOpen(bank.findDoor())then return true,'Vault already open'end
 local payload={itemType='Tool',shopName='GunShop',categoryName=category,itemName=name}
 local called,result,detail=state.work.nativeCall(10,'purchaseTool',net.InvokeServer,'purchaseTool',payload)
 if not called then return false,'Native server purchase request failed: '..tostring(result)end
 if result~=true then return false,'Server declined purchase: '..tostring(detail)end
 for _=1,10 do
  if not motion.ownerActive(lease.owner)then return false,'Canceled'end
  if localNamedItem(name)and (name~='C4'or bank.c4Ready())then return true end
  task.wait(.18)
 end
 return false,'Purchase acknowledged but inventory not updated'
end

bankFarm.modelIds=setmetatable({},{__mode='k'});bankFarm.modelSerial=0
local function detectVault()
  local model,why,identity=bank.findDoor()
  if not model then return nil,why end
  local api=liveModule('ClientProps');local prop=identity and identity.prop
  if not prop and api and type(api.GetFromModel)=='function' then
    local ok,value=pcall(api.GetFromModel,model);if ok then prop=value end
  end
  if not bankFarm.modelIds[model] then bankFarm.modelSerial=bankFarm.modelSerial+1;bankFarm.modelIds[model]=bankFarm.modelSerial end
  local generation=bankFarm.modelIds[model]
  local id=model:GetAttribute('objectId')
  -- bankLevel is used by the exported native VaultOption dialogue. Door-local rarity
  -- attributes are retained for compatibility but may never override a conflict.
  local replicated=workspace:GetAttribute('bankLevel')
  local raw=model:GetAttribute('vaultRarity') or model:GetAttribute('vaultName')
  local name=normalizeVault(replicated~=nil and replicated or raw)
  local evidence=replicated~=nil and 'Workspace.bankLevel='..tostring(replicated) or 'door rarity='..tostring(raw)
  if raw~=nil and replicated~=nil and normalizeVault(raw)~=normalizeVault(replicated) then
    name=nil;evidence='Conflicting vault metadata: door='..tostring(raw)..'; bankLevel='..tostring(replicated)
  end
  if not name then evidence='Identifying rarity · '..evidence end
  local status,stateEvidence=bank.vaultState(model)
  return {found=true,model=model,gizmo=prop,name=name,rarityKnown=name~=nil,rarityEvidence=evidence,
    discoveryEvidence=identity and identity.source or 'Main-bank VaultDoor',opened=status=='OPEN',doorState=status,stateEvidence=stateEvidence,
    position=identity and identity.position or objectWorldPosition(model),id=tostring(id or ('local-vault-'..generation)),generation=generation,
    resetStamp=workspace:GetAttribute('lastBankUpdate')},nil
end
function bankFarm.allVaultsSelected()
  for name in pairs(bankVaultNames) do if bankFarm.selected[name]~=true then return false end end
  return true
end
function bankFarm.filterDecision(vault)
  if not vault then return false,'Searching for bank vault' end
  if vault.name then
    if bankFarm.selected[vault.name]==true then return true,'Selected rarity: '..vault.name end
    return false,'Vault detected · Waiting for selected rarity ('..vault.name..')'
  end
  if bankFarm.allVaultsSelected() and bankFarm.unknownPolicy=='allow_all' then
    return true,'All Vaults · Unknown rarity allowed; checking availability'
  end
  return false,'Vault found · Identifying rarity'
end
function bankFarm.selectAll(value)
  for name in pairs(bankVaultNames) do bankFarm.selected[name]=value==true end
  bankFarm.observerDirty=true;saveSettings()
end
function bankFarm.setUnknownPolicy(value)
  bankFarm.unknownPolicy=value=='wait' and 'wait' or 'allow_all';bankFarm.observerDirty=true;saveSettings()
end

-- Existing popup categories share one gate; diagnostic records remain independent.
state.notifications={preferences={},categories={{'LOW AMMO','Low Ammo'},{'VAULT','Bank Farm'},{'AIRDROP','Airdrop'},{'MOVEMENT','Movement and Recovery'}}}
for _,entry in ipairs(state.notifications.categories)do
 local saved=configSaved and configSaved.notifications;local value
 if type(saved)=='table'then value=saved[entry[1]]end
 if value==nil and entry[1]=='LOW AMMO'and configSaved and type(configSaved.lowAmmo)=='table'then value=configSaved.lowAmmo.enabled end
 state.notifications.preferences[entry[1]]=value~=false
end
function state.notifications.allowed(category)return state.notifications.preferences[category]~=false end
local notifyUser=function()end
-- Observation owns no character, camera or movement resources.
bankFarm.observerConnections={};bankFarm.modelConnections={};bankFarm.availabilityRecords={}
function bankFarm.closeObserver()
 for _,list in ipairs({bankFarm.observerConnections,bankFarm.modelConnections}) do
  for _,connection in ipairs(list) do connection:Disconnect() end;table.clear(list)
 end
 bankFarm.observedModel=nil
end
function bankFarm.markObservationDirty()bankFarm.observerDirty=true end
function bankFarm.bindObservedModel(model)
 if bankFarm.observedModel==model then return end
 for _,connection in ipairs(bankFarm.modelConnections) do connection:Disconnect() end
 table.clear(bankFarm.modelConnections);bankFarm.observedModel=model
 if model then
  for _,attribute in ipairs({'isBroken','objectId','propName','vaultType','vaultName','vaultRarity'}) do
   table.insert(bankFarm.modelConnections,model:GetAttributeChangedSignal(attribute):Connect(bankFarm.markObservationDirty))
  end
  table.insert(bankFarm.modelConnections,model.AncestryChanged:Connect(bankFarm.markObservationDirty))
  table.insert(bankFarm.modelConnections,model:GetPropertyChangedSignal('PrimaryPart'):Connect(bankFarm.markObservationDirty))
 end
end
function bankFarm.requestVaultStream()
 if state.closed or not (bankFarm.autoMode or bankFarm.requested) or bankFarm.streamInFlight or os.clock()<(bankFarm.nextStreamRequest or 0) then return end
 local point=bank.points.vault_throw
 if not point or type(player.RequestStreamAroundAsync)~='function' then return end
 bankFarm.nextStreamRequest=os.clock()+15;bankFarm.streamInFlight=true
 task.spawn(function()
  local ok,why=pcall(player.RequestStreamAroundAsync,player,Vector3.new(point.x,point.y,point.z),4)
  bankFarm.streamInFlight=false
  if state.closed then return end
  bankFarm.streamResult=ok and 'Stream request returned; object presence still required' or tostring(why)
  bankFarm.markObservationDirty()
 end)
end
function bankFarm.resetClock(vault,record)
 local globals=liveModule('Globals');local time=liveModule('TimeUtil')
 local duration=globals and globals.BANK and tonumber(globals.BANK.RESPAWN_TIME)
 local stamp=vault.resetStamp or workspace:GetAttribute('lastBankUpdate');local remaining,estimated
 if type(stamp)=='number' and duration and duration>0 and time and type(time.GetServerTime)=='function' then
  local ok,now=pcall(time.GetServerTime)
  if ok and type(now)=='number' then remaining=math.max(0,duration-math.max(now-stamp,0)) end
 end
 if remaining==nil and record.dryAt then remaining=math.max(0,1200-(os.time()-record.dryAt));estimated=true end
 record.remaining=remaining;record.estimated=estimated==true
 vault.cooldown={known=remaining~=nil,active=remaining~=nil and remaining>0,remaining=remaining,estimated=estimated==true}
end
function bankFarm.availability(vault)
 local id=vault.id;local record=bankFarm.availabilityRecords[id]
 local stamp=workspace:GetAttribute('lastBankUpdate');vault.resetStamp=stamp
 local status,evidence=bank.vaultState(vault.model);vault.doorState=status;vault.stateEvidence=evidence;vault.opened=status=='OPEN'
 if not record or type(stamp)=='number' and record.stamp~=stamp or record.opened and status=='CLOSED' then
  record={model=vault.model,stamp=stamp};bankFarm.availabilityRecords[id]=record
 end
 -- Streaming the same logical ID back in is not itself a reset. Positive loot,
 -- a confirmed closed door or a new authoritative reset stamp clears depletion.
 record.model=vault.model
 record.opened=status=='OPEN'
 local function finish(allowed,availability,reason)
  vault.availability=availability;vault.availabilityEvidence=reason
  bankFarm.resetClock(vault,record);return allowed,reason
 end
 if status~='OPEN' and status~='CLOSED' then return finish(false,'UNKNOWN','Vault found · Waiting for door state ('..status:lower()..')') end
 if status=='CLOSED' then record.dryAt=nil;return finish(true,'AVAILABLE','Closed door verified') end
 -- Main cash depletion must not hide remaining selected gems, small cash or valuables.
 for _,entry in ipairs(bankFarm.pickups(vault)) do
  if not entry.cash or entry.amount and entry.amount>0 then record.dryAt=nil;return finish(true,'AVAILABLE','Eligible live loot observed') end
 end
 local piles=bank.cashList(vault.position,210,true);local known=false
 for _,pile in ipairs(piles) do
  local amount=bank.cashAmount(pile.gizmo)
  if amount~=nil then known=true;if amount>0 then record.dryAt=nil;return finish(true,'AVAILABLE','Positive main cash observed') end end
 end
 -- A bounded normal approach may resolve streaming. It is NOT proof of loot availability.
 if not known and not record.dryAt then return finish(true,'UNKNOWN','Vault open · Checking streamed loot') end
 record.dryAt=record.dryAt or os.time()
 bankFarm.resetClock(vault,record)
 local reason=record.remaining and ('Vault unavailable · %sreset %ds; live state required'):format(record.estimated and 'Estimated ' or '',math.ceil(record.remaining)) or 'Vault unavailable · Reset pending'
 return finish(false,'UNAVAILABLE',reason)
end
function bankFarm.describe(vault)
 if not vault then return 'Searching for bank vault' end
 local allowed,reason=bankFarm.filterDecision(vault)
 if not allowed then return reason end
 if vault.availability=='UNAVAILABLE' then return vault.availabilityEvidence end
 if vault.availability=='UNKNOWN' then return vault.availabilityEvidence end
 return (vault.name and vault.name..' vault' or 'Vault found · Rarity unknown')..' · Available'
end
function bankFarm.recordCompletion(vault)
 -- A verified sweep can remove the last pile before the next observer poll.
 -- Preserve that evidence rather than turning its absence into an endless discovery run.
 if bank.findDoor()~=vault.model or workspace:GetAttribute('lastBankUpdate')~=vault.resetStamp then return end
 local record=bankFarm.availabilityRecords[vault.id] or {model=vault.model,stamp=vault.resetStamp,opened=true}
 bankFarm.availabilityRecords[vault.id]=record
 record.completedAt=os.time();record.dryAt=record.dryAt or record.completedAt
 bankFarm.observerDirty=true
end
function bankFarm.clockText()
 local vault=bankFarm.snapshot
 if not vault then return 'Bank cycle · Searching for live vault' end
 local record=bankFarm.availabilityRecords[vault.id]
 if record then bankFarm.resetClock(vault,record) end
 local clock=vault.cooldown
 if clock and clock.known then
  if clock.remaining==0 then return 'Bank cycle · Reset time reached; checking live state' end
  return ('Bank cycle · %sreset %02d:%02d'):format(clock.estimated and 'Estimated ' or '',math.floor(clock.remaining/60),math.floor(clock.remaining%60))
 end
 return 'Bank cycle · Reset time not disclosed'
end
function bankFarm.traceObservation(vault,reason)
 if not bankFarm.traceVault then return end
 local text=reason or 'Searching for bank vault'
 if vault then
  local allowed,decision=bankFarm.filterDecision(vault)
  local path=tostring(vault.model);pcall(function()path=vault.model:GetFullName()end)
  text=('object=%s id=%s generation=%s via=%s | rarity=%s | door=%s | availability=%s: %s | filter=%s: %s'):format(
    path,vault.id,tostring(vault.generation),vault.discoveryEvidence,vault.rarityEvidence,tostring(vault.doorState),tostring(vault.availability),tostring(vault.availabilityEvidence),tostring(allowed),decision)
 end
 -- No per-frame log spam, notifications or UI debug dumps. Keep only changed observations.
 local signature=vault and table.concat({vault.id,tostring(vault.generation),vault.rarityEvidence,tostring(vault.doorState),tostring(vault.resetStamp),tostring(vault.availability),tostring(bankFarm.filterDecision(vault)),bankFarm.unknownPolicy},'|') or text
 if signature~=bankFarm.lastTrace and os.clock()>=(bankFarm.nextTrace or 0) then
  bankFarm.lastTrace=signature;bankFarm.nextTrace=os.clock()+5;note('INFO','Vault observer: '..text)
 end
end
local function observeVault()
 local ok,vault,err=pcall(function()
  local routeOK,routeWhy=bank.validateRoute();if not routeOK then return nil,routeWhy end
  local found,why=detectVault();if found then bankFarm.availability(found) end
  return found,why
 end)
 bankFarm.observerDirty=false;bankFarm.nextObservation=os.clock()+4
 if not ok then
  bankFarm.snapshot=nil;bankFarm.observationStatus='Vault observation failed · Retrying';bankFarm.bindObservedModel(nil)
  bankFarm.traceObservation(nil,bankFarm.observationStatus..': '..tostring(vault));return nil,tostring(vault)
 end
 bankFarm.snapshot=vault;bankFarm.bindObservedModel(vault and vault.model)
 bankFarm.observationStatus=bankFarm.describe(vault);bankFarm.currentVault=vault and vault.name or 'Unknown'
 bankFarm.traceObservation(vault,err)
 if not vault then bankFarm.requestVaultStream();return nil,err end
 if vault.availability=='UNKNOWN' then bankFarm.requestVaultStream() end
 bankFarm.lastDoor=vault.id;bankFarm.lastObserved=os.time() -- diagnostic only; never starts a cooldown
 local key=vault.id..':'..tostring(vault.name)
 if vault.name and vault.name~='Regular' and (not bankFarm.lastNotified[key] or os.time()-bankFarm.lastNotified[key]>1200) then
  bankFarm.lastNotified[key]=os.time()
  notifyUser('VAULT',vault.name..' vault detected','ROB BANK',function()
   if not state.running and not af.running and not bank.running and not bankFarm.running then bankFarm.start(true) end
  end)
 end
 return vault
end
function bankFarm.initObserver()
 for _,attribute in ipairs({'bankLevel','lastBankUpdate'}) do
  table.insert(bankFarm.observerConnections,workspace:GetAttributeChangedSignal(attribute):Connect(bankFarm.markObservationDirty))
 end
 local service=game:GetService('CollectionService')
 for _,method in ipairs({'GetInstanceAddedSignal','GetInstanceRemovedSignal'}) do
  pcall(function()table.insert(bankFarm.observerConnections,service[method](service,'Prop'):Connect(bankFarm.markObservationDirty))end)
 end
end
bankFarm.initObserver()

local function bankPickupList(vault)
 local folder=workspace:FindFirstChild('Local');folder=folder and folder:FindFirstChild('Gizmos')
 local api=liveModule('ClientGizmos')
 if not folder or not api or type(api.Get)~='function' then return {} end
 local entries,seen={},{}
 for _,m in ipairs(folder:GetDescendants()) do
  if m:IsA('Model') and m.PrimaryPart and (m.PrimaryPart.Position-vault.position).Magnitude<=210 then
   local id=m:GetAttribute('objectId')
   if id~=nil and not seen[id] then
    seen[id]=true
    local ok,g=pcall(api.Get,id)
    if ok and type(g)=='table' and type(g.AttemptCollect)=='function' then
     local prop=type(g.properties)=='table' and g.properties or {}
     local kind=bank.cashKind(g)
     local name=tostring(prop.toolName or g.name or '')
     local key=baseLootName(name)
     local amount=kind and bank.cashAmount(g)
     local localLocation=prop.locationName
     local distance=(m.PrimaryPart.Position-vault.position).Magnitude
     -- Expanded scan for rarer vault layouts. Exclude unrelated businesses
     -- even when their pickups stream in within the larger search radius.
     local inBank=(localLocation=='Bank') or (localLocation==nil and (distance<=105 or kind~=nil and distance<=210))
     local cashAllowed=kind and inBank and (kind=='main' or bankFarm.collectSmall) and (amount==nil or amount>0)
     local lootAllowed=not kind and inBank and state.naturalLootLookup[key] and passesGlobalLoot(name)
     local excluded=(key:sub(1,5)=='gold ' and bankFarm.skipGold) or (key:sub(1,7)=='silver ' and bankFarm.skipSilver)
     if (cashAllowed or lootAllowed) and not excluded and not g.isCollected and m:GetAttribute('isDestroyed')~=true then
      local gems={sapphire=true,ruby=true,emerald=true,amethyst=true,diamond=true}
      local priority=key=='golden barrett m82' and 0 or kind=='main' and 1 or gems[key] and 2 or not kind and 3 or 4
      table.insert(entries,{id=tostring(id),objectId=id,name=name,model=m,gizmo=g,cash=kind~=nil,kind=kind,amount=amount,priority=priority})
     end
    end
   end
  end
 end
 table.sort(entries,function(a,b)
  if a.priority~=b.priority then return a.priority<b.priority end
  if not a.cash and not b.cash then
   local pa,pb=state.globalLoot.priority(a.name),state.globalLoot.priority(b.name)
   if pa~=pb then return pa<pb end
  end
  return a.id<b.id
 end)
 return entries
end
bankFarm.pickups=bankPickupList
-- BEGIN_TESTABLE bankRetryDelay
-- Seconds to wait before retrying the same vault cycle. A missing main pile after the vault was
-- reached is not fixed by flying back in 20 seconds later; wait for the vault to reset instead.
function bankFarm.retryDelayFor(ok,reason)
  if ok then return 1200 end
  if tostring(reason or ''):find('Main cash pile unavailable',1,true) then return 300 end
  return 20
end
-- END_TESTABLE
function bankFarm.sweep(vault,token)
 local done=(bankFarm.resume and bankFarm.resume.done)or {}
 local backoff,failures={},{}
 local dry,collected,started=0,0,os.clock()
 local scanPass=0;local seenCash={}
 local function active()return bankFarm.running and bankFarm.token==token and bank.active(bank.token) end
 local mainObserved=false
 local discoveryDeadline=os.clock()+15
 while active() and os.clock()<discoveryDeadline do
  local cash=bank.cashList(vault.position,210,true)
  if #cash>0 then mainObserved=true;break end
  bankFarm.status='Waiting for main cash pile to stream in'
  task.wait(.25)
 end
 if not mainObserved then return false,'Main cash pile unavailable; vault clearance is not confirmed',0 end
 local function pickup(entry)
  if not entry.cash then
   local readOK=bag.read()
   if readOK then
    local objects=liveModule('Objects');local mass
    if objects and type(objects.GetDataProperty)=='function' then
     local good,weight=pcall(objects.GetDataProperty,entry.name,'weight')
     if good and type(weight)=='number' then mass=weight end
    end
    if bag.nearFull or mass and mass>bag.freeWeight+.001 then
     if bag.value<=0 then return false,'Bag cannot fit item and cannot sell zero-value contents' end
     state.sellRequested=true;state.bankFarmSellPending=true
     bag.status='Bag cannot fit '..entry.name..' · selling first'
     return false,'Bag sale queued'
    end
   end
  end
  local m=entry.model
  if not m.Parent or not m.PrimaryPart then return false,'Pickup unstreamed' end
  local p=bank.interactionPosition(entry.gizmo,m)+Vector3.new(0,2,0)
  local reached,why=bank.fly({x=p.X,y=p.Y,z=p.Z},bank.token)
  if not reached then return false,why end
  for _=1,3 do
   if not active() then return false,'Canceled' end
   if not passesGlobalLoot(entry.name) then return false,'Item excluded' end
   local ok,err=state.work.nativeCall(10,entry.gizmo,entry.gizmo.AttemptCollect,entry.gizmo,player)
   if not ok then note('WARN','Bank pickup: '..tostring(err)) end
   for _=1,8 do
    if not active() then return false,'Canceled' end
    if entry.gizmo.isCollected==true or entry.gizmo.gizmoState and entry.gizmo.gizmoState.isCollected==true
      then return true end
    task.wait(.15)
   end
  end
  return false,'Pickup not confirmed: '..entry.name
 end
 local function goldenPreempt()
  for _,entry in ipairs(bankPickupList(vault)) do
   if entry.priority==0 and not done[entry.id] and (backoff[entry.id] or 0)<=os.clock() then
    bankFarm.status='Collecting priority Golden Barrett'
    local ok,why=pickup(entry)
    if ok then done[entry.id]=true;collected=collected+1
    elseif why=='Bag sale queued' then return false,why
    else backoff[entry.id]=os.clock()+8;note('WARN',why) end
    break
   end
  end
  return active(),'Canceled'
 end
 while active() and dry<4 and os.clock()-started<360 do
  if state.sellRequested and bag.value>0 then return false,'Bag sale queued',collected end
  if not bank.isOpen(vault.model) then return false,'Vault closed/reset during collection',collected end
  local entries=bankPickupList(vault);local candidate;local waiting=false
  for _,e in ipairs(entries) do
   if e.cash then
    seenCash[e.id]=true
    if e.amount~=nil and e.amount>0 and done[e.id] then done[e.id]=nil end
   end
  end
  for _,e in ipairs(entries) do
   if not done[e.id] then
    if (backoff[e.id] or 0)>os.clock() then waiting=true
    else candidate=e;break end
   end
  end
  if candidate and candidate.priority~=0 and bankFarm.resume and bankFarm.resume.cashTarget then
   for _,entry in ipairs(entries)do if entry.id==bankFarm.resume.cashTarget and not done[entry.id] and (backoff[entry.id]or 0)<=os.clock()then candidate=entry;break end end
  end
  if not candidate then
   if waiting then dry=0 else dry=dry+1 end
   -- Walk the recorded vault interior using normal CFrame + noclip so
   -- streamed-in cash from different layouts gets another discovery pass.
   if not waiting and dry==2 and scanPass<2 then
    scanPass=scanPass+1
    local point=scanPass==1 and bank.points.cash_pickup or bank.points.vault_enter
    if point then
     bankFarm.status='Scanning bank cash piles · pass '..scanPass
     local reached,why=bank.fly(point,bank.token)
     if not reached then return false,'Cash rescan travel: '..tostring(why),collected end
    end
    dry=0
   end
   task.wait(.7)
  else
   dry=0;bankFarm.status='Collecting '..candidate.name
   local ok,why
   if candidate.cash then
    ok,why=bank.drainCash(candidate,bank.token,false,function()
      if not bank.isOpen(vault.model) then return false,'Vault reset during cash collection' end
      return goldenPreempt()
    end)
   else ok,why=pickup(candidate) end
   if ok then done[candidate.id]=true;collected=collected+1;if bankFarm.resume and bankFarm.resume.cashTarget==candidate.id then bankFarm.resume.cashTarget=nil end
   else
    if why=='Bag sale queued' then return false,why,collected end
    if not active() then return false,'Canceled',collected end
    failures[candidate.id]=(failures[candidate.id] or 0)+1
    note('WARN',why)
    if failures[candidate.id]>=3 then return false,why,collected end
    backoff[candidate.id]=os.clock()+3 -- Retry later; never mark a failed target done.
   end
  end
 end
 if not active() then return false,'Canceled',collected end
 if dry<4 then return false,'Collection time limit; remaining targets not marked complete',collected end
 local verify=bankPickupList(vault)
 for _,entry in ipairs(verify) do
  if not done[entry.id] then return false,'Bank verification still sees uncollected '..entry.name,collected end
  if entry.cash and entry.amount~=nil and entry.amount>0 then return false,'Cash still remains in '..entry.name,collected end
 end
 local seenCount=0;for _ in pairs(seenCash)do seenCount=seenCount+1 end
 bankFarm.cashSeen=seenCount
 note('INFO','Bank cash verified in streamed area · '..seenCount..' cash pile IDs seen; unknown unstreamed piles cannot be guaranteed')
 return true,'Eligible visible pickups cleared',collected
end

function bankFarm.stop()
  if state.recovery then state.recovery.cancel('bank')end
  bankFarm.autoMode=false;bankFarm.requested=false;bankFarm.resume=nil
  if bankFarm.running then bankFarm.suspend('Disabled')end
  if not af.enabled and not af.requested and not bag.selling and not bag.manualRequested then state.sellRequested=false;state.bankFarmSellPending=false end
  state.collision.sync();bankFarm.status='Disabled'
end
function bankFarm.suspend(reason)
  if not bankFarm.running then return end
  bankFarm.resume=bankFarm.resume or {}
  bankFarm.resume.phase=bankFarm.phase;bankFarm.resume.cashTarget=bank.cashTarget;bankFarm.resume.suspended=true
  bankFarm.running=false;bank.running=false;bankFarm.token=bankFarm.token+1;bank.token=bank.token+1
  bankFarm.status='Paused · '..reason
  stopMotion(true)
  local lease=state.work.lease;if lease and lease.owner=='bank'then state.camera.release(lease)end
end
function bankFarm.start(oneShot)
  motion.newWorkflow('bank')
  if state.closed then return false end
  if oneShot then bankFarm.requested=true else bankFarm.autoMode=true end
  state.collision.sync()
  bankFarm.status='Queued · waiting for task ownership'
  return true
end
function bankFarm.run(vault,cycle)
  if state.work.lease or state.closed then return false end
  local validRoute,routeWhy=bank.validateRoute();if not validRoute then bankFarm.status=routeWhy;bankFarm.requested=false;state.collision.sync();return false end
  bankFarm.running=true;bank.running=true;bank.isTutorial=false
  bank.token=bank.token+1;bankFarm.token=bankFarm.token+1
  local token=bankFarm.token;local navigation=bank.token
  local checkpointState=bankFarm.resume
  if not checkpointState or checkpointState.cycle~=cycle then
    checkpointState={cycle=cycle,vaultId=vault.id,vaultName=vault.name,done={}};bankFarm.resume=checkpointState
  end
  checkpointState.suspended=false
  return state.work.launch('bank',navigation,function()
    local ok,reason=pcall(function()
      local function active()return bankFarm.running and bankFarm.token==token and bank.active(navigation)end
      local function currentVault()
        local current=detectVault()
        if not current or current.model~=vault.model or current.resetStamp~=vault.resetStamp then error('Vault changed or streamed out; observing replacement') end
      end
      currentVault()
      local function flyPoint(vec,label)
        if not active()then error('Canceled')end
        bankFarm.phase=label;bankFarm.status=label;checkpointState.phase=label
        local yes,why=bank.fly({x=vec.X,y=vec.Y,z=vec.Z},navigation)
        if not yes then error(tostring(why))end
      end
      local known,status=bank.requireKnownDoor(navigation,vault.model)
      if not known then error('Vault state unknown; waiting for replication')end
      if status~='OPEN'then
        -- Resume always rechecks the live door. A reset invalidates old loot checkpoints.
        checkpointState.done={};checkpointState.cashTarget=nil
        if not bank.hasPlanted(vault.model)and not bank.c4Ready()then
          local free=bank.points.free_c4
          flyPoint(Vector3.new(free.x,free.y,free.z),'Fetching free C4')
          bank.acquireC4(navigation,vault.model)
        end
        if not active()then error('Canceled')end
        if not bank.isOpen(vault.model)and not bank.hasPlanted(vault.model)and not bank.c4Ready()then
          local bought,why=buyFromGunShop('C4','Explosives',flyPoint)
          if not bought and not bank.isOpen(vault.model)then error('C4 acquisition failed: '..tostring(why))end
        end
        if not active()then error('Canceled')end
        if not bank.isOpen(vault.model)then
          local point=bank.points.vault_throw
          flyPoint(Vector3.new(point.x,point.y,point.z),'Approaching vault door')
          currentVault()
          local breached,why=bank.breach(navigation,vault.model)
          if not breached then error(why)end
        end
      end
      if not active()then error('Canceled')end
      currentVault()
      if not bank.isOpen(vault.model)then error('Vault state changed before entry')end
      flyPoint(vault.position+Vector3.new(0,4,0),'Resuming vault collection')
      bankFarm.phase='loot';checkpointState.phase='loot'
      local swept,why,collected=bankFarm.sweep(vault,token)
      if not active()then error('Canceled')end
      bankFarm.looted=bankFarm.looted+(collected or 0)
      if not swept then error(why)end
      currentVault()
      bankFarm.status='Completed · eligible targets cleared'
      if bag.read()and bag.informationReady and bag.nearFull and bag.value>0 then state.bankFarmSellPending=true;state.sellRequested=true end
    end)
    if bankFarm.token~=token then return end -- canceled generations cannot overwrite the new task's status
    bankFarm.running=false;bank.running=false
    bankFarm.requested=false;bankFarm.lastRunOK=ok;bankFarm.lastFinished=os.time()
    bankFarm.retryDelay=bankFarm.retryDelayFor(ok,reason)
    bankFarm.lastAttemptedCycle[cycle]=os.time()
    if ok then bankFarm.recordCompletion(vault);bankFarm.resume=nil
    else
      bankFarm.lastError=tostring(reason);bankFarm.status='Recovering · '..bankFarm.lastError
      note('WARN','Bank Farm: '..bankFarm.lastError)
    end
  end)
end
bankFarm.autoMode=false;bankFarm.requested=false;bankFarm.lastAttemptedCycle={}

-- Enabled preferences do not occupy movement. One detected drop gets one bounded worker.
af.enabled=false;af.requested=false;af.retryAt=setmetatable({},{__mode='k'});af.seen=setmetatable({},{__mode='k'});af.observed=setmetatable({},{__mode='k'})
function af.suspend(reason)
  if not af.running then return end
  af.running=false;af.token=af.token+1;af.status='Paused · '..reason
  af.pending={};stopMotion(true)
end
function af.run(crate,sweep)
  if state.closed or state.work.lease then return false end
  af.running=true;af.token=af.token+1;local token=af.token
  af.currentCrate=crate
  return state.work.launch('airdrop',token,function()
    local baseline=sweep and sweep.baseline
    local startPos=crate and crate.PrimaryPart and crate.PrimaryPart.Position or sweep and sweep.position
    if not baseline then baseline=crate and crate:GetAttribute('isLooted')==true and {} or startPos and af.groundModels(startPos,85)or {}end
    local ok,why=pcall(function()
      local yes,reason
      if sweep then yes,reason=af.collectFloor(sweep.position,baseline,token)
      else
        afSetStatus('Following airdrop')
        yes,reason=afFlight(crate,token,true)
        if yes then yes,reason=afLoot(crate,token,baseline)
        elseif not crate.Parent and af.lastPos then yes,reason=af.collectFloor(af.lastPos,baseline,token)end
      end
      if not yes then error(reason or 'Airdrop interaction unconfirmed')end
    end)
    if af.token~=token then return end
    af.running=false;af.currentCrate=nil;af.pending={}
    if crate then
      if af.needsSell then af.retryAt[crate]=os.clock()+2
      else af.seen[crate]=ok and true or nil;af.retryAt[crate]=os.clock()+30 end
      af.observed[crate]={position=startPos,baseline=baseline}
      af.queuedSweeps[crate]=nil
    end
    if not ok then af.lastError=tostring(why);afSetStatus('Recovering · '..af.lastError)
    else afSetStatus('Completed · watching for next airdrop')end
    if not af.needsSell then af.requested=false end
  end)
end

-- Manual actions are queued as exclusive workflows. Normal farm preferences are retained.
function state.work.request(name,callback)
  if state.closed then return end
  if state.manual and state.manual.blocked then warning('Manual flight: resume automation before queuing a task');return end
  if state.work.pending then warning('Exclusive task already queued: '..state.work.pending.name);return end
  state.work.pending={name=name,callback=callback,created=os.clock()}
  state.collision.sync()
  log(name..' queued; current farm will release control')
end
function state.work.cancelPending(name)
  if state.work.pending and state.work.pending.name==name then state.work.pending=nil end
  if state.work.dispatching and state.work.dispatching.name==name then state.work.dispatching.canceled=true end
  state.collision.sync()
end
function state.work.interruptFarm(reason)
  if state.work.critical or bank.breaching then return end
  local lease=state.work.lease
  if lease and (lease.elevatorRide or lease.elevatorRequest and not lease.elevatorRequest.finished)then return end
  if reason=='Buy ammo'and lease and not state.camera.current and not state.quest.dialogue and (lease.owner=='quest'or lease.owner=='bank'and bank.isTutorial)then
    state.ammo.resumeOwner=lease.owner;lease.noRecovery=true
    if lease.owner=='quest'then state.token=state.token+1;state.running=false else bank.token=bank.token+1;bank.running=false end
    state.camera.release(lease);motion.release();return
  end
  if bankFarm.running then bankFarm.suspend(reason)
  elseif af.running then af.suspend(reason)end
end
-- Reuse existing tutorial/quest/shop implementations, but start only after the previous worker finalized.
do
  local tutorial=bank.start;local quest=startQuest;local shop=openGunshop
  state.actions={tutorial=tutorial,quest=quest,shop=shop}
  bank.start=function()state.recovery.cancel('bank');motion.newWorkflow('bank');state.work.request('Bank tutorial',tutorial)end
  startQuest=function()state.recovery.cancel('quest');motion.newWorkflow('quest');state.work.request('Ghost quest',quest)end
  openGunshop=function()state.recovery.cancel('shop');motion.newWorkflow('shop');state.work.request('Gunshop',shop)end
end
-- Team switching uses the native dialogue callbacks from exported DialogUtil:
-- Bert: setPolice(true/false), Sir B: setSyndicate(true/false).
-- Direct server requests might still be declined by server-side location/rank rules.
state.teams={token=0,status='Ready',requested=nil}
function state.teams.findNPC(name)
  if name=='Sir B' then return bag.findSellerPosition('Sir B') end
  local tagger=liveModule('Tagger')
  if tagger and type(tagger.Get)=='function' then
    local ok,obj=pcall(tagger.Get,name)
    if ok and type(obj)=='table' then
      if typeof(obj.cframe)=='CFrame' then return obj.cframe.Position end
      if typeof(obj.position)=='Vector3' then return obj.position end
      if typeof(obj.model)=='Instance' then return objectWorldPosition(obj.model) end
    end
  end
  local client=liveModule('ClientGizmos')
  local folder=workspace:FindFirstChild('Local');folder=folder and folder:FindFirstChild('Gizmos')
  if client and type(client.Get)=='function' and folder then
    for _,model in ipairs(folder:GetChildren())do
      local id=model:GetAttribute('objectId')
      if id~=nil then
        local good,npc=pcall(client.Get,id)
        if good and type(npc)=='table' then
          local props=npc.properties or {}
          local named=props.npcName or props.name or props.gizmoName or npc.name
          if type(named)=='string' and named:lower()==name:lower() then
            local pos=objectWorldPosition(model);if pos then return pos end
          end
        end
      end
    end
  end
  return nil
end
function state.teams.approach(name)
  local teams=state.teams;local target=teams.findNPC(name)
  -- If a remote NPC has not streamed yet, approach the known map location,
  -- then demand an actual NPC position before invoking the dialogue remote.
  if not target then
    local locations=workspace:FindFirstChild('Map');locations=locations and locations:FindFirstChild('Locations')
    local label=name=='Bert' and 'Police Station' or 'Criminal Hideout'
    local marker=locations and locations:FindFirstChild(label)
    local region=marker and objectWorldPosition(marker)
    if region then target=region end
  end
  if not target then return false,'Cannot locate '..name..' or its map area (streaming)' end
  local lease=state.work.lease
  local r=root();if not r then return false,'Character unavailable' end
  local deadline=os.clock()+math.max(22,(r.Position-target).Magnitude/state.speed*3+20)
  while lease==state.work.lease and motion.ownerActive('team') and characterAlive() and os.clock()<deadline do
    r=root();if not r then break end
    local observed=teams.findNPC(name)
    if observed then target=observed end
    if observed and (r.Position-observed).Magnitude<=8 then
      motion.arrived();stopMotion();return true
    end
    if (r.Position-target).Magnitude<8 and not observed then
      return false,name..' NPC not streamed at map marker'
    end
    teams.status='Traveling to '..name
    local moved,why=motion.travel(r,target,state.speed,'team')
    if not moved then return false,tostring(why or 'Team navigation blocked') end
    RunService.Heartbeat:Wait()
  end
  return false,'Could not reach '..name..' for faction dialogue'
end

function state.teams.change(target)
  if not ({civilian=true,criminal=true,police=true})[target] then return end
  if state.closed then return end
  if player:GetAttribute('isOnboarding')==true then warning('Finish onboarding before changing teams');return end
  if state.running or bank.isTutorial and bank.running then warning('Finish or stop tutorial/quest before changing teams');return end
  if target=='police' then
    -- Cash and loot client modules reject police collection in WANTED.
    -- Do not resume incompatible theft farms on police duty.
    if bankFarm.autoMode or bankFarm.requested then bankFarm.stop() end
    if af.enabled or af.requested then afStop() end
  end
  local teams=state.teams
  teams.requested=target
  state.work.request('Change team: '..target,function()
    teams.token=teams.token+1;local generation=teams.token
    state.work.launch('team',generation,function()
      local network=liveModule('Network')
      if not network or type(network.InvokeServer)~='function' then teams.status='Team network unavailable';warning(teams.status);return end
      local function current()
        return player:GetAttribute('currentTeam')
      end
      local function civilian()
        local value=current();return value~='police' and value~='syndicate'
      end
      local function invoke(method,value,description)
        local npc=method=='setPolice' and 'Bert' or 'Sir B'
        local approached,travelWhy=teams.approach(npc)
        if not approached then return false,travelWhy end
        local called,reply,detail=state.work.nativeCall(10,'team_'..method,network.InvokeServer,method,value,{text=description})
        if not called or reply~=true then return false,'Game rejected '..method..': '..tostring(detail or reply) end
        local expected=value and (method=='setPolice'and 'police'or 'syndicate')or 'civilian'
        for _=1,35 do
          if (value and current()==expected) or (not value and civilian()) then return true end
          task.wait(.12)
        end
        return false,'Server acknowledged, but currentTeam did not become '..expected
      end
      if (target=='civilian' and civilian()) or current()==target or target=='criminal' and current()=='syndicate' then teams.status='Already on team';return end
      teams.status='Changing to '..target
      if target=='police' then
        local stars=tonumber(player:GetAttribute('stars'))
        if stars and stars>2 then teams.status='Police requires two stars or fewer';warning(teams.status);return end
      end
      if current()=='police'and target~='police' then
        local ok,reason=invoke('setPolice',false,'You went off duty.')
        if not ok then teams.status=reason;warning(reason);return end
      elseif current()=='syndicate'and target~='criminal' then
        local ok,reason=invoke('setSyndicate',false,'You left The Syndicate.')
        if not ok then teams.status=reason;warning(reason);return end
      end
      if target=='civilian' then
        if not civilian() then teams.status='Unable to verify civilian status';warning(teams.status);return end
      elseif target=='police' then
        local ok,reason=invoke('setPolice',true,'You went on duty.')
        if not ok then teams.status=reason;warning(reason);return end
      elseif target=='criminal' then
        local ok,reason=invoke('setSyndicate',true,'You joined The Syndicate.')
        if not ok then teams.status=reason;warning(reason);return end
      end
      teams.status='Current team: '..tostring(current())
      log('Team changed · '..teams.status)
    end)
  end)
end

state.recovery={pending={},lastReset=-math.huge}
function state.recovery.cancel(owner)
 state.recovery.pending[owner]=nil
 if state.ammo and state.ammo.resumeOwner==owner then state.ammo.resumeOwner=nil end
 local lease=state.work.lease;if lease and lease.owner==owner then lease.noRecovery=true end
end
function state.recovery.active(lease)
 return lease and state.work.lease==lease and motion.ownerActive(lease.owner)and not lease.noRecovery
end
function state.recovery.onDeath(character)
 local lease=state.work.lease;if not lease then return end
 if lease.deathCharacter==character and lease.died then return end
 lease.deathDestination=lease.travelPlan and lease.travelPlan.destination or lease.navigation and lease.navigation.target or root()and root().Position
 lease.died=true;lease.deathCharacter=character
 if state.recovery.intentional==lease then return end
 local flow=lease.workflow;flow.deaths=flow.deaths+1
 if flow.deaths>3 then lease.noRecovery=true;lease.navigationFailed='Stopped after three death recoveries' end
end
function state.recovery.wait(lease,spawn)
 if not state.recovery.active(lease)then return false end
 if not spawn and lease.deathDestination then
  local destination=lease.owner=='quest'and not state.quest.handInReady and Vector3.new(route.speaker.x,route.speaker.y,route.speaker.z)or lease.deathDestination
  local bestCost=math.huge
  for _,candidate in ipairs(state.recovery.spawns())do
   local cost=state.recovery.cost(candidate.position,destination)
   if cost<bestCost then spawn=candidate;bestCost=cost end
  end
 end
 motion.release();state.camera.release(lease)
 local old=lease.deathCharacter or player.Character;local deadline=os.clock()+80;local selected=false
 while state.recovery.active(lease)and os.clock()<deadline do
  if player.Character~=old and characterAlive()and root()then
   lease.died=false;lease.deathCharacter=nil;lease.navigation=nil;lease.travelPlan=nil
   state.died=false;state.amuletHeld=false;state.recovery.intentional=nil;state.collision.acquire(lease)
   if spawn and (root().Position-spawn.position).Magnitude>120 then note('WARN','Respawn occurred elsewhere; recalculating travel from actual character')end
   return true
  end
  if spawn and not selected then
   local screen=liveModule('RespawnScreen');local frame=screen and screen.gui and screen.gui:FindFirstChild('RespawnFrame')
   local network=liveModule('Network')
   if frame and frame.Visible and network and type(network.FireServer)=='function'then
    selected=true
    local ok,why=state.work.nativeCall(5,'RespawnSelection',network.FireServer,'setRespawnPoint',spawn.name,spawn.part)
    if not ok then note('WARN','Spawn selection: '..tostring(why))end
   end
  end
  task.wait(.2)
 end
 state.recovery.intentional=nil
 return false,'New living character not observed within 80 seconds'
end
function state.recovery.spawns()
 local result={};local util=liveModule('PlayerUtil')
 -- Avoid GetSpawnParts' unbounded WaitForChild when replication is incomplete.
 local folder=workspace:FindFirstChild('SpawnLocations');folder=folder and folder:FindFirstChild('Players')
 if folder and util and type(util.GetSpawnParts)=='function'then
  local ok,parts=pcall(util.GetSpawnParts,player)
  if ok and type(parts)=='table'then
   for _,part in ipairs(parts)do
    if typeof(part)=='Instance'and part:IsA('BasePart')and part:IsDescendantOf(workspace)then table.insert(result,{name=part.Name,part=part,position=part.Position})end
   end
  end
 end
 if player:GetAttribute('isOnboarding')~=true then
  local houses=liveModule('ClientHouses')
  if houses and type(houses.Get)=='function'then
   local ok,house=pcall(houses.Get)
   if ok and house and type(house.GetGroundPart)=='function'then
    local yes,part=pcall(house.GetGroundPart,house)
    if yes and typeof(part)=='Instance'and part:IsA('BasePart')and part:IsDescendantOf(workspace)then table.insert(result,{name='House',position=part.Position})end
   end
  end
 end
 return result
end
function state.recovery.cost(from,to)
 local offset=to-from;local settings=state.navigationSettings
 if settings.mode~='High-Altitude'or Vector3.new(offset.X,0,offset.Z).Magnitude<settings.threshold then return offset.Magnitude/state.speed end
 local height=math.max(settings.altitude,from.Y+40,to.Y+40)
 return (height-from.Y+height-to.Y+Vector3.new(offset.X,0,offset.Z).Magnitude)/state.speed
end
function state.recovery.smart(destination)
 local lease=state.work.lease;local settings=state.navigationSettings;local r=root()
 if not settings.smartRespawn or not r or not state.recovery.active(lease)or state.work.critical or bank.breaching or state.camera.current or lease.owner=='ammo'or lease.owner=='combatShop'then return true end
 local flow=lease.workflow
 if flow.resets>=settings.maxResets or os.clock()-state.recovery.lastReset<settings.respawnCooldown or player:GetAttribute('doneLoading')~=true then return true end
 local direct=state.recovery.cost(r.Position,destination);if direct<25 then return true end
 local tools=itemClient();if not tools or type(tools.GetItems)~='function'then return true end
 local ok,items=pcall(tools.GetItems);if not ok or type(items)~='table'or type(items.Tool)~='table'then return true end
 local amulet=false
 for _,item in pairs(items.Tool)do
  if type(item)~='table'then return true end
  if item.name=='Speakers Amulet'then amulet=true
  elseif item.name~='Skeleton Key'then return true end -- Unknown/loss-prone equipment makes reset uneconomical.
 end
 if amulet and lease.owner~='quest'then return true end
 local best,bestCost=nil,direct
 local speaker=Vector3.new(route.speaker.x,route.speaker.y,route.speaker.z)
 for _,spawn in ipairs(state.recovery.spawns())do
  local cost=15+state.recovery.cost(spawn.position,destination)
  if amulet and lease.owner=='quest'and not state.quest.handInReady then cost=15+state.recovery.cost(spawn.position,speaker)+12+state.recovery.cost(speaker,destination)end
  if cost+settings.minSaving<=bestCost then best,bestCost=spawn,cost end
 end
 if not best then return true end
 local network=liveModule('Network');if not network or type(network.FireServer)~='function'then return true end
 flow.resets=flow.resets+1;state.recovery.lastReset=os.clock();state.recovery.intentional=lease;lease.deathCharacter=player.Character
 note('INFO','Smart Respawn: '..best.name..', estimated '..math.floor(direct-bestCost)..' seconds saved')
 local sent,why=state.work.nativeCall(5,'SmartRespawn',network.FireServer,'resetCharacter')
 if not sent then state.recovery.intentional=nil;return false,why end
 local ready,reason=state.recovery.wait(lease,best);if not ready then return false,reason end
 if amulet and lease.owner=='quest'and not state.quest.handInReady then
  local reached,err=flyTo(route.speaker,state.token,'reacquire_speaker',state.confirmedGhost)
  if not reached then return false,err end
  if not pickupSpeaker(state.token)then return false,'Amulet reacquisition after Smart Respawn failed'end
 end
 return true
end
function state.recovery.finished(lease)
 if lease.owner=='manual'then return end
 if lease.owner=='ammo'and state.ammo.resumeOwner and not state.closed then
  local owner=state.ammo.resumeOwner;state.ammo.resumeOwner=nil
  state.recovery.pending[owner]={at=os.clock()+.5,deadline=os.clock()+90,workflow=motion.workflow(owner),tutorial=owner=='bank'}
 end
 if state.closed or lease.noRecovery or lease.navigationFailed or lease.workflow.deaths>3 then return end
 local recover=lease.died or lease.recoveredDeath
 if lease.owner=='quest'and lease.questManaged and not state.stopping and not state.quest.workflowComplete then
  if not state.setup.active and not lease.recoveredDeath and not lease.died then return end
  if lease.workflow.recoveries>=2 then return end
  lease.workflow.recoveries=lease.workflow.recoveries+1;recover=true;state.quest.stage='recovering'
 end
 if recover then
  state.recovery.pending[lease.owner]={at=os.clock()+5,deadline=os.clock()+90,workflow=lease.workflow,tutorial=lease.owner=='bank'and bank.isTutorial}
  note('WARN',lease.owner..': recovery queued; fresh state will be checked after five seconds')
 end
end
function state.recovery.tick()
 if state.closed or state.work.lease or state.work.pending then return end
 for owner,entry in pairs(state.recovery.pending)do
  if os.clock()>entry.deadline or motion.workflow(owner)~=entry.workflow then state.recovery.pending[owner]=nil
  elseif os.clock()>=entry.at and characterAlive()then
   state.recovery.pending[owner]=nil
   if owner=='quest'then state.work.request('Ghost quest',state.actions.quest)
   elseif owner=='bank'and entry.tutorial then state.work.request('Bank tutorial',state.actions.tutorial)
   elseif owner=='bank'and (bankFarm.autoMode or bankFarm.requested)then bankFarm.requested=true;if bankFarm.resume then bankFarm.resume.suspended=true end
   elseif owner=='seller'then bag.lastFail=-math.huge;state.sellRequested=true
   elseif owner=='shop'then state.work.request('Gunshop',state.actions.shop)
   elseif owner=='combatShop'and state.combat then state.combat.buySpas()end
   return
  end
 end
end
-- All travel entry points make the same optional decision; local route legs stay intact.
do
 local questFly=flyTo;local bankFly=bank.fly;local sellTravel=bag.travel
 flyTo=function(point,...)
  local ok,why=state.recovery.smart(Vector3.new(point.x,point.y,point.z));if not ok then return false,why end
  return questFly(point,...)
 end
 bank.fly=function(point,...)
  if not point then return false,'Missing saved waypoint'end
  local lease=state.work.lease;local prior=lease and lease.localRouteTravel
  if lease then lease.localRouteTravel=lease.bankAreaEntered==true end
  if not lease or not lease.localRouteTravel then
   local ok,why=state.recovery.smart(Vector3.new(point.x,point.y,point.z));if not ok then return false,why end
  end
  local ok,why=bankFly(point,...)
  if lease then lease.localRouteTravel=prior;if ok then lease.bankAreaEntered=true end end
  return ok,why
 end
 bag.travel=function(point,...)
  local ok,why=state.recovery.smart(point);if not ok then return false,why end
  return sellTravel(point,...)
 end
end

function state.work.travel(destination,tolerance)
 local lease=state.work.lease;local r=root()
 if not r or not state.recovery.active(lease)then return false,'Character or ownership unavailable'end
 local ready,why=state.recovery.smart(destination);if not ready then return false,why end
 r=root();if not r then return false,'Character unavailable after respawn'end
 local deadline=motion.activeClock()+math.max(40,state.recovery.cost(r.Position,destination)*3+30)
 while state.recovery.active(lease)and motion.activeClock()<deadline do
  r=root();if not r or not characterAlive()then return false,'Character unavailable'end
  if (r.Position-destination).Magnitude<=(tolerance or 7)then motion.arrived();motion.hold(r);return true end
  local moved,err=motion.travel(r,destination,state.speed,lease.owner);if not moved then return false,err end
  RunService.Heartbeat:Wait()
 end
 return false,'Travel canceled or timed out'
end

af.inboundSeen=setmetatable({},{__mode='k'})
function af.inbound()
 local props=workspace:FindFirstChild('Props');local folder=props and props:FindFirstChild('AirdropPlane')
 local globals=liveModule('Globals');local time=liveModule('TimeUtil');local duration=globals and globals.AIRDROPS and tonumber(globals.AIRDROPS.DROP_TIME)
 if not folder or not duration or not time or type(time.GetServerTime)~='function'then return nil end
 local ok,now=pcall(time.GetServerTime);if not ok or type(now)~='number'then return nil end
 for _,model in ipairs(folder:GetChildren())do
  local pivot=model:GetAttribute('origPivot');local started=tonumber(model:GetAttribute('airdropTime'))
  if not af.inboundSeen[model]and typeof(pivot)=='CFrame'and started and now>=started-5 and now<=started+duration*2+10 then
   return {model=model,position=pivot.Position,remaining=math.max(0,started+duration-now)}
  end
 end
end
function af.stageInbound(inbound)
 if state.work.lease then return end
 af.inboundSeen[inbound.model]=true;af.running=true;af.token=af.token+1;local token=af.token
 state.work.launch('airdrop',token,function()
  af.status='Incoming plane: staging near estimated drop point'
  local ok,why=state.work.travel(inbound.position,25)
  if not ok then af.status=tostring(why);return end
  local deadline=os.clock()+65;local goneAt
  while af.running and af.token==token and not state.closed and os.clock()<deadline do
   if afNearest()then af.status='Crate observed; handing off to actual crate tracking';return end
   if not inbound.model.Parent then goneAt=goneAt or os.clock();if os.clock()-goneAt>10 then break end end
   af.status='Staged; waiting for replicated crate';task.wait(.4)
  end
  af.status='No crate observed; staging ended'
 end)
end

state.setup={active=false,stage='Idle',status='Ready',generation=0}
function state.setup.cancel(reason)
 if not state.setup.active then return end
 state.setup.active=false;state.setup.generation=state.setup.generation+1;state.setup.status=reason or 'Stopped';state.setup.stage='Stopped'
 state.work.cancelPending('Bank tutorial');state.work.cancelPending('Ghost quest')
 state.recovery.cancel('quest');state.recovery.cancel('bank')
 local lease=state.work.lease
 if lease and (lease.owner=='quest'or lease.owner=='bank'and bank.isTutorial)then
  if lease.owner=='quest'then state.running=false;state.stopping=true;state.token=state.token+1 else bank.running=false;bank.token=bank.token+1 end
  state.camera.release(lease);motion.release()
 end
 state.collision.sync()
end
function state.setup.start()
 if state.setup.active or state.work.pending then return end
 state.setup.active=true;state.setup.stage='Bayview';state.setup.status='Checking Bayview';state.setup.deadline=os.clock()+40;state.setup.skipSent=false;state.setup.queued=false
 state.setup.generation=state.setup.generation+1;motion.newWorkflow('bank');motion.newWorkflow('quest')
end
function state.setup.bayviewReady()
 local tasks=liveModule('ClientTasks');if not tasks then return false end
 for _,name in ipairs({'BayviewTutorial','BankTutorial'})do
  if type(tasks.IsTaskComplete)=='function'then local ok,v=pcall(tasks.IsTaskComplete,name);if ok and v==true then return true end end
 end
 for _,method in ipairs({'GetTask','IsTaskAvailable'})do
  if type(tasks[method])=='function'then local ok,v=pcall(tasks[method],'BankTutorial');if ok and v~=nil and v~=false then return true end end
 end
 return false
end
function state.setup.tick()
 local setup=state.setup;if not setup.active then return end
 if setup.stage=='Bayview'then
  if state.work.lease then state.work.interruptFarm('Account setup');return end
  if state.setup.bayviewReady()then setup.stage='Bank delay';setup.deadline=os.clock()+5;setup.status='Bayview verified; bank starts in five seconds'
  elseif os.clock()>setup.deadline then state.setup.cancel('Bayview transition unverified')
  elseif not setup.skipSent then setup.skipSent=true;trySkipBayview()end
 elseif setup.stage=='Bank delay'and os.clock()>=setup.deadline then
  setup.stage='Bank';setup.status='Running recorded bank tutorial';setup.queued=true;setup.deadline=os.clock()+8
  state.work.request('Bank tutorial',state.actions.tutorial)
 elseif setup.stage=='Bank'then
  bank.check()
  if bank.done then setup.stage='Ghost delay';setup.deadline=os.clock()+10;setup.status='Bank verified twice; ghost quest starts in ten seconds'
  elseif not state.work.lease and not state.work.pending and not state.recovery.pending.bank and bank.completionRead()~=true and os.clock()>=setup.deadline then state.setup.cancel('Bank tutorial incomplete: '..tostring(bank.autoStatus))end
 elseif setup.stage=='Ghost delay'and os.clock()>=setup.deadline then
  setup.stage='Ghost';setup.status='Checking ghost quest phase';state.work.request('Ghost quest',state.actions.quest)
 elseif setup.stage=='Ghost'then
  local view=state.quest.display();setup.status=view.status..' | '..view.objective
  if state.quest.workflowComplete then setup.active=false;setup.stage='Complete';setup.status='Finished - Skeleton Key ownership verified'
  elseif not state.work.lease and not state.work.pending and not state.recovery.pending.quest then state.setup.cancel('Ghost quest incomplete: '..state.quest.lastFailure)end
 end
end

state.ammo={running=false,token=0,nextScan=0,lastNotice=-math.huge,status='Ready',settings={enabled=true,threshold=25,cooldown=90}}
if configSaved and type(configSaved.lowAmmo)=='table'then
 for k,v in pairs(configSaved.lowAmmo)do if type(v)==type(state.ammo.settings[k])then state.ammo.settings[k]=v end end
end
-- Legacy enabled was the old notice switch; keep scanning independent of popups.
state.ammo.settings.enabled=true
state.ammo.settings.threshold=math.clamp(state.ammo.settings.threshold,0,200);state.ammo.settings.cooldown=90
function state.ammo.snapshot()
 local tools=itemClient();local objects=liveModule('Objects');local result={}
 if not tools or type(tools.GetItems)~='function'or not objects or type(objects.GetData)~='function'then return result end
 local ok,items=pcall(tools.GetItems);if not ok or type(items)~='table'then return result end
 for id,item in pairs(type(items.Tool)=='table'and items.Tool or {})do
  if type(item)=='table'and type(item.name)=='string'then
   local yes,definition=pcall(objects.GetData,item.name,true)
   if yes and definition and definition.itemType=='Gun'and tonumber(item.ammo)and tonumber(item.totalAmmo)then
    result[id]={name=item.name,magazine=tonumber(item.ammo),reserve=tonumber(item.totalAmmo)}
   end
  end
 end
 return result
end
function state.ammo.request()
 if state.ammo.running or state.work.pending then return end
 motion.newWorkflow('ammo');state.work.request('Buy ammo',state.ammo.run)
end
function state.ammo.tick()
 local ammo=state.ammo
 local preferences=state.combat.v30.settings.ammo;ammo.settings.cooldown=preferences.cooldown
 if not ammo.settings.enabled or ammo.running or os.clock()<ammo.nextScan then return end
 ammo.nextScan=os.clock()+3
 for _,item in pairs(ammo.snapshot())do
  if item.reserve<=ammo.settings.threshold then
   ammo.lowStatus=item.name..': '..item.magazine..' loaded, '..item.reserve..' reserve'
   if not ammo.lastResult then ammo.status=ammo.lowStatus end
   if preferences.automatic and not state.work.pending and not state.work.critical and os.clock()-(ammo.lastAutoAttempt or -math.huge)>=preferences.cooldown then ammo.lastAutoAttempt=os.clock();ammo.request()end
   if os.clock()-ammo.lastNotice>=ammo.settings.cooldown then
    ammo.lastNotice=os.clock()
    if state.notify then state.notify('LOW AMMO',ammo.lowStatus,'Buy Ammo',ammo.request)end
   end
   return
  elseif item.magazine==0 and not ammo.lastResult then ammo.status=item.name..': magazine empty; reserve available - reload'end
 end
end
state.shopInteraction={}
function state.shopInteraction.options(npc)
 local dialogue=npc.gizmo.interaction.dialogue;local options=dialogue and dialogue.options
 if type(options)=='function'then local ok,v=pcall(options,npc.gizmo);if not ok then return {}end;options=v end
 return type(options)=='table'and options or {}
end
function state.shopInteraction.findOption(options,kind)
 for _,entry in ipairs(options)do
  local label=type(entry.text)=='string'and entry.text:gsub('<[^>]+>',''):lower():gsub('[%p]',' '):gsub('%s+',' ')or ''
  local ammo=label:find('ammo',1,true);local all=label:find('all',1,true)and label:find('gun',1,true)
  local match=kind=='bulk'and ammo and all or kind=='maxbulk'and ammo and all and label:find('max',1,true)
   or kind=='single'and ammo and not all and not label:find('max',1,true)or kind=='maxsingle'and ammo and not all and label:find('max',1,true)
   or kind=='browse'and label:find('browse',1,true)and label:find('shop',1,true)
  if match and type(entry.callback)=='function'then return entry end
 end
end
function state.shopInteraction.approach()
 local lease=state.work.lease;local origin=root()and root().Position;if not origin then return nil,'Character unavailable'end
 local function find(center,radius)
  local chosen,nearest=nil,math.huge
  for _,name in ipairs({'Justin','Erik'})do
   local npc=state.resolveNPC(name,{x=center.X,y=center.Y,z=center.Z},radius,function(g)
    if type(g.interaction.canInteract)=='function'then local ok,v=pcall(g.interaction.canInteract,g);return ok and v==true end;return true
   end)
   if npc and (npc.position-origin).Magnitude<nearest then nearest=(npc.position-origin).Magnitude;chosen=npc end
  end
  return chosen
 end
 lease.localRouteTravel=nil;lease.travelPlan=nil;lease.shopStaged=nil
 local npc=find(origin,15000)
 if not npc then
  local marker,distance=nil,math.huge
  for _,part in ipairs(game:GetService('CollectionService'):GetTagged('GameShop'))do
   if part:IsA('BasePart')and part.Name=='GunShop'and part:IsDescendantOf(workspace)and (part.Position-origin).Magnitude<distance then marker=part;distance=(part.Position-origin).Magnitude end
  end
  local staging=marker and marker.Position
  if not staging then
   -- Original exported staging points only; actual NPC presence is still required.
   for _,point in ipairs({Vector3.new(-187,82,-2806),Vector3.new(-2679,77,1494),Vector3.new(-6786,77,1310)})do
    if (point-origin).Magnitude<distance then staging=point;distance=(point-origin).Magnitude end
   end
  end
  local reached,why=state.work.travel(staging,5);if not reached then return nil,why end
  lease.shopStaged=true
  local deadline=os.clock()+6
  repeat
   if not state.recovery.active(lease)then return nil,'Shop canceled'end
   npc=find(staging,120);if npc then break end;task.wait(.15)
  until os.clock()>=deadline
 end
 if not npc then return nil,'No permitted shop NPC streamed near the shop'end
 local range=tonumber(npc.gizmo.interaction.promptDistance);if not range or range<=3 then return nil,'NPC interaction range unavailable'end
 local delta=origin-npc.position;local flat=Vector3.new(delta.X,0,delta.Z);local direction=flat.Magnitude>.01 and flat.Unit or Vector3.new(0,0,1)
 local target=npc.position+direction*math.min(5,range-2)
 local prior=lease.localRouteTravel;if lease.shopStaged then lease.localRouteTravel=true end
 state.diagnostics.snapshot('shop_travel_plan',{mode=state.navigationSettings.mode,altitude=state.navigationSettings.altitude,threshold=state.navigationSettings.threshold,localLeg=lease.localRouteTravel==true,origin=root().Position,destination=target})
 local reached,why=state.work.travel(target,.75);lease.localRouteTravel=prior;if not reached then return nil,why end
 motion.arrived();motion.hold(root())
 state.diagnostics.snapshot('shop_arrival',{origin=origin,npc=npc.name,destination=target,player=root().Position,distance=(root().Position-npc.position).Magnitude,dialogue=npc.gizmo.hasInteracted==true})
 return npc
end
function state.shopInteraction.open(npc)
 local lease=state.work.lease;if not lease then return false,'Shop ownership lost'end
 local saved=state.camera.capture(lease)
 if saved and workspace.CurrentCamera then
  local camera=workspace.CurrentCamera;local head=npc.model:FindFirstChild('Head');local target=head and head.Position or npc.position
  camera.CameraType=Enum.CameraType.Scriptable;camera.CFrame=CFrame.lookAt(root().Position+Vector3.new(0,4,0),target);camera.Focus=CFrame.new(target)
 end
 local reason='Dialogue unavailable'
 for attempt=1,3 do
  if not state.npcActive(lease.token)then return false,'Shop canceled'end
  local opened,why=state.npcDialogueInput(npc,lease.token)
  state.diagnostics.snapshot('shop_dialogue',{npc=npc.name,attempt=attempt,opened=opened,reason=why or '',distance=root()and(root().Position-npc.position).Magnitude or -1})
  if opened then return true end;reason=why
  if state.work.nativeUnknown[npc.gizmo]then break end
  if not state.quest.cleanupDialogue(lease)then return false,'Shop dialogue cleanup unconfirmed'end
  task.wait(.2)
 end
 return false,reason
end

function state.ammo.run()
 if state.work.lease or not root()then return end
 local ammo=state.ammo;ammo.lastError=nil;ammo.lastResult=nil;ammo.running=true;ammo.token=ammo.token+1;local token=ammo.token
 state.work.launch('ammo',token,function()
  local lease=state.work.lease;local origin=root().Position;local before=ammo.snapshot();local npc
  local ok,reason=pcall(function()
   local pricing=liveModule('GameShopUtil')
   if pricing and type(pricing.GetBuyableAmmoAll)=='function'then local yes,items=pcall(pricing.GetBuyableAmmoAll,player);if yes and type(items)=='table'and #items==0 then ammo.status='No owned guns need ammunition';return end end
   local chosen,approachWhy=state.shopInteraction.approach();npc=chosen;if not npc then error(approachWhy)end
   ammo.status='Opening '..npc.name
   local opened,why=state.shopInteraction.open(npc);if not opened then error(why)end
   local g=npc.gizmo;local function ready()return state.npcReady(npc,token)end
   state.work.critical=true;local deadline
   local shop=liveModule('GameShopUtil');local data=liveModule('ClientData')
   if not shop or type(shop.GetBuyableAmmoAll)~='function'or not data or type(data.Get)~='function'then error('Ammo pricing data unavailable')end
   local priced,items=pcall(shop.GetBuyableAmmoAll,player);if not priced or type(items)~='table'then error('Ammo price unavailable')end
   local price=0;for _,item in ipairs(items)do if type(item.cost)~='number'or item.cost<0 then error('Invalid ammo price')end;price=price+item.cost end
   if #items==0 then ammo.status='Ammo already full';return end
   local got,cash=pcall(data.Get,'cash');if not got or type(cash)~='number'or cash<price then error('Insufficient cash for all-gun refill ($'..price..')')end
   local options=state.shopInteraction.options(npc);local option=state.shopInteraction.findOption(options,'bulk');local individual=false
   if not option and #items==1 then
    local entry=items[1];local toolName=entry.itemState and entry.itemState.name
    if not toolName then error('Single-gun refill item identity unavailable')end
    if not state.tryEquipTool(toolName,function()return state.npcActive(token)end)then error('Single-gun refill equip unconfirmed')end
    option=state.shopInteraction.findOption(options,'single');individual=true
   end
   if not option then error('Native ammunition refill option unavailable')end
   state.diagnostics.snapshot('shop_purchase',{npc=npc.name,origin=origin,beforeCount=#items,price=price,request=individual and 'single remaining gun'or 'all guns',dialogue=g.hasInteracted==true})

   local called,accepted,panel=state.work.nativeCall(5,option,option.callback)
   if not called or not accepted or type(panel)~='table'then error('Ammo confirmation dialogue unavailable')end
   local purchase
   purchase=state.shopInteraction.findOption(panel.options or {},individual and 'maxsingle'or 'maxbulk')
   if not purchase or not ready()then error('Ammo purchase canceled or native confirmation missing')end
   before=ammo.snapshot()
   for _,entry in ipairs(items)do if not entry.itemId or not before[entry.itemId]then error('Requested gun missing from ammo snapshot; purchase withheld')end end
   ammo.status='Buying all-gun refill for $'..price
   local purchased,accepted=state.work.nativeCall(12,purchase,purchase.callback);if not purchased or accepted==false then error(tostring(accepted or 'Ammo purchase refused'))end
   local confirmed=false;deadline=os.clock()+8
   repeat
    if not state.recovery.active(lease)then error('Ammo purchase canceled')end
    local after=ammo.snapshot();local expected,changed=0,0
    for _,entry in ipairs(items)do if entry.itemId and before[entry.itemId]then expected=expected+1;local item=after[entry.itemId];local old=before[entry.itemId];if item and item.reserve+item.magazine>old.reserve+old.magazine then changed=changed+1 end end end
    confirmed=expected==#items and changed==expected and expected>0
    if confirmed then break end;task.wait(.2)
   until os.clock()>=deadline
   if not confirmed then error('Refill request returned; reserve increase unverified')end
   ammo.status='Ammo refill verified'
  end)
  if npc then state.quest.cleanupDialogue(lease)end
  state.camera.release(lease)
  state.work.critical=false
  if not ok then ammo.lastError=tostring(reason);ammo.status='Failed: '..ammo.lastError;warning(ammo.status)end
  ammo.lastResult=ammo.status
  local values={};local after=ammo.snapshot();for id,old in pairs(before)do local item=after[id];table.insert(values,old.name..': mag '..old.magazine..'->'..tostring(item and item.magazine or '?')..', reserve '..old.reserve..'->'..tostring(item and item.reserve or '?'))end;table.sort(values)
  state.diagnostics.snapshot('shop_ammo',{acknowledged=ammo.status=='Ammo refill verified',values=table.concat(values,'; ')})
  state.diagnostics.snapshot('shop_result',{status=ammo.status,origin=origin,returning=state.recovery.active(lease),npc=npc and npc.name or 'unresolved'})
  if state.recovery.active(lease)and characterAlive()then
   local back,why=state.work.travel(origin,8);if not back then ammo.status=ammo.status..'; return unconfirmed: '..tostring(why)end
  end
 end)
end

state.work.lastScan=0
-- Manual flight parks an automation worker at a cooperative, noncritical movement boundary.
state.manual={enabled=false,requested=false,blocked=false,token=0,keys={},touch={},velocity=Vector3.zero,status='Off',recording=nil}
do
 local m=state.manual
 local saved=configSaved and type(configSaved.keybinds)=='table'and configSaved.keybinds or {}
 state.keybinds.fly=type(saved.fly)=='string'and saved.fly or 'F';state.keybinds.noclip=type(saved.noclip)=='string'and saved.noclip or 'N'
 state.keybinds.flyEnabled=saved.flyEnabled~=false;state.keybinds.noclipEnabled=saved.noclipEnabled~=false
 m.reserved={LeftAlt=true,RightAlt=true,W=true,A=true,S=true,D=true,Space=true,LeftControl=true,Escape=true,Unknown=true,Return=true,Backspace=true,Tab=true}
 if state.keybinds.fly==state.keybinds.noclip and state.keybinds.fly~=''then state.keybinds.flyEnabled=false;state.keybinds.noclipEnabled=false;m.status='Saved key conflict: choose distinct Fly and Noclip keys'end
 function m.keyName(event)local key=event.KeyCode;return typeof(key)=='EnumItem'and key.Name or tostring(key):match('%.([^%.]+)$')or tostring(key)end
 function m.bind(action,key)
  if action~='fly'and action~='noclip'then return false,'Unknown action'end
  if key~=''then
   local ok,value=pcall(function()return Enum.KeyCode[key]end)
   if not ok or not value or m.reserved[key]then return false,'Reserved or unsupported key'end
   local other=action=='fly'and 'noclip'or 'fly'
   if state.keybinds[other]==key then return false,'Already bound to '..other end
  end
  state.keybinds[action]=key;saveSettings();return true
 end
 function m.set(on)
  if state.closed then return end
  if on then
   if m.enabled or m.requested then return end
   m.requested=true;m.blocked=true;m.status=state.work.lease and 'Waiting for a safe movement handoff'or 'Starting manual flight'
  else
   m.requested=false;m.enabled=false;m.token=m.token+1;m.velocity=Vector3.zero;m.keys={};m.touch={}
   m.status=m.parked and 'Automation paused · press Resume automation'or 'Off'
   if motion.lease and motion.lease.owner=='manual'then motion.release()end
   if not m.parked then m.blocked=false end
   state.collision.sync()
  end
 end
 function m.resume()
  m.set(false);m.resumeRequested=true;m.status='Resuming paused automation';m.tick()
 end
 function m.safeBoundary(lease)
  if not m.requested or m.enabled or m.parked or lease.owner=='manual'then return true end
  if state.work.critical or bank.breaching or lease.rubberbandRecovery or lease.elevatorRide or lease.elevatorRequest and not lease.elevatorRequest.finished or state.camera.current or state.quest.dialogue then
   m.status='Waiting for current interaction to finish';return true
  end
  if motion.callers[coroutine.running()]~=lease then return true end
  local pausedAt=os.clock();m.parked=lease;m.parkedRoot=root();m.status=lease.owner..' paused · manual flight'
  motion.release();state.collision.release(lease);state.work.lease=nil;lease.navigation=nil;lease.travelPlan=nil
  m.launch()
  while not state.closed and lease.token==motion.ownerGeneration(lease.owner)and state.work.lease~=lease do task.wait(.05)end
  if state.closed or lease.token~=motion.ownerGeneration(lease.owner)then
   if m.parked==lease then m.parked=nil end;return false,'Paused workflow canceled'
  end
  lease.manualPausedDuration=(lease.manualPausedDuration or 0)+(os.clock()-pausedAt)
  lease.navigation=nil;lease.travelPlan=nil;lease.physicsSince=nil
  if lease.landing then lease.landing.nextProbe=nil;lease.landing.waitStarted=nil end
  state.collision.acquire(lease);return true,nil,true
 end
 function m.direction()
  local cam=workspace.CurrentCamera;if not cam then return Vector3.zero end
  local x,z,y=0,0,0
  if not UserInputService:GetFocusedTextBox()then
   x=(m.keys.D and 1 or 0)-(m.keys.A and 1 or 0);z=(m.keys.W and 1 or 0)-(m.keys.S and 1 or 0);y=(m.keys.Space and 1 or 0)-(m.keys.LeftControl and 1 or 0)
  end
  x=x+(m.touch.right and 1 or 0)-(m.touch.left and 1 or 0);z=z+(m.touch.forward and 1 or 0)-(m.touch.back and 1 or 0);y=y+(m.touch.up and 1 or 0)-(m.touch.down and 1 or 0)
  local look=cam.CFrame.LookVector;local forward=Vector3.new(look.X,0,look.Z)
  if forward.Magnitude<.01 then forward=Vector3.new(0,0,-1)else forward=forward.Unit end
  local right=Vector3.new(-forward.Z,0,forward.X);local d=right*x+forward*z+Vector3.new(0,y,0)
  return d.Magnitude>1 and d.Unit or d
 end
 function m.step(part,dt)
  local stable,why,waiting=motion.pose.check(part);if not stable then motion.hold(part);m.velocity=Vector3.zero;if not waiting then m.set(false);m.status=why or 'Manual flight stopped by character state'end;return end
  if UserInputService:GetFocusedTextBox()then m.keys={}end
  local desired=m.direction()*state.speed
  m.velocity=m.velocity:Lerp(desired,1-math.exp(-math.clamp(dt,.001,.1)*18))
  if m.velocity.Magnitude<.2 then m.velocity=Vector3.zero;motion.hold(part);return end
  local delta=m.velocity*.12
  if not state.manualNoclipEnabled then
   local params=RaycastParams.new();params.FilterType=Enum.RaycastFilterType.Exclude;params.FilterDescendantsInstances={player.Character};params.RespectCanCollide=true
   local ok,hit=pcall(workspace.Blockcast,workspace,part.CFrame,Vector3.new(2,4,2),delta,params)
   if not ok then m.status='Collision query unavailable · enable noclip explicitly or stop';motion.hold(part);return end
   if hit then delta=delta.Unit*math.max(0,hit.Distance-.3);m.velocity=Vector3.zero end
  end
  if os.clock()<(m.nextRetarget or 0)then return end;m.nextRetarget=os.clock()+.04
  motion.guard.acquire(part);motion.pose.acquire(part)
  motion.beginTween(part,part.CFrame+delta,.12,'travel',part.Position+delta,state.speed)
 end
 function m.launch()
  if not m.requested or state.work.lease or not characterAlive()then return end
  m.enabled=true;m.requested=false;m.token=m.token+1;local token=m.token;motion.newWorkflow('manual')
  state.work.launch('manual',token,function()
   local lease=state.work.lease;lease.ignorePullbacks=true;lease.manual=true
   local r=root();m.character=player.Character;m.velocity=Vector3.zero
   if not motion.prepare(r)then m.enabled=false;return end
   motion.lease=lease;motion.owner='manual';motion.ownerStamp=token;m.status='Manual flight · '..(m.parked and m.parked.owner..' paused'or 'WASD / Space / Ctrl')
   while m.enabled and m.token==token and not state.closed and characterAlive()and root()==r do
    local dt=RunService.Heartbeat:Wait();if not m.enabled or m.token~=token then break end;m.step(r,tonumber(dt)or .016)
   end
   if not characterAlive()or root()~=r then m.enabled=false;m.requested=false;m.status='Manual flight stopped after character change'end
   m.velocity=Vector3.zero;m.keys={};m.touch={};motion.release()
   if not m.parked then m.blocked=false end
  end)
 end
 function m.tick()
  if m.parked and m.parked.token~=motion.ownerGeneration(m.parked.owner)then m.parked=nil;if not m.enabled and not m.requested then m.blocked=false end end
  if m.resumeRequested and not state.work.lease then
   m.resumeRequested=false;local lease=m.parked;m.parked=nil;m.blocked=false
   if lease and lease.token==motion.ownerGeneration(lease.owner)then state.work.lease=lease;lease.navigation=nil;lease.travelPlan=nil;m.status='Automation resumed'else m.status='Off'end
   state.collision.sync();return
  end
  if m.requested and not state.work.lease then m.launch()end
 end
 table.insert(state.connected,UserInputService.InputBegan:Connect(function(event,processed)
  local key=m.keyName(event)
  if m.recording then
   if UserInputService:GetFocusedTextBox()or processed then return end
   local action=m.recording
   if key=='Escape'then m.recording=nil;m.status='Key recording canceled';return end
   local ok,why=m.bind(action,key);if ok then m.recording=nil;m.status=action..' bound to '..key else m.status=why end;return
  end
  if processed or UserInputService:GetFocusedTextBox()or m.keys[key]then return end
  m.keys[key]=true
  if not UserInputService.TouchEnabled and (not state.boot or state.boot.complete)then
   if state.keybinds.flyEnabled and key==state.keybinds.fly and key~=''then m.set(not(m.enabled or m.requested))
   elseif state.keybinds.noclipEnabled and key==state.keybinds.noclip and key~=''then local _,ok,why=state.setNoclip(not state.manualNoclipEnabled);if ok then saveSettings()else m.status=why end end
  end
 end))
 table.insert(state.connected,UserInputService.InputEnded:Connect(function(event)m.keys[m.keyName(event)]=nil end))
 table.insert(state.connected,UserInputService.WindowFocusReleased:Connect(function()m.keys={};m.touch={};m.recording=nil end))
end

function state.work.tick()
  if state.closed then return end
  state.manual.tick();if state.manual.blocked then return end
  state.recovery.tick();state.setup.tick();state.ammo.tick()
  local lease=state.work.lease
  local drop
  local inbound=(af.enabled or af.requested)and af.inbound()or nil
  if af.enabled or af.requested then
    drop=afNearest()
    if drop and (af.retryAt[drop]or 0)>os.clock()then drop=nil end
    -- Late ground loot is discovered independently of the worker, including while bank is active.
    if os.clock()>=(state.work.nextFloorScan or 0)then
    state.work.nextFloorScan=os.clock()+1.5
    for id,model in pairs(af.knownFloorIds)do if typeof(model)=='Instance'and not model.Parent then af.knownFloorIds[id]=nil end end
    for crate,entry in pairs(af.observed)do
      if not crate.Parent then af.observed[crate]=nil
      else
        local pos=crate.PrimaryPart and crate.PrimaryPart.Position or entry.position
        if pos then
          for id,model in pairs(af.groundModels(pos,85))do
            if not af.knownFloorIds[id]and not entry.baseline[id]then
              local name=af.readLoot(model)
              if name and filterMatches(name)then af.queuedSweeps[crate]={position=pos,baseline=entry.baseline};break end
            end
          end
        end
      end
    end
  end
  end
  local sweepCrate,sweep
  if af.enabled or af.requested then
    for crate,entry in pairs(af.queuedSweeps)do
      if (af.retryAt[crate]or 0)<=os.clock()then sweepCrate,sweep=crate,entry;break end
    end
  end
  if state.work.pending then
    if lease then state.work.interruptFarm(state.work.pending.name);return end
    local pending=state.work.pending;state.work.dispatching=pending;state.work.pending=nil
    local ok,why=pcall(pending.callback)
    if state.work.dispatching==pending then state.work.dispatching=nil end
    if not ok then warning(pending.name..': '..tostring(why))end
    state.collision.sync();return
  end
  if lease then
    if lease.owner=='bank'and bankFarm.running and (drop or sweep or inbound)then state.work.interruptFarm('Airdrop priority')end
    if state.sellRequested and (lease.owner=='airdrop'or bankFarm.running)then state.work.interruptFarm('Bag sale')end
    return
  end
  if not characterAlive()then
    if bankFarm.autoMode then bankFarm.status='Recovering · waiting for character'end
    if af.enabled then af.status='Recovering · waiting for character'end
    return
  end
  if state.sellRequested and os.clock()-bag.lastFail>=60 then
    if bag.informationReady and bag.value>0 then bag.sell();return
    else state.sellRequested=false;af.needsSell=false;bag.status='No sellable contents observed'end
  end
  if af.needsSell and os.clock()-bag.lastFail<60 then drop=nil;sweep=nil;af.status='Waiting · seller retry cooldown'end
  if drop then af.run(drop);return end
  if sweep then af.run(sweepCrate,sweep);return end
  if inbound then af.stageInbound(inbound);return end
  if af.enabled then af.status='Waiting · no eligible airdrop'end
  if bankFarm.autoMode or bankFarm.requested then
    local observed=bankFarm.snapshot
    if bankFarm.observerDirty or os.clock()>=(bankFarm.nextObservation or 0) or not observed or not observed.model:IsDescendantOf(workspace) then observed=observeVault()
    else local ok=pcall(bankFarm.availability,observed);if not ok then observed=observeVault()end end
    local permitted,filterWhy=bankFarm.filterDecision(observed)
    if not observed then bankFarm.status=bankFarm.observationStatus;return end
    if not permitted then bankFarm.status=filterWhy;return end
    local base=observed.id..':'..tostring(observed.generation)..':'..tostring(observed.resetStamp or 'unreported')
    local status=observed.doorState
    if bankFarm.cycleBase~=base or bankFarm.wasOpen==true and status=='CLOSED' then
      bankFarm.cycleSerial=(bankFarm.cycleSerial or 0)+1;bankFarm.cycleBase=base;bankFarm.resume=nil
    end
    bankFarm.wasOpen=status=='OPEN'
    local cycle=base..':'..tostring(bankFarm.cycleSerial or 0)
    local available=observed.availability=='AVAILABLE' or observed.availability=='UNKNOWN' and status=='OPEN'
    if not available then bankFarm.waitedUnavailable=true;bankFarm.status=observed.availabilityEvidence;return end
    -- Actual newly available loot/closed door may resume immediately; a timer alone cannot.
    local resumed=bankFarm.waitedUnavailable and observed.availability=='AVAILABLE'
    bankFarm.waitedUnavailable=not available
    if bankFarm.resume and bankFarm.resume.suspended or bankFarm.requested or resumed or os.time()-(bankFarm.lastAttemptedCycle[cycle]or 0)>=(bankFarm.retryDelay or 1200) then
      bankFarm.run(observed,cycle)
    else bankFarm.status='Vault observed · Waiting for retry interval' end

  end
end
-- A single modest-rate scheduler; observers and bag reads do not depend on the UI being visible.
task.spawn(function()
  local nextBag,nextBank,nextTracker=0,0,0
  while not state.closed do
    local ok,err=pcall(function()
      local now=os.clock();motion.expireChains()
      if now>=nextBag then nextBag=now+2;bag.tick();state.quest.refreshKey()end
      if now>=nextBank then nextBank=now+4;bank.check()end
      if bankFarm.observerDirty or now>=(bankFarm.nextObservation or 0) then observeVault() end
      if now>=nextTracker then nextTracker=now+28;syncExisting()end
      state.work.tick()
    end)
    if not ok then note('WARN','Scheduler: '..tostring(err))end
    task.wait(.5)
  end
end)

-- Visual reference: REDLINE Refined Interactive Hub v2.
-- This is native Roblox UI; preview-only statistics and controls are not imported.
do
local TweenService=game:GetService('TweenService')
-- UI connections are owned separately from character and scheduler connections.
local C={base=Color3.fromRGB(18,21,27),nav=Color3.fromRGB(26,30,37),card=Color3.fromRGB(26,30,37),raised=Color3.fromRGB(34,40,50),line=Color3.fromRGB(52,59,70),red=Color3.fromRGB(142,64,80),soft=Color3.fromRGB(48,37,45),white=Color3.fromRGB(240,242,245),muted=Color3.fromRGB(169,178,190),dim=Color3.fromRGB(137,147,164),green=Color3.fromRGB(101,185,141),pink=Color3.fromRGB(161,81,96),amber=Color3.fromRGB(209,178,120)}
local function connect(c)
  if ui.scope then
    ui.scopes[ui.scope]=ui.scopes[ui.scope]or {};table.insert(ui.scopes[ui.scope],c)
  else table.insert(ui.connections,c)end
  return c
end
local function clearUI()
  for _,c in ipairs(ui.connections or {})do pcall(function()c:Disconnect()end)end
  for _,connections in pairs(ui.scopes or {})do for _,c in ipairs(connections)do pcall(function()c:Disconnect()end)end end
  for _,animation in pairs(ui.animations or {})do pcall(function()animation:Cancel();animation:Destroy()end)end
end

local function mk(kind,parent,properties)
  local object=Instance.new(kind)
  for key,value in pairs(properties or {})do object[key]=value end
  object.Parent=parent
  return object
end
local function tween(object,properties,time,style)
  if not object or not object.Parent then return end
  if ui.animations and ui.animations[object] then pcall(function()ui.animations[object]:Cancel();ui.animations[object]:Destroy()end)end
  local anim=TweenService:Create(object,TweenInfo.new(time or .18,style or Enum.EasingStyle.Quad,Enum.EasingDirection.Out),properties)
  ui.animations=ui.animations or setmetatable({},{__mode='k'});ui.animations[object]=anim
  anim.Completed:Once(function()
    if ui.animations and ui.animations[object]==anim then ui.animations[object]=nil end
    pcall(function()anim:Destroy()end)
  end)
  anim:Play();return anim
end
local function rounded(object,radius)
  mk('UICorner',object,{CornerRadius=UDim.new(0,radius or 7)})
  return object
end
local function stroke(object,color)
  return mk('UIStroke',object,{Color=color or C.line,Thickness=1,ApplyStrokeMode=Enum.ApplyStrokeMode.Border})
end
-- Font-independent icons: native geometry, no glyphs, image downloads or asset permissions.
local function drawIcon(parent,kind,color,size)
  local icon=mk('Frame',parent,{Name='Icon_'..kind,BackgroundTransparency=1,Size=UDim2.fromOffset(size or 18,size or 18),Active=false})
  local function segment(x1,y1,x2,y2)
    local dx,dy=x2-x1,y2-y1
    return mk('Frame',icon,{Name='Stroke',AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale((x1+x2)/40,(y1+y2)/40),
      Size=UDim2.new(math.sqrt(dx*dx+dy*dy)/20,0,0,1.6),Rotation=math.deg(math.atan2(dy,dx)),BackgroundColor3=color,BorderSizePixel=0,Active=false})
  end
  local function ring(x,y,diameter)
    local circle=rounded(mk('Frame',icon,{AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(x/20,y/20),Size=UDim2.fromScale(diameter/20,diameter/20),BackgroundTransparency=1,Active=false}),99)
    stroke(circle,color).Thickness=1.5
  end
  if kind=='home'then
    segment(2,9,10,2);segment(10,2,18,9);segment(5,8,5,18);segment(5,18,15,18);segment(15,18,15,8);segment(9,18,9,12);segment(9,12,12,12);segment(12,12,12,18)
  elseif kind=='events'then
    segment(10,2,18,10);segment(18,10,10,18);segment(10,18,2,10);segment(2,10,10,2);segment(10,6,10,11);ring(10,14,1.5)
  elseif kind=='combat'then
    ring(10,10,12);segment(10,1,10,6);segment(10,14,10,19);segment(1,10,6,10);segment(14,10,19,10);ring(10,10,2)
  elseif kind=='farm'then
    segment(3,5,17,5);segment(17,5,17,17);segment(17,17,3,17);segment(3,17,3,5);segment(3,9,17,9);segment(8,5,8,9);segment(12,5,12,9);segment(8,13,12,13)
  elseif kind=='settings'then
    ring(10,10,11);ring(10,10,4)
    for index=0,7 do local a=index*math.pi/4;segment(10+math.cos(a)*6,10+math.sin(a)*6,10+math.cos(a)*8.5,10+math.sin(a)*8.5)end
  elseif kind=='close'then segment(5,5,15,15);segment(15,5,5,15)
  elseif kind=='minimize'then segment(4,10,16,10)
  elseif kind=='refresh'then
    for index=0,9 do local a=math.rad(35+index*28);local b=math.rad(35+(index+1)*28);segment(10+6*math.cos(a),10+6*math.sin(a),10+6*math.cos(b),10+6*math.sin(b))end
    segment(14.2,5.8,14.2,1.5);segment(14.2,5.8,18.5,5.8)
  elseif kind=='chevron'then segment(5,8,10,13);segment(10,13,15,8)
  elseif kind=='check'then segment(4,10,8,14);segment(8,14,16,5)
  elseif kind=='dot'then
    rounded(mk('Frame',icon,{AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(.5,.5),Size=UDim2.fromScale(.4,.4),BackgroundColor3=color,BorderSizePixel=0,Active=false}),99)
  end
  return icon
end
-- Only decorated controls subscribe; status updates retain real drawn checkmarks.
local function textIcon(object,kind)
  if object:FindFirstChild('TextIcon')then return end
  local icon=drawIcon(object,kind,object.TextColor3,14);icon.Name='TextIcon'
  icon.AnchorPoint=Vector2.new(1,.5);icon.Position=UDim2.new(1,-7,.5,0)
  local rewriting=false;local rendered
  local function update()
    if rewriting then return end
    local text=object.Text
    if text==rendered then return end
    local found=text:find(kind=='check'and '✓'or '▾',1,true)
    icon.Visible=kind~='check'or found~=nil
    if found then
      rewriting=true;rendered=text:gsub(' *'..(kind=='check'and '✓'or '▾')..' *$','')..'    ';object.Text=rendered;rewriting=false
    else rendered=nil
    end
  end
  connect(object:GetPropertyChangedSignal('Text'):Connect(update));update()
  return icon
end

local function pad(object,top,right,bottom,left)
  mk('UIPadding',object,{PaddingTop=UDim.new(0,top),PaddingRight=UDim.new(0,right),PaddingBottom=UDim.new(0,bottom),PaddingLeft=UDim.new(0,left)})
end
local function order(object)
  local parent=object.Parent
  if parent and parent:FindFirstChildOfClass('UIListLayout') then
    local sequence=(parent:GetAttribute('RedlineOrder') or 0)+1
    parent:SetAttribute('RedlineOrder',sequence);object.LayoutOrder=sequence
  end
  return object
end
local function stack(object,spacing,horizontal)
  mk('UIListLayout',object,{Padding=UDim.new(0,spacing or 7),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=horizontal and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top})
end
local function txt(parent,text,height,size,color,bold)
  return order(mk('TextLabel',parent,{BackgroundTransparency=1,Size=UDim2.new(1,0,0,height or 18),Text=text or '',Font=bold and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=math.max(11,size or 12),TextColor3=color or C.white,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextTruncate=Enum.TextTruncate.AtEnd}))
end
local function row(parent,height)
  return order(mk('Frame',parent,{BackgroundTransparency=1,Size=UDim2.new(1,0,0,height or 28)}))
end
local function card(parent,title,subtitle)
  local object=order(rounded(mk('Frame',parent,{Name=title,Size=UDim2.new(1,-2,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=C.card,BorderSizePixel=0}),8))
  stroke(object,C.line);pad(object,11,14,11,14);stack(object,7)
  txt(object,title,23,14,C.white,true)
  if subtitle then local sub=txt(object,subtitle,32,12,C.dim);sub.TextWrapped=true;sub.TextTruncate=Enum.TextTruncate.None end
  return object
end
local function btn(parent,label,callback,width,height,accent)
  local base=accent and C.soft or C.raised
  local button=rounded(mk('TextButton',parent,{BackgroundColor3=base,BorderSizePixel=0,Text=label,TextColor3=C.white,Font=Enum.Font.GothamMedium,TextSize=12,AutoButtonColor=false,Size=UDim2.fromOffset(width or 110,height or 30)}),6)
  local symbol=({['−']='minimize',['⟳']='refresh',['×']='close'})[label]
  if symbol then
    button.Text='';button.Name=symbol..'Button'
    local icon=drawIcon(button,symbol,C.white,17);icon.AnchorPoint=Vector2.new(.5,.5);icon.Position=UDim2.fromScale(.5,.5)
  elseif label:find('▾',1,true)then textIcon(button,'chevron')
  elseif label:find('✓',1,true)then textIcon(button,'check')end
  button:SetAttribute('Accent',accent==true)
  local function currentColor()return button:GetAttribute('Accent') and C.soft or C.raised end
  stroke(button,accent and C.red or C.line)
  connect(button.MouseEnter:Connect(function()if button.Active then tween(button,{BackgroundColor3=currentColor():Lerp(C.white,.09)},.15)end end))
  connect(button.MouseLeave:Connect(function()tween(button,{BackgroundColor3=currentColor()},.15)end))
  connect(button.Activated:Connect(function()
    if not button.Active then return end
    local ok,err=pcall(callback)
    if not ok then warning('Control '..label..': '..tostring(err))end
  end))
  return button
end
local function accent(button,on)
  button:SetAttribute('Accent',on==true)
  tween(button,{BackgroundColor3=on and C.soft or C.raised},.15)
  local border=button:FindFirstChildOfClass('UIStroke');if border then tween(border,{Color=on and C.pink or C.line},.15)end
end
local function action(parent,label,callback,width,accent)
  local caption=parent:FindFirstChild('RowLabel')
  if caption then caption.Size=UDim2.new(1,-((width or 110)+12),1,0)end
  local button=btn(parent,label,callback,width,30,accent)
  button.AnchorPoint=Vector2.new(1,.5);button.Position=UDim2.fromScale(1,.5)
  return button
end
local function line(parent,label)
  local frame=row(parent,36)
  local labelObject=txt(frame,label,36,12,C.muted);labelObject.Name='RowLabel'
  labelObject.Size=UDim2.new(1,-128,1,0)
  return frame,labelObject
end
local function divider(parent)
  return order(mk('Frame',parent,{BackgroundColor3=C.line,BorderSizePixel=0,Size=UDim2.new(1,0,0,1)}))
end
local function toggle(parent,label,get,set,locked)
  local frame,labelObject=line(parent,label)
  local button=rounded(mk('TextButton',frame,{AnchorPoint=Vector2.new(1,.5),Position=UDim2.fromScale(1,.5),Size=UDim2.fromOffset(46,26),Text='',AutoButtonColor=false,BorderSizePixel=0,BackgroundColor3=C.raised}),11)
  stroke(button)
  local knob=rounded(mk('Frame',button,{Size=UDim2.fromOffset(18,18),Position=UDim2.fromOffset(4,4),BorderSizePixel=0,BackgroundColor3=C.muted}),8)
  local previous,previousLocked
  local function sync()
    local active=get()==true;local disabled=locked and locked()==true or false
    if active==previous and disabled==previousLocked then return end
    previous=active;previousLocked=disabled
    button.Active=not disabled;button.Selectable=not disabled
    button:SetAttribute('AutomationLocked',disabled)
    labelObject.Text=disabled and (label..' · ON')or label
    labelObject.TextColor3=disabled and C.dim or C.muted
    tween(button,{BackgroundColor3=disabled and C.line or active and C.soft or C.raised},.16)
    tween(knob,{Position=UDim2.fromOffset(active and 24 or 4,4),BackgroundColor3=disabled and C.dim or active and C.pink or C.muted},.16)
  end
  connect(button.Activated:Connect(function()
    if locked and locked()then sync();return end
    local ok,err=pcall(set,not get())
    if not ok then warning(tostring(err))end
    sync()
  end))
  sync();return sync,frame,button
end
local function input(parent,placeholder)
  local field=order(rounded(mk('TextBox',parent,{Size=UDim2.new(1,0,0,34),BackgroundColor3=C.base,BorderSizePixel=0,Text='',PlaceholderText=placeholder,ClearTextOnFocus=false,TextColor3=C.white,PlaceholderColor3=C.dim,Font=Enum.Font.Gotham,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left}),5))
  local border=stroke(field);pad(field,0,10,0,10)
  connect(field.Focused:Connect(function()tween(border,{Color=C.red},.14)end))
  connect(field.FocusLost:Connect(function()tween(border,{Color=C.line},.14)end))
  return field
end
local function scroll(parent,height)
  local object=order(rounded(mk('ScrollingFrame',parent,{Size=UDim2.new(1,0,0,height),BackgroundColor3=C.nav,BorderSizePixel=0,CanvasSize=UDim2.new(),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=4,ScrollBarImageColor3=Color3.fromRGB(103,83,93),ScrollingDirection=Enum.ScrollingDirection.Y}),6))
  stroke(object);pad(object,4,7,4,6);stack(object,3);return object
end
local function progress(parent,height)
  local track=order(rounded(mk('Frame',parent,{Size=UDim2.new(1,0,0,height or 4),BackgroundColor3=C.line,BorderSizePixel=0,ClipsDescendants=true}),5))
  return rounded(mk('Frame',track,{Size=UDim2.fromScale(0,1),BackgroundColor3=C.red,BorderSizePixel=0}),5)
end
local function slider(parent,label,min,max,step,get,set,unit)
  local heading=row(parent,20)
  txt(heading,label,20,10,C.muted).Size=UDim2.new(1,-100,1,0)
  local value=txt(heading,'',20,10,C.pink);value.Position=UDim2.new(1,-100,0,0);value.Size=UDim2.fromOffset(100,20);value.TextXAlignment=Enum.TextXAlignment.Right
  local hit=order(mk('TextButton',parent,{Size=UDim2.new(1,0,0,20),Text='',BackgroundTransparency=1,AutoButtonColor=false}))
  local track=rounded(mk('Frame',hit,{Position=UDim2.new(0,6,.5,-2),Size=UDim2.new(1,-12,0,4),BorderSizePixel=0,BackgroundColor3=C.line}),3)
  local fill=rounded(mk('Frame',track,{Size=UDim2.fromScale(0,1),BackgroundColor3=C.red,BorderSizePixel=0}),3)
  local knob=rounded(mk('Frame',track,{AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(0,.5),Size=UDim2.fromOffset(11,11),BackgroundColor3=C.pink,BorderSizePixel=0}),6)
  local drag,previous
  local function sync()
    local number=math.clamp(get(),min,max)
    if number~=previous then
      previous=number;local f=(number-min)/(max-min)
      fill.Size=UDim2.fromScale(f,1);knob.Position=UDim2.fromScale(f,.5)
      value.Text=(step<1 and string.format(step<.1 and '%.2f'or '%.1f',number)or tostring(math.floor(number+.5)))..(unit or '')
    end
  end
  local function change(x)
    local fraction=math.clamp((x-track.AbsolutePosition.X)/math.max(1,track.AbsoluteSize.X),0,1)
    local number=math.clamp(min+math.floor((fraction*(max-min))/step+.5)*step,min,max)
    if number==previous then return end
    local ok,err=pcall(set,number)
    if not ok then warning(tostring(err))end
    sync()
  end
  connect(hit.InputBegan:Connect(function(event)
    if event.UserInputType==Enum.UserInputType.MouseButton1 or event.UserInputType==Enum.UserInputType.Touch then drag=event;change(event.Position.X)end
  end))
  connect(UserInputService.InputChanged:Connect(function(event)
    if drag and (event==drag or event.UserInputType==Enum.UserInputType.MouseMovement)then change(event.Position.X)end
  end))
  connect(UserInputService.InputEnded:Connect(function(event)if event==drag then drag=nil;saveSettings()end end))
  sync();return sync
end
local function fmt(seconds)
  seconds=math.max(0,math.floor(seconds or 0));return ('%02d:%02d'):format(math.floor(seconds/60),seconds%60)
end
local function cash(amount)
  local integer=tostring(math.floor(amount or 0))
  repeat local nextValue,count=integer:gsub('^(%-?%d+)(%d%d%d)','%1,%2');integer=nextValue until count==0
  return '$'..integer
end
-- Screen overlays are siblings of the window so menus cannot be clipped by scrolling cards.
local function closeMenu()
  if not ui.menu then return end
  local menu=ui.menu;ui.menu=nil
  tween(menu.panel,{GroupTransparency=1},.12)
  menu.backdrop.Visible=false
  task.delay(.13,function()if menu.panel.Parent and ui.menu~=menu then menu.panel.Visible=false end end)
  if menu.search then menu.search:ReleaseFocus()end
end
local function dropdown(anchor,options,get,set,multiple,title,external)
  local screen=state.gui
  local backdrop=mk('TextButton',screen,{Name='MenuDismiss',Visible=false,Size=UDim2.fromScale(1,1),Text='',BackgroundTransparency=1,AutoButtonColor=false,ZIndex=90})
  local panel=rounded(mk('CanvasGroup',screen,{Name='Dropdown',Visible=false,Size=UDim2.fromOffset(244,270),BackgroundColor3=C.card,BorderSizePixel=0,GroupTransparency=1,ZIndex=91}),9)
  stroke(panel,C.line);pad(panel,10,10,10,10);stack(panel,7)
  local heading=txt(panel,title or 'Select',21,12,C.white,true)
  local search=input(panel,'Search options...')
  local list=scroll(panel,178);list.BackgroundTransparency=1
  local menu={panel=panel,backdrop=backdrop,search=search,anchor=anchor};local rows={}
  local function update()
    local selection=get();local count=0;local query=search.Text:lower()
    for _,record in ipairs(rows)do
      local on=multiple and selection[record.value]==true or not multiple and selection==record.value
      if on then count=count+1 end
      record.button.Text='      '..record.value;record.check.Visible=on
      record.button.Visible=query==''or record.value:lower():find(query,1,true)~=nil
      accent(record.button,on)
    end
    local caption=selection=='Default'and anchor:GetAttribute('DefaultLabel')or tostring(selection)
    anchor.Text=multiple and (selection['All Vaults'] and 'All Vaults  ▾' or tostring(count)..' selected  ▾') or caption..'  ▾'
  end
  for _,value in ipairs(options)do
    local button=btn(list,value,function()
      if multiple then set(value,not get()[value]);update()else set(value);update();closeMenu()end
    end,210,30)
    button.Size=UDim2.new(1,-2,0,30);order(button);button.TextXAlignment=Enum.TextXAlignment.Left
    local check=drawIcon(button,'check',C.white,14);check.Position=UDim2.new(0,6,.5,-7)
    table.insert(rows,{value=value,button=button,check=check})
  end
  local function place()
    local view=workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1000,700)
    local keyboardTop=view.Y
    pcall(function()if UserInputService.OnScreenKeyboardVisible then keyboardTop=math.min(keyboardTop,UserInputService.OnScreenKeyboardPosition.Y)end end)
    view=Vector2.new(view.X,math.max(150,keyboardTop))
    local size=anchor.AbsoluteSize;local position=anchor.AbsolutePosition
    local width=math.max(180,math.min(260,view.X-20));local height=math.min(294,view.Y-20)
    panel.Size=UDim2.fromOffset(width,height);list.Size=UDim2.new(1,0,0,math.max(60,height-88))
    local below=position.Y+size.Y+6
    local y=below+height<=view.Y-10 and below or math.max(10,position.Y-height-6)
    panel.Position=UDim2.fromOffset(math.clamp(position.X+size.X-width,10,math.max(10,view.X-width-10)),y)
  end
  local function openAt(newAnchor,newTitle)
    if ui.menu==menu and (not newAnchor or newAnchor==anchor)then closeMenu();return end
    if newAnchor then anchor=newAnchor;menu.anchor=newAnchor end
    if newTitle then heading.Text=newTitle end
    closeMenu();ui.menu=menu;update();place();backdrop.Visible=true;panel.Visible=true
    panel.GroupTransparency=1;tween(panel,{GroupTransparency=0},.16)
  end
  if not external then connect(anchor.Activated:Connect(function()openAt()end))end
  connect(backdrop.Activated:Connect(closeMenu))
  connect(search:GetPropertyChangedSignal('Text'):Connect(update))
  connect(anchor:GetPropertyChangedSignal('AbsolutePosition'):Connect(function()if ui.menu==menu then place()end end))
  connect(anchor:GetPropertyChangedSignal('AbsoluteSize'):Connect(function()if ui.menu==menu then place()end end))
  for _,property in ipairs({'OnScreenKeyboardVisible','OnScreenKeyboardPosition','OnScreenKeyboardSize'})do pcall(function()connect(UserInputService:GetPropertyChangedSignal(property):Connect(function()if ui.menu==menu then place()end end))end)end
  update();return update,openAt
end
local function expand(panel,show)
  panel:SetAttribute('ExpandGeneration',(panel:GetAttribute('ExpandGeneration')or 0)+1)
  local generation=panel:GetAttribute('ExpandGeneration')
  if show then
    panel.Visible=true;panel.AutomaticSize=Enum.AutomaticSize.Y
    task.defer(function()
      if not panel.Parent or panel:GetAttribute('ExpandGeneration')~=generation then return end
      local height=panel.AbsoluteSize.Y
      panel.AutomaticSize=Enum.AutomaticSize.None;panel.Size=UDim2.new(1,-2,0,0);panel.ClipsDescendants=true
      tween(panel,{Size=UDim2.new(1,-2,0,height)},.18)
      task.delay(.19,function()if panel.Parent and panel:GetAttribute('ExpandGeneration')==generation then panel.AutomaticSize=Enum.AutomaticSize.Y;panel.ClipsDescendants=false end end)
    end)
  else
    panel.AutomaticSize=Enum.AutomaticSize.None;panel.Size=UDim2.new(1,-2,0,panel.AbsoluteSize.Y);panel.ClipsDescendants=true
    tween(panel,{Size=UDim2.new(1,-2,0,0)},.16)
    task.delay(.17,function()if panel.Parent and panel:GetAttribute('ExpandGeneration')==generation then panel.Visible=false;panel.AutomaticSize=Enum.AutomaticSize.Y end end)
  end
end
local function tooltip(anchor,message)
  local serial=0
  connect(anchor.MouseEnter:Connect(function()
    serial=serial+1;local mine=serial
    task.delay(.45,function()
      if serial~=mine or not anchor.Parent or state.closed or ui.menu then return end
      if ui.tip then ui.tip:Destroy()end
      local view=workspace.CurrentCamera.ViewportSize
      local tip=rounded(mk('TextLabel',state.gui,{Name='Tooltip',ZIndex=100,Size=UDim2.fromOffset(math.min(300,view.X-20),42),
        Position=UDim2.fromOffset(math.clamp(anchor.AbsolutePosition.X,10,math.max(10,view.X-310)),math.clamp(anchor.AbsolutePosition.Y-48,10,view.Y-52)),
        Text=message,TextWrapped=true,TextColor3=C.white,TextSize=11,Font=Enum.Font.Gotham,BackgroundColor3=C.raised,BorderSizePixel=0}),6)
      pad(tip,5,8,5,8);stroke(tip);ui.tip=tip
    end)
  end))
  connect(anchor.MouseLeave:Connect(function()serial=serial+1;if ui.tip then ui.tip:Destroy();ui.tip=nil end end))
end
local function startup(screen,window)
  if state.boot then return end
  state.boot={started=os.clock(),ready=false,complete=false,missing={},status='Preparing interface'}
  local boot=state.boot
  local curtain=mk('CanvasGroup',screen,{Name='Startup',Size=UDim2.fromScale(1,1),BackgroundColor3=C.base,BorderSizePixel=0,GroupTransparency=0,Active=true,ZIndex=200})
  local shell=mk('Frame',curtain,{AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(.5,.5),Size=UDim2.new(.86,0,0,220),BackgroundTransparency=1})
  mk('UISizeConstraint',shell,{MaxSize=Vector2.new(420,240),MinSize=Vector2.new(240,220)})
  local brand=txt(shell,'REDLINE',58,38,C.white,true);brand.Position=UDim2.fromOffset(0,20);brand.TextXAlignment=Enum.TextXAlignment.Center;brand.TextTransparency=1
  local credit=txt(shell,'by rahamidali',24,13,C.muted);credit.Position=UDim2.fromOffset(0,79);credit.TextXAlignment=Enum.TextXAlignment.Center;credit.TextTransparency=1
  local line=rounded(mk('Frame',shell,{AnchorPoint=Vector2.new(.5,0),Position=UDim2.new(.5,0,0,0),Size=UDim2.fromOffset(0,3),BackgroundColor3=C.red,BorderSizePixel=0}),2)
  local track=rounded(mk('Frame',shell,{Position=UDim2.new(0,0,0,132),Size=UDim2.new(1,0,0,3),BackgroundColor3=C.line,BorderSizePixel=0,ClipsDescendants=true}),2)
  local fill=mk('Frame',track,{Size=UDim2.fromScale(0,1),BackgroundColor3=C.red,BorderSizePixel=0})
  local label=txt(shell,'Preparing your workspace',27,12,C.muted);label.Position=UDim2.fromOffset(0,151)
  local percent=txt(shell,'',27,12,C.pink);percent.Position=UDim2.new(1,-55,0,151);percent.Size=UDim2.fromOffset(55,27);percent.TextXAlignment=Enum.TextXAlignment.Right
  local noteLabel=txt(shell,'WANTED · v29',32,11,C.dim);noteLabel.Position=UDim2.fromOffset(0,185);noteLabel.TextWrapped=true
  local cancel=btn(curtain,'×',function()if state.close then state.close(true)end end,30,30);cancel.AnchorPoint=Vector2.new(1,0);cancel.Position=UDim2.new(1,-18,0,18)
  window.Visible=false;window.GroupTransparency=1
  task.spawn(function()
    local stages={'Reading saved preferences','Preparing movement controls','Checking bank and vault systems','Preparing Ghost quest workflow','Preparing farming priorities','Connecting account tracker','Finishing your workspace'}
    local nextFrame=0;local brandStarted=false;local exiting=false
    tween(line,{Size=UDim2.fromOffset(86,3)},.8)
    while not state.closed and curtain.Parent do
      local elapsed=os.clock()-boot.started
      if elapsed>=1 and not brandStarted then brandStarted=true;tween(brand,{TextTransparency=0},.6);tween(credit,{TextTransparency=0},.7)end
      if elapsed>=2.3 and elapsed<6.6 then
        local fraction=math.clamp((elapsed-2.3)/4.3,0,1)
        fill.Size=UDim2.fromScale(fraction,1);percent.Text=math.floor(fraction*100)..'%'
        label.Text=stages[math.clamp(math.floor(fraction*#stages)+1,1,#stages)]
      elseif elapsed>=6.6 then
        fill.Size=UDim2.fromScale(1,1);percent.Text='100%'
        label.Text=boot.ready and 'Workspace ready'or 'Interface ready · game data pending'
        noteLabel.Text=boot.ready and 'WANTED · v29'or (#boot.missing>0 and 'Waiting for '..table.concat(boot.missing,', ')or boot.status)
      end
      if elapsed>=7.3 and not exiting then
        exiting=true;window.Visible=not state.minimized
        tween(curtain,{GroupTransparency=1},.7);tween(window,{GroupTransparency=0},.7)
      end
      if elapsed>=8 then boot.complete=true;curtain:Destroy();break end
      task.wait(1/30)
    end
  end)
end

-- Combat-specific components stay in separate functions, below Delta's per-function local limit.
do
 local v=combat.v30
 function v.saveSoon()
  v.saveSerial=(v.saveSerial or 0)+1;local serial=v.saveSerial
  task.delay(.2,function()if not state.closed and serial==v.saveSerial then combat.savePrefs()end end)
 end
 function v.controlChanged()
  v.syncLegacy();v.target=nil;combat.currentTarget=nil;v.saveSoon()
 end
 function v.colorControl(parent,label,section,key,sync)
  local r=line(parent,label);local b=action(r,'',function()end,70)
  local sw=rounded(mk('Frame',b,{Name='ColorSwatch',Position=UDim2.fromOffset(9,7),Size=UDim2.fromOffset(50,16),BorderSizePixel=0}),3)
  sync(function()local c=v.settings[section][key];sw.BackgroundColor3=v.rgb(c);sw.BackgroundTransparency=1-c.a end)
  connect(b.Activated:Connect(function()v.openColor(b,section,key,label)end))
 end
 function v.openColor(anchor,section,key,title)
  closeMenu()
  if v.picker then v.picker:Destroy();v.picker=nil end
  -- Each popup owns/disconnects its input connections instead of adding permanent listeners.
  local connections={};local function bind(signal,fn)table.insert(connections,signal:Connect(fn))end
  local screen=state.gui;local wrap=mk('Frame',screen,{Name='CombatColorPicker',Size=UDim2.fromScale(1,1),BackgroundTransparency=1,ZIndex=100});v.picker=wrap
  local dismiss=mk('TextButton',wrap,{Size=UDim2.fromScale(1,1),Text='',BackgroundTransparency=1,ZIndex=100})
  local panel=rounded(mk('Frame',wrap,{Name='PickerPanel',Size=UDim2.fromOffset(286,372),BackgroundColor3=C.card,BorderSizePixel=0,ZIndex=101}),7);stroke(panel,C.line)
  local view=workspace.CurrentCamera.ViewportSize
  panel.Position=UDim2.fromOffset(math.clamp(anchor.AbsolutePosition.X+anchor.AbsoluteSize.X-286,8,math.max(8,view.X-294)),math.clamp(anchor.AbsolutePosition.Y+32,8,math.max(8,view.Y-380)))
  local caption=txt(panel,title,24,12,C.white,true);caption.Position=UDim2.fromOffset(14,9);caption.Size=UDim2.fromOffset(240,24)
  local wheel=mk('TextButton',panel,{Name='HSVWheel',Position=UDim2.fromOffset(67,40),Size=UDim2.fromOffset(152,152),Text='',BackgroundTransparency=1,AutoButtonColor=false})
  for i=0,95 do local angle=i/96*math.pi*2
   mk('Frame',wheel,{AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromOffset(76+math.cos(angle)*68,76+math.sin(angle)*68),Size=UDim2.fromOffset(5.5,15),Rotation=math.deg(angle)+90,BorderSizePixel=0,BackgroundColor3=Color3.fromHSV(i/96,1,1),Active=false})
  end
  local sv=mk('TextButton',wheel,{Name='SaturationValue',Position=UDim2.fromOffset(34,34),Size=UDim2.fromOffset(84,84),Text='',BorderSizePixel=0,AutoButtonColor=false})
  local white=mk('Frame',sv,{Size=UDim2.fromScale(1,1),BorderSizePixel=0,BackgroundColor3=Color3.new(1,1,1)});mk('UIGradient',white,{Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)})})
  local black=mk('Frame',sv,{Size=UDim2.fromScale(1,1),BorderSizePixel=0,BackgroundColor3=Color3.new(0,0,0)});mk('UIGradient',black,{Rotation=90,Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,0)})})
  local dot=rounded(mk('Frame',sv,{Size=UDim2.fromOffset(7,7),AnchorPoint=Vector2.new(.5,.5),BackgroundColor3=C.white,BorderSizePixel=0}),8);stroke(dot,Color3.new(0,0,0))
  local preview=rounded(mk('Frame',panel,{Position=UDim2.fromOffset(14,201),Size=UDim2.fromOffset(44,30),BorderSizePixel=0}),4)
  local hex=mk('TextBox',panel,{Name='HexInput',Position=UDim2.fromOffset(68,201),Size=UDim2.fromOffset(204,30),BackgroundColor3=C.base,TextColor3=C.white,Font=Enum.Font.Code,TextSize=13,Text='',ClearTextOnFocus=false,BorderSizePixel=0});rounded(hex,4)
  local c=v.settings[section][key];local h,s,b=Color3.toHSV(v.rgb(c));local alpha=c.a
  local function apply()
   local col=Color3.fromHSV(h,s,b);v.settings[section][key]={r=col.R*255,g=col.G*255,b=col.B*255,a=alpha};v.controlChanged()
   sv.BackgroundColor3=Color3.fromHSV(h,1,1);dot.Position=UDim2.fromScale(s,1-b);preview.BackgroundColor3=col;preview.BackgroundTransparency=1-alpha
   hex.Text=string.format('#%02X%02X%02X',math.floor(col.R*255+.5),math.floor(col.G*255+.5),math.floor(col.B*255+.5))
  end
  local function bar(y,label,get,set)
   local text=txt(panel,label,17,11,C.muted);text.Position=UDim2.fromOffset(14,y);text.Size=UDim2.fromOffset(258,17)
   local hit=mk('TextButton',panel,{Position=UDim2.fromOffset(14,y+19),Size=UDim2.fromOffset(258,20),Text='',BackgroundColor3=C.base,BorderSizePixel=0,AutoButtonColor=false});rounded(hit,4)
   local fill=mk('Frame',hit,{Size=UDim2.fromScale(get(),1),BackgroundColor3=Color3.fromRGB(157,117,183),BorderSizePixel=0});rounded(fill,4)
   local drag
   local function move(pos)set(math.clamp((pos.X-hit.AbsolutePosition.X)/math.max(1,hit.AbsoluteSize.X),0,1));fill.Size=UDim2.fromScale(get(),1);apply()end
   bind(hit.InputBegan,function(e)if e.UserInputType==Enum.UserInputType.MouseButton1 or e.UserInputType==Enum.UserInputType.Touch then drag=e;move(e.Position)end end)
   bind(UserInputService.InputChanged,function(e)if drag and(e==drag or drag.UserInputType==Enum.UserInputType.MouseButton1 and e.UserInputType==Enum.UserInputType.MouseMovement)then move(e.Position)end end)
   bind(UserInputService.InputEnded,function(e)if e==drag then drag=nil end end)
   return fill
  end
  local brightness=bar(239,'Brightness',function()return b end,function(x)b=x end)
  local opacity=bar(281,'Opacity',function()return alpha end,function(x)alpha=x end)
  local dragging,mode
  local function move(e)
   local p=e.Position
   if mode=='hue'then local dx=p.X-wheel.AbsolutePosition.X-76;local dy=p.Y-wheel.AbsolutePosition.Y-76;h=(math.atan2(dy,dx)/(2*math.pi))%1
   else s=math.clamp((p.X-sv.AbsolutePosition.X)/84,0,1);b=1-math.clamp((p.Y-sv.AbsolutePosition.Y)/84,0,1)end
   apply();brightness.Size=UDim2.fromScale(b,1)
  end
  bind(wheel.InputBegan,function(e)if e.UserInputType==Enum.UserInputType.MouseButton1 or e.UserInputType==Enum.UserInputType.Touch then local dx=e.Position.X-wheel.AbsolutePosition.X-76;local dy=e.Position.Y-wheel.AbsolutePosition.Y-76;if dx*dx+dy*dy>=57*57 then dragging=e;mode='hue';move(e)end end end)
  bind(sv.InputBegan,function(e)if e.UserInputType==Enum.UserInputType.MouseButton1 or e.UserInputType==Enum.UserInputType.Touch then dragging=e;mode='sv';move(e)end end)
  bind(UserInputService.InputChanged,function(e)if dragging and(e==dragging or dragging.UserInputType==Enum.UserInputType.MouseButton1 and e.UserInputType==Enum.UserInputType.MouseMovement)then move(e)end end)
  bind(UserInputService.InputEnded,function(e)if e==dragging then dragging=nil end end)
  bind(hex.FocusLost,function()
   local value=hex.Text:gsub('#','');if #value==6 and value:match('^%x+$')then local col=Color3.fromRGB(tonumber(value:sub(1,2),16),tonumber(value:sub(3,4),16),tonumber(value:sub(5,6),16));h,s,b=Color3.toHSV(col)end
   apply();brightness.Size=UDim2.fromScale(b,1)
  end)
  local function popupButton(text,x,callback)
   local button=mk('TextButton',panel,{Position=UDim2.fromOffset(x,332),Size=UDim2.fromOffset(120,30),BackgroundColor3=C.raised,TextColor3=C.white,Text=text,Font=Enum.Font.GothamMedium,TextSize=12,BorderSizePixel=0});rounded(button,4);bind(button.Activated,callback)
  end
  popupButton('Reset color',14,function()local col=v.defaults[section][key];h,s,b=Color3.toHSV(v.rgb(col));alpha=col.a;apply();brightness.Size=UDim2.fromScale(b,1);opacity.Size=UDim2.fromScale(alpha,1)end)
  local function close()if wrap.Parent then wrap:Destroy()end;if v.picker==wrap then v.picker=nil end end
  popupButton('Done',152,close)
  bind(dismiss.Activated,close);bind(wrap.Destroying,function()for _,connection in ipairs(connections)do connection:Disconnect()end end)
  apply()
 end
 function v.buildUI(page,sync)
  local host=card(page,'Combat controls');host.Name='CombatWorkspace'
  local summary=txt(host,'',32,11,C.muted);summary.TextWrapped=true
  local nav=mk('Frame',host,{Name='CombatSections',Size=UDim2.new(1,0,0,76),BackgroundTransparency=1});order(nav)
  local grid=mk('UIGridLayout',nav,{CellSize=UDim2.new(.25,-6,0,34),CellPadding=UDim2.fromOffset(7,6),SortOrder=Enum.SortOrder.LayoutOrder})
  local content=mk('Frame',host,{Name='CombatContent',Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1});order(content);stack(content,8)
  local panels={};local buttons={};local selected=v.selectedSection or 'Silent Aim'
  local names={'Silent Aim','ESP','Hitboxes','Projectiles','Whitelist','Gun Shop & Ammo','Presets','Advanced'}
  local function choose(name)
   closeMenu();if v.picker then v.picker:Destroy();v.picker=nil end
   selected=name;v.selectedSection=name
   for n,p in pairs(panels)do p.Visible=n==name;accent(buttons[n],n==name)end
  end
  for i,name in ipairs(names)do
   local p=mk('Frame',content,{Name=name,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Visible=false});stack(p,8);panels[name]=p
   local b=btn(nav,name,function()choose(name)end,100,34);b.LayoutOrder=i;buttons[name]=b
  end
  local function group(parent,title,opened)
   local c=card(parent,title);c:FindFirstChildOfClass('TextLabel').Visible=false
   local r=line(c,title);local body=mk('Frame',c,{Name='Options',Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Visible=opened==true});order(body);stack(body,7)
   local button;button=action(r,opened and 'Hide'or 'Edit',function()body.Visible=not body.Visible;button.Text=body.Visible and 'Hide'or 'Edit'end,54)
   return body
  end
  local function flag(parent,label,section,key)
   sync(toggle(parent,label,function()return v.settings[section][key]end,function(on)v.settings[section][key]=on;v.changed()end))
  end
  local function number(parent,label,section,key,min,max,step,unit)
   sync(slider(parent,label,min,max,step,function()return v.settings[section][key]end,function(x)v.settings[section][key]=x;v.controlChanged()end,unit))
  end
  local function select(parent,label,section,key,options)
   local r=line(parent,label);local b=action(r,'',function()end,132)
   dropdown(b,options,function()return v.settings[section][key]end,function(x)v.settings[section][key]=x;v.changed()end,false,label)
  end
  local function colors(parent,section,entries)for _,entry in ipairs(entries)do v.colorControl(parent,entry[1],section,entry[2],sync)end end
  local function checks(parent,section,esp)
   for _,e in ipairs({{'Team check','team'},{'Friend exclusion','friends'},{'Alive check','alive'},{'Knocked check','knocked'},{'Safe zone check','safe'}})do if esp or e[2]~='alive'then flag(parent,e[1],section,e[2])end end
   if esp then flag(parent,'Hide whitelisted players',section,'whitelist');flag(parent,'Visible only',section,'visibleOnly');flag(parent,'Show occluded players',section,'occluded')
   else txt(parent,'Alive targets, shared whitelist and native PvP protection always apply.',32,11,C.dim).TextWrapped=true;flag(parent,'Same-party exclusion',section,'party')end
  end
  do
   local p=panels['Silent Aim'];flag(p,'Silent Aim','aim','enabled');local status=txt(p,'',34,11,C.dim);status.TextWrapped=true;sync(function()status.Text=combat.silentStatus end)
   select(p,'Target part','aim','part',{'Head','Torso','Closest Part'});select(p,'Priority','aim','priority',{'Crosshair','Distance','Health'});number(p,'Maximum distance','aim','distance',25,3000,25,' st')
   local f=group(p,'FOV appearance',true)
   flag(f,'Show circle','fov','show');number(f,'Radius','fov','radius',10,700,5,' px');select(f,'Center','fov','center',{'Screen','Cursor'})
   number(f,'Line thickness','fov','thickness',.5,6,.5,' px');flag(f,'Outline','fov','outline');flag(f,'Fill','fov','fill');colors(f,'fov',{{'Circle color / opacity','color'},{'Fill color / opacity','fillColor'}})
   flag(f,'Rainbow','fov','rainbow');number(f,'Rainbow speed','fov','rainbowSpeed',.02,2,.02,' cycles/s')
   local c=group(p,'Eligibility',false);flag(c,'Visibility check','aim','visibility');checks(c,'aim',false)
   local a=group(p,'Target behavior',false);flag(a,'Retain eligible target','aim','retain');flag(a,'Allow target switching','aim','switching');flag(a,'Target marker','aim','indicator');flag(a,'Target information','aim','information');number(a,'Correction probability','aim','chance',0,100,5,'%');flag(a,'Linear projectile lead estimate','aim','prediction');flag(a,'Target diagnostics','aim','diagnostics')
   txt(a,'Prediction uses weapon velocity. Drag, wind and server hits remain unverified.',36,11,C.dim).TextWrapped=true
  end
  do
   local p=panels.ESP;flag(p,'ESP enabled','esp','enabled')
   local box=group(p,'Box',true);flag(box,'Box enabled','esp','boxEnabled');select(box,'Style','esp','box',{'Off','2D','3D','Corner'});number(box,'Thickness','esp','boxThickness',.5,6,.5,' px');flag(box,'Outline','esp','boxOutline');number(box,'Outline thickness','esp','boxOutlineThickness',.5,4,.5,' px');flag(box,'Fill (2D / Corner)','esp','boxFill');number(box,'Corner length','esp','corner',.1,.5,.05,' ratio');colors(box,'esp',{{'Box','boxColor'},{'Outline','boxOutlineColor'},{'Fill','boxFillColor'}})
   local sk=group(p,'Skeleton',false);flag(sk,'Skeleton enabled','esp','skeleton');number(sk,'Thickness','esp','skeletonThickness',.5,6,.5,' px');flag(sk,'Outline','esp','skeletonOutline');number(sk,'Render distance','esp','skeletonDistance',25,5000,25,' st');colors(sk,'esp',{{'Lines','skeletonColor'},{'Outline','skeletonOutlineColor'}})
   local ch=group(p,'Chams',false);flag(ch,'Chams enabled','esp','chams');flag(ch,'Team colors','esp','chamsTeam');flag(ch,'Separate visible / occluded tints','esp','chamsVisibilityColors');number(ch,'Render distance','esp','chamsDistance',25,5000,25,' st');colors(ch,'esp',{{'Fill','chamsFill'},{'Outline','chamsOutline'},{'Visible tint','visibleColor'},{'Occluded tint','occludedColor'}})
   local hp=group(p,'Health',false);flag(hp,'Health bar','esp','healthBar');flag(hp,'Numerical health','esp','healthNumber');flag(hp,'Percentage','esp','healthPercent');select(hp,'Bar position','esp','healthPosition',{'Left','Right','Bottom'});number(hp,'Bar thickness','esp','healthThickness',2,10,1,' px');flag(hp,'Health gradient','esp','healthGradient');number(hp,'Text size','esp','healthTextSize',9,20,1,' px');colors(hp,'esp',{{'Background','healthBackground'},{'Healthy','healthyColor'},{'Damaged','damagedColor'},{'Critical','criticalColor'},{'Health text','healthTextColor'}})
   local info=group(p,'Names, portrait & status',false)
   for _,e in ipairs({{'Username','username'},{'Display name','displayName'},{'Avatar picture','avatar'},{'Avatar border','avatarBorder'},{'Team','teamLabel'},{'Alive / dead','aliveLabel'},{'Knocked','knockedLabel'},{'Safe zone','safeLabel'},{'Distance scaling','scale'}})do flag(info,e[1],'esp',e[2])end
   number(info,'Text size','esp','textSize',9,20,1,' px');number(info,'Avatar size','esp','avatarSize',20,64,2,' px');number(info,'Avatar opacity','esp','avatarOpacity',0,1,.05,'');select(info,'Avatar position','esp','avatarPosition',{'Top','Left'});colors(info,'esp',{{'Username','usernameColor'},{'Display name','displayNameColor'},{'Status','statusColor'},{'Avatar border','avatarBorderColor'}})
   local dist=group(p,'Distance & off-screen indicators',false);flag(dist,'Distance label','esp','distanceLabel');number(dist,'Decimals','esp','distancePrecision',0,2,1,'');number(dist,'Text size','esp','distanceSize',9,20,1,' px');number(dist,'Label distance','esp','distanceMax',25,5000,25,' st');flag(dist,'Off-screen arrows','esp','arrows');number(dist,'Arrow size','esp','arrowSize',6,32,1,' px');number(dist,'Edge padding','esp','arrowPadding',12,120,2,' px');flag(dist,'Arrow distance label','esp','arrowDistance');number(dist,'Arrow distance','esp','arrowMax',25,5000,25,' st');colors(dist,'esp',{{'Distance','distanceColor'},{'Arrow','arrowColor'}})
   local filters=group(p,'Display filters',false);checks(filters,'esp',true);number(filters,'Maximum distance','esp','distance',25,5000,25,' st')
   local preview=group(p,'Configuration preview',false);v.buildPreview(preview,sync)
  end
  do
   local p=panels.Hitboxes;txt(p,'Local geometry experiment · server hit registration unverified',36,11,C.dim).TextWrapped=true
   flag(p,'Hitbox expansion','hbe','enabled');select(p,'Parts','hbe','part',{'Head','Body','Both'});number(p,'Head size','hbe','head',2,18,1,' st');number(p,'Body size','hbe','body',3,18,1,' st');number(p,'Maximum distance','hbe','distance',25,3000,25,' st');checks(p,'hbe',false);flag(p,'Local preview','hbe','preview');colors(p,'hbe',{{'Preview color / opacity','color'}})
   action(line(p,'Restore defaults'),'Reset HBE',function()v.reset('hbe')end,112)
  end
  do
   local p=panels.Projectiles;local info=txt(p,'',68,11,C.muted);info.TextWrapped=true
   sync(function()local tool=v.weapon();local speed,meters;if tool then speed,meters=v.velocity(tool)end;local travel='';if tool and v.target and workspace.CurrentCamera then local _,time=v.predict(v.target,tool,workspace.CurrentCamera.CFrame.Position);if time then travel=string.format('\nLinear travel estimate: %.2f s',time)end end;info.Text=tool and ((tool.name or 'Gun')..' · '..(speed and string.format('%.0f st/s (%.0f m/s)',speed,meters)or 'Velocity unavailable')..travel..'\nObserved local shots: '..(v.shotCount or 0)..' · server hits unverified')or 'Equip a native gun to inspect projectile information'end)
   flag(p,'Local projectile trail','projectile','tracers');flag(p,'Projectile endpoint marker','projectile','impacts');txt(p,'Endpoint markers are not confirmed hits. Native penetration is material- and velocity-dependent.',40,11,C.dim).TextWrapped=true
   number(p,'Trail lifetime','projectile','lifetime',.1,3,.1,' s');number(p,'Thickness','projectile','thickness',.5,6,.5,' px');colors(p,'projectile',{{'Trail','color'},{'Endpoint','impactColor'}})
   flag(p,'Inspect aimed material','projectile','material');local material=txt(p,'',48,11,C.dim);material.TextWrapped=true;sync(function()material.Text=v.materialInfo or ''end)
   txt(p,'Unrestricted penetration: unsupported. No server-validation bypass is installed.',38,11,C.dim).TextWrapped=true
  end
  v.buildWhitelist(panels.Whitelist,sync)
  v.buildAmmo(panels['Gun Shop & Ammo'],sync)
  v.buildPresets(panels.Presets,sync)
  do
   local p=panels.Advanced;select(p,'Performance','advanced','performance',{'Normal','Balanced','Performance'});number(p,'Overlay update limit','advanced','hz',15,120,5,' Hz');number(p,'Visibility / info updates','advanced','infoHz',2,15,1,' Hz');number(p,'Maximum players rendered','advanced','maxPlayers',5,100,5,'')
   flag(p,'Friends auto-protection','advanced','friendAuto');flag(p,'Same-party protection','advanced','party')
   local legacy=group(p,'Existing Loopbring / SPAS',false);flag(legacy,'Local Loopbring visuals','legacy','loopbring');flag(legacy,'Auto SPAS-12','legacy','autoSpas');local status=txt(legacy,'',40,11,C.dim);status.TextWrapped=true;sync(function()status.Text=combat.spasStatus end)
   txt(legacy,'Loopbring clones are local visuals. Select players in Whitelist; shared protection always applies.',42,11,C.dim).TextWrapped=true
  end
  sync(function()
   local count=0;for _,on in pairs(combat.whitelist)do if on then count=count+1 end end
   summary.Text='Aim '..(combat.silent and 'ON'or 'OFF')..'   ·   ESP '..(v.settings.esp.enabled and 'ON'or 'OFF')..'   ·   HBE '..(combat.hitbox and 'ON'or 'OFF')..'   ·   Protected '..count
   local narrow=host.AbsoluteSize.X<460;grid.CellSize=UDim2.new(narrow and .5 or .25,-6,0,34);nav.Size=UDim2.new(1,0,0,narrow and 156 or 76)
  end)
  choose(selected);v.refreshUI=function()end
 end
 function v.buildPreview(parent,sync)
  local f=row(parent,220);f.Name='ESPPreview';local r={frame=f,lines={}}
  local name=txt(f,'@preview_player',20,12,C.white);name.Position=UDim2.fromOffset(35,7);name.Size=UDim2.fromOffset(190,20)
  local dist=txt(f,'125 studs',20,11,C.muted);dist.Position=UDim2.fromOffset(35,192);dist.Size=UDim2.fromOffset(190,20)
  local hp=mk('Frame',f,{Position=UDim2.fromOffset(71,51),Size=UDim2.fromOffset(4,130),BorderSizePixel=0})
  local fill=mk('Frame',f,{Position=UDim2.fromOffset(84,40),Size=UDim2.fromOffset(90,140),BorderSizePixel=0})
  sync(function()
   local s=v.settings.esp;for _,pair in pairs(r.lines)do pair[1].Visible=false;pair[2].Visible=false end
   name.Visible=s.username or s.displayName;name.Text=s.username and s.displayName and 'Preview · @preview'or s.username and '@preview'or 'Preview';name.TextColor3=v.rgb(s.username and s.usernameColor or s.displayNameColor)
   dist.Visible=s.distanceLabel;dist.TextColor3=v.rgb(s.distanceColor);hp.Visible=s.healthBar;hp.BackgroundColor3=v.rgb(s.healthyColor);fill.Visible=s.chams;fill.BackgroundColor3=v.rgb(s.chamsFill);fill.BackgroundTransparency=1-s.chamsFill.a
   local points={Vector2.new(80,35),Vector2.new(180,35),Vector2.new(180,185),Vector2.new(80,185)}
   if s.boxEnabled and s.box~='Off'then for i,a in ipairs(points)do local b=points[i%4+1];v.line(r,'box'..i,a,s.box=='Corner'and a+(b-a)*s.corner or b,s.boxThickness,s.boxColor,s.boxOutline,s.boxOutlineColor,s.boxOutlineThickness);if s.box=='Corner'then v.line(r,'boxend'..i,b,b+(a-b)*s.corner,s.boxThickness,s.boxColor,s.boxOutline,s.boxOutlineColor,s.boxOutlineThickness)elseif s.box=='3D'then v.line(r,'depth'..i,a,a+Vector2.new(12,-10),s.boxThickness,s.boxColor,false,s.boxOutlineColor);v.line(r,'back'..i,a+Vector2.new(12,-10),b+Vector2.new(12,-10),s.boxThickness,s.boxColor,false,s.boxOutlineColor)end end end
   if s.skeleton then local bones={{{130,48},{130,83}},{{130,83},{130,125}},{{130,85},{99,113}},{{130,85},{161,113}},{{130,125},{108,172}},{{130,125},{152,172}}};for i,b in ipairs(bones)do v.line(r,'bone'..i,Vector2.new(unpack(b[1])),Vector2.new(unpack(b[2])),s.skeletonThickness,s.skeletonColor,s.skeletonOutline,s.skeletonOutlineColor)end end
  end)
 end
 function v.buildWhitelist(parent,sync)
  local query=input(parent,'Search current players...');local entry=input(parent,'Username or UserId');local status=txt(parent,'',24,11,C.dim)
  action(line(parent,'Protect an account'),'Add',function()
   local raw=entry.Text:match('^%s*(.-)%s*$');local id=tonumber(raw)
   if id then local ok,why=v.protect(id,true);status.Text=ok and 'Protected UserId '..id or why
   else status.Text='Resolving username...';task.spawn(function()local ok,value=pcall(Players.GetUserIdFromNameAsync,Players,raw);if not parent.Parent then return end;if ok then v.protect(value,true);status.Text='Protected '..raw else status.Text='Username could not be resolved'end end)end
  end,90)
  local list=scroll(parent,220);local saved=scroll(parent,135);local stamp='';local generation=0
  local function refresh()
   local parts={query.Text};for _,p in ipairs(Players:GetPlayers())do table.insert(parts,p.UserId..':'..tostring(combat.whitelist[p.UserId])..':'..tostring(combat.selectedTargets[p.UserId]))end
   for id,on in pairs(combat.whitelist)do if on then table.insert(parts,'w'..id)end end;table.sort(parts);local nextStamp=table.concat(parts,'|');if nextStamp==stamp then return end;stamp=nextStamp;generation=generation+1
   local scope='combatRoster';for _,c in ipairs(ui.scopes[scope]or {})do c:Disconnect()end;ui.scopes[scope]={};local prior=ui.scope;ui.scope=scope
   for _,container in ipairs({list,saved})do for _,c in ipairs(container:GetChildren())do if c:IsA('GuiObject')then c:Destroy()end end;container:SetAttribute('RedlineOrder',0)end
   local q=query.Text:lower()
   for _,p in ipairs(Players:GetPlayers())do if p~=player and (q==''or p.Name:lower():find(q,1,true)or p.DisplayName:lower():find(q,1,true))then
    local r=line(list,p.Name);action(r,v.whitelisted(p)and 'Unprotect'or 'Protect',function()v.protect(p.UserId,not v.whitelisted(p))end,91)
    local selectLine=line(list,'Loopbring selection');action(selectLine,combat.selectedTargets[p.UserId]and 'Remove'or 'Select',function()if not v.whitelisted(p)then combat.selectedTargets[p.UserId]=not combat.selectedTargets[p.UserId]end end,91)
   end end
   for id,on in pairs(combat.whitelist)do if on then action(line(saved,'UserId '..id),'Remove',function()v.protect(id,false)end,78)end end
   ui.scope=prior
  end
  local confirmUntil=0
  action(line(parent,'Clear shared whitelist'),'Clear',function()if os.clock()>confirmUntil then confirmUntil=os.clock()+5;status.Text='Press Clear again within 5 seconds to confirm';return end;combat.whitelist={};v.target=nil;v.restoreHBE();combat.savePrefs();confirmUntil=0;status.Text='Whitelist cleared'end,90)
  sync(refresh);refresh()
 end
 function v.buildAmmo(parent,sync)
  action(line(parent,'Native gun shop'),'Open shop',openGunshop,112)
  action(line(parent,'Refill all owned guns'),'Buy Ammo',state.ammo.request,112,true)
  sync(toggle(parent,'Automatic ammo purchasing',function()return v.settings.ammo.automatic end,function(on)v.settings.ammo.automatic=on;v.controlChanged()end))
  sync(toggle(parent,'Low ammo notifications',function()return state.notifications.preferences['LOW AMMO']~=false end,function(on)state.notifications.set('LOW AMMO',on)end))
  sync(slider(parent,'Low reserve threshold',0,200,5,function()return state.ammo.settings.threshold end,function(x)state.ammo.settings.threshold=x;saveSettings()end,' rounds'))
  sync(slider(parent,'Notification cooldown',15,300,5,function()return v.settings.ammo.cooldown end,function(x)v.settings.ammo.cooldown=x;state.ammo.settings.cooldown=x;v.controlChanged()end,' s'))
  local info=txt(parent,'',75,11,C.muted);info.TextWrapped=true;sync(function()local rows={state.ammo.status};for _,item in pairs(state.ammo.snapshot())do table.insert(rows,item.name..': '..item.magazine..' / '..item.reserve)end;info.Text=table.concat(rows,'\n')end)
 end
 function v.buildPresets(parent,sync)
  local name=input(parent,'Preset name');local rename=input(parent,'New name for rename');local status=txt(parent,'',28,11,C.dim)
  for _,a in ipairs({'save','load','rename','delete'})do action(line(parent,a:sub(1,1):upper()..a:sub(2)..' preset'),a:sub(1,1):upper()..a:sub(2),function()local ok,why=v.preset(a,name.Text,rename.Text);status.Text=ok and 'Preset '..a..' complete'or why end,95)end
  local names=txt(parent,'',60,11,C.dim);names.TextWrapped=true;sync(function()local list={};for n in pairs(v.presets)do table.insert(list,n)end;table.sort(list);names.Text=#list>0 and table.concat(list,' · ')or 'No saved presets'end)
  local r=line(parent,'Reset subsection');local chosen='aim';local b=action(r,'Silent Aim',function()end,132);dropdown(b,{'aim','fov','esp','hbe','projectile','advanced','legacy','ammo'},function()return chosen end,function(x)chosen=x end,false,'Subsection')
  action(line(parent,'Restore subsection defaults'),'Reset section',function()v.reset(chosen);status.Text='Reset '..chosen..'; whitelist retained'end,132)
  local confirm=0;action(line(parent,'Reset all combat settings'),'Reset combat',function()if os.clock()>confirm then confirm=os.clock()+5;status.Text='Press Reset combat again to confirm';return end;v.reset();status.Text='Defaults restored; whitelist and presets retained';confirm=0 end,132)
  local theme=line(parent,'Visual theme');local themeButton=action(theme,'',function()end,132)
  dropdown(themeButton,{'REDLINE Default','Purple','Burgundy','Minimal White','Custom'},function()return v.settings.advanced.theme end,function(t)
   v.settings.advanced.theme=t
   if t~='Custom'then local base=t=='Purple'and {184,149,228}or t=='Burgundy'and {164,83,106}or t=='Minimal White'and {230,231,237}or nil
    for _,key in ipairs({'boxColor','skeletonColor','usernameColor','displayNameColor','distanceColor','arrowColor'})do v.settings.esp[key]=v.copy(v.defaults.esp[key]);if base then v.settings.esp[key].r=base[1];v.settings.esp[key].g=base[2];v.settings.esp[key].b=base[3]end end
   end;v.changed()
  end,false,'Visual theme')
 end
 function v.buildMovement(parent,sync,screen)
  for _,actionName in ipairs({'noclip','fly'})do
   local getter=actionName=='fly'and function()return state.manual.enabled or state.manual.requested end or state.collision.effective
   local setter=actionName=='fly'and state.manual.set or function(on)local _,accepted=state.setNoclip(on);if accepted then saveSettings()end end
   local update,r,button=toggle(parent,actionName=='fly'and 'Manual Fly'or 'Noclip',getter,setter,actionName=='noclip'and state.collision.automatic or nil)
   sync(update);button.Position=UDim2.new(1,-80,.5,0)
   local b=action(r,'',function()state.manual.recording=actionName;state.manual.status='Press a key · Escape cancels'end,70)
   r:FindFirstChild('RowLabel').Size=UDim2.new(1,-140,1,0)
   b.Name=actionName..'KeyCapture'
   sync(function()b.Text=state.manual.recording==actionName and 'Press key'or '['..(state.keybinds[actionName]~=''and state.keybinds[actionName]or 'None')..']'end)
  end
  local status=txt(parent,'',38,11,C.dim);status.TextWrapped=true
  action(line(parent,'Paused automation'),'Resume',state.manual.resume,95)
  for _,actionName in ipairs({'noclip','fly'})do
   sync(toggle(parent,'Enable '..actionName..' keybind',function()return state.keybinds[actionName..'Enabled']end,function(on)state.keybinds[actionName..'Enabled']=on;saveSettings()end))
   local controls=row(parent,34);btn(controls,'Clear',function()state.manual.bind(actionName,'')end,90);btn(controls,'Default',function()local ok,why=state.manual.bind(actionName,actionName=='fly'and 'F'or 'N');if not ok then state.manual.status=why end end,90).Position=UDim2.fromOffset(100,0)
  end
  sync(function()status.Text=state.manual.status end)
  if UserInputService.TouchEnabled then
   local touch=mk('Frame',screen,{Name='ManualFlyTouch',Position=UDim2.new(1,-192,1,-220),Size=UDim2.fromOffset(184,150),BackgroundTransparency=1,Visible=false})
   local positions={{'forward','Forward',60,0},{'back','Back',60,96},{'left','Left',0,48},{'right','Right',120,48},{'up','Up',120,0},{'down','Down',120,96}}
   for _,p in ipairs(positions)do local b=btn(touch,p[2],function()end,58,44);b.Position=UDim2.fromOffset(p[3],p[4]);local held
    connect(b.InputBegan:Connect(function(e)if e.UserInputType==Enum.UserInputType.Touch then held=e;state.manual.touch[p[1]]=true end end))
    connect(UserInputService.InputEnded:Connect(function(e)if e==held then held=nil;state.manual.touch[p[1]]=nil end end))
   end
   connect(RunService.Heartbeat:Connect(function()touch.Visible=state.manual.enabled end))
  end
 end
end

local function buildWorkspace(firstBoot)
  -- Keep individual widget references in one table to avoid the Luau 200-local limit.
  local widgetRefs={}
  if state.closed then return end
  ui={animations=setmetatable({},{__mode='k'}),connections={},scopes={}}
  local syncControls={}
  local function sync(fn)table.insert(syncControls,fn)end
  local screen=mk('ScreenGui',player:WaitForChild('PlayerGui'),{Name='REDLINEv30UI',ResetOnSpawn=false,IgnoreGuiInset=true,ZIndexBehavior=Enum.ZIndexBehavior.Sibling,DisplayOrder=40})
  state.gui=screen
  connect(UserInputService.InputBegan:Connect(function(event)if event.KeyCode==Enum.KeyCode.Escape then closeMenu()end end))
  local group=mk('CanvasGroup',screen,{Name='Window',AnchorPoint=Vector2.new(.5,.5),Position=state.windowPosition or (tonumber(state.windowSettings.x)and tonumber(state.windowSettings.y)and UDim2.fromOffset(state.windowSettings.x,state.windowSettings.y))or UDim2.fromScale(.5,.5),Size=UDim2.fromOffset(950,640),BackgroundTransparency=1,GroupTransparency=0})
  local scale=mk('UIScale',group,{Scale=1})
  local root=rounded(mk('Frame',group,{Name='Hub',Size=UDim2.fromScale(1,1),BackgroundColor3=C.base,BorderSizePixel=0,ClipsDescendants=true}),13)
  stroke(root,C.line)
  if firstBoot then startup(screen,group)end
  widgetRefs.header=mk('Frame',root,{Name='Header',Size=UDim2.new(1,0,0,59),BackgroundTransparency=1,Active=true})
  mk('Frame',widgetRefs.header,{Position=UDim2.new(0,0,1,-1),Size=UDim2.new(1,0,0,1),BackgroundColor3=C.line,BorderSizePixel=0})
  rounded(mk('Frame',widgetRefs.header,{Position=UDim2.fromOffset(19,14),Size=UDim2.fromOffset(3,31),BackgroundColor3=C.red,BorderSizePixel=0}),2)
  txt(widgetRefs.header,'REDLINE',25,19,C.white,true).Position=UDim2.fromOffset(33,10)
  widgetRefs.by=txt(widgetRefs.header,'by rahamidali',14,8,C.pink,true);widgetRefs.by.Position=UDim2.fromOffset(34,34);widgetRefs.by.Size=UDim2.fromOffset(150,14)
  widgetRefs.headerMeta=txt(widgetRefs.header,'WANTED',20,10,C.muted);widgetRefs.headerMeta.Position=UDim2.new(1,-200,0,20);widgetRefs.headerMeta.Size=UDim2.fromOffset(70,20)
  widgetRefs.sidebar=mk('Frame',root,{Name='Navigation',Position=UDim2.fromOffset(0,59),Size=UDim2.new(0,184,1,-82),BackgroundColor3=C.nav,BorderSizePixel=0})
  mk('Frame',widgetRefs.sidebar,{Position=UDim2.new(1,-1,0,0),Size=UDim2.new(0,1,1,0),BackgroundColor3=C.line,BorderSizePixel=0})
  widgetRefs.navlabel=txt(widgetRefs.sidebar,'WORKSPACE',20,9,C.dim,true);widgetRefs.navlabel.Position=UDim2.fromOffset(21,10);widgetRefs.navlabel.Size=UDim2.new(1,-30,0,20)
  widgetRefs.pagesRoot=mk('Frame',root,{Name='Workspace',Position=UDim2.fromOffset(184,59),Size=UDim2.new(1,-184,1,-82),BackgroundTransparency=1,ClipsDescendants=true})
  widgetRefs.footer=mk('Frame',root,{Position=UDim2.new(0,0,1,-23),Size=UDim2.new(1,0,0,23),BackgroundColor3=Color3.fromRGB(23,25,31),BorderSizePixel=0})
  mk('Frame',widgetRefs.footer,{Size=UDim2.new(1,0,0,1),BackgroundColor3=C.line,BorderSizePixel=0})
  widgetRefs.footerBrand=txt(widgetRefs.footer,'REDLINE · RAHAMIDALI',22,9,C.dim);widgetRefs.footerBrand.Position=UDim2.fromOffset(16,0);widgetRefs.footerBrand.Size=UDim2.fromOffset(180,22)
  ui.status=txt(widgetRefs.footer,'READY',22,9,C.pink);ui.status.Position=UDim2.new(0,200,0,0);ui.status.Size=UDim2.new(1,-216,1,0);ui.status.TextXAlignment=Enum.TextXAlignment.Right
  widgetRefs.profile=mk('Frame',widgetRefs.sidebar,{Position=UDim2.new(0,9,1,-90),Size=UDim2.new(1,-18,0,83),BackgroundTransparency=1})
  mk('Frame',widgetRefs.profile,{Size=UDim2.new(1,0,0,1),BackgroundColor3=C.line,BorderSizePixel=0})
  widgetRefs.thumb=rounded(mk('ImageLabel',widgetRefs.profile,{Position=UDim2.fromOffset(4,14),Size=UDim2.fromOffset(34,34),BackgroundColor3=C.raised,BorderSizePixel=0}),9)
  widgetRefs.who=txt(widgetRefs.profile,player.DisplayName or player.Name,17,10,C.white,true);widgetRefs.who.Position=UDim2.fromOffset(47,12);widgetRefs.who.Size=UDim2.new(1,-50,0,17)
  widgetRefs.user=txt(widgetRefs.profile,'@'..player.Name,15,9,C.muted);widgetRefs.user.Position=UDim2.fromOffset(47,29);widgetRefs.user.Size=UDim2.new(1,-50,0,15)
  widgetRefs.online=txt(widgetRefs.profile,'Session active',17,9,C.green);widgetRefs.online.Position=UDim2.fromOffset(17,60);widgetRefs.online.Size=UDim2.new(1,-21,0,17)
  drawIcon(widgetRefs.profile,'dot',C.green,14).Position=UDim2.fromOffset(1,61)
  task.spawn(function()
    local ok,picture=pcall(function()return Players:GetUserThumbnailAsync(player.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size100x100)end)
    if ok and widgetRefs.thumb.Parent then widgetRefs.thumb.Image=picture end
  end)
  local pages,navigation={},{}
  widgetRefs.subtitles={Home='Account overview and startup actions',Events='Halloween · Speaker For The Dead',Combat='Targeting, player protection and appearance',['Auto Farm']='Bank, airdrops and loot preferences',Settings='Movement, preferences and diagnostics'}
  state.uiScroll=state.uiScroll or {}
  for _,name in ipairs({'Home','Events','Combat','Auto Farm','Settings'})do
    local p=mk('ScrollingFrame',widgetRefs.pagesRoot,{Name=name,Size=UDim2.fromScale(1,1),BackgroundTransparency=1,BorderSizePixel=0,ScrollingDirection=Enum.ScrollingDirection.Y,ScrollBarThickness=4,ScrollBarImageColor3=C.line,CanvasSize=UDim2.new(),AutomaticCanvasSize=Enum.AutomaticSize.Y,Visible=false})
    pad(p,18,23,22,23);stack(p,9)
    local title=txt(p,name,27,20,C.white,true);title.Name='PageTitle'
    local description=txt(p,widgetRefs.subtitles[name],17,10,C.dim);description.Name='PageSubtitle'
    p.CanvasPosition=state.uiScroll[name] or Vector2.zero
    pages[name]=p
  end
  widgetRefs.navFrames={}
  local function page(name)
    closeMenu();state.manual.recording=nil;if combat.v30.picker then combat.v30.picker:Destroy();combat.v30.picker=nil end
    if not pages[name] then name='Home' end
    for key,p in pairs(pages)do
      if p.Visible then state.uiScroll[key]=p.CanvasPosition end
      p.Visible=key==name
    end
    for key,b in pairs(navigation)do
      tween(b,{BackgroundColor3=key==name and C.soft or C.nav,TextColor3=key==name and C.white or C.muted},.18)
      widgetRefs.navFrames[key].Visible=key==name
      local caption=b:FindFirstChild('NavigationLabel');if caption then tween(caption,{TextColor3=key==name and C.white or C.muted},.18)end
    end
    if state.selectedPage~=name then
      pages[name].Position=UDim2.fromOffset(0,5);tween(pages[name],{Position=UDim2.fromOffset(0,0)},.12)
    end
    state.selectedPage=name
  end
  widgetRefs.icons={'home','events','combat','farm','settings'}
  for index,name in ipairs({'Home','Events','Combat','Auto Farm','Settings'})do
    local button=rounded(mk('TextButton',widgetRefs.sidebar,{Position=UDim2.fromOffset(9,39+(index-1)*40),Size=UDim2.new(1,-18,0,36),BackgroundColor3=C.nav,BorderSizePixel=0,Text='      '..name,Font=Enum.Font.GothamMedium,TextSize=12,TextColor3=C.muted,TextXAlignment=Enum.TextXAlignment.Left,AutoButtonColor=false}),7)
    local icon=drawIcon(button,widgetRefs.icons[index],C.muted,18);icon.Name='NavigationIcon';icon.Position=UDim2.new(0,10,.5,-9)
    local caption=txt(button,name,36,13,C.muted);caption.Name='NavigationLabel';caption.Position=UDim2.fromOffset(36,0);caption.Size=UDim2.new(1,-40,1,0)
    widgetRefs.navFrames[name]=rounded(mk('Frame',button,{Position=UDim2.fromOffset(0,7),Size=UDim2.fromOffset(3,22),BackgroundColor3=C.pink,BorderSizePixel=0,Visible=false}),2)
    navigation[name]=button
    connect(button.Activated:Connect(function()page(name)end))
    connect(button.MouseEnter:Connect(function()if state.selectedPage~=name then tween(button,{BackgroundColor3=C.raised},.15)end end))
    connect(button.MouseLeave:Connect(function()if state.selectedPage~=name then tween(button,{BackgroundColor3=C.nav},.15)end end))
  end
  widgetRefs.mini=rounded(mk('TextButton',screen,{Name='Mini',Visible=false,Position=state.miniPosition or UDim2.new(0,27,1,-63),Size=UDim2.fromOffset(145,39),BackgroundColor3=C.base,BorderSizePixel=0,Text='  REDLINE',Font=Enum.Font.GothamBold,TextSize=12,TextColor3=C.white,AutoButtonColor=false}),8)
  stroke(widgetRefs.mini,C.red);rounded(mk('Frame',widgetRefs.mini,{Position=UDim2.fromOffset(13,10),Size=UDim2.fromOffset(3,19),BackgroundColor3=C.red,BorderSizePixel=0}),2)
  widgetRefs.transition=0
  local function minimize()
    closeMenu()
    widgetRefs.transition=widgetRefs.transition+1;local token=widgetRefs.transition
    state.windowPosition=group.Position
    state.minimized=true
    tween(group,{GroupTransparency=1},.14)
    task.delay(.15,function()if group.Parent and widgetRefs.transition==token then group.Visible=false;widgetRefs.mini.Visible=true end end)
  end
  local function restore()
    closeMenu()
    widgetRefs.transition=widgetRefs.transition+1;state.minimized=false;widgetRefs.mini.Visible=false;group.Visible=true
    scale.Scale=1;tween(group,{GroupTransparency=0},.16)
  end
  -- Release toggles only a clean Alt tap, not Alt+Tab or another chord.
  widgetRefs.altArmed=false
  local function altAllowed()
   return not state.closed and not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled==true
    and not state.manual.recording and state.keybinds.minimizeLeftAlt and (not state.boot or state.boot.complete)and not UserInputService:GetFocusedTextBox()
  end
  connect(UserInputService.InputBegan:Connect(function(event,processed)
   if event.KeyCode~=Enum.KeyCode.LeftAlt then if widgetRefs.altArmed then widgetRefs.altArmed=false end;return end
   widgetRefs.altArmed=false;if processed or not altAllowed()then return end
   if type(UserInputService.GetKeysPressed)=='function'then
    for _,held in ipairs(UserInputService:GetKeysPressed())do if held.KeyCode~=Enum.KeyCode.LeftAlt then return end end
   end
   widgetRefs.altArmed=true
  end))
  connect(UserInputService.InputEnded:Connect(function(event,processed)
   if event.KeyCode~=Enum.KeyCode.LeftAlt then return end
   local armed=widgetRefs.altArmed;widgetRefs.altArmed=false
   if not armed or processed or not altAllowed()then return end
   if state.minimized then restore()else minimize()end
  end))
  connect(UserInputService.WindowFocusReleased:Connect(function()widgetRefs.altArmed=false end))

  local function drag(handle,target,key,isMini)
    local active,start,origin,moved
    connect(handle.InputBegan:Connect(function(event)
      if not active and (event.UserInputType==Enum.UserInputType.MouseButton1 or event.UserInputType==Enum.UserInputType.Touch)then closeMenu();active=event;start=event.Position;origin=target.Position;moved=false end
    end))
    connect(UserInputService.InputChanged:Connect(function(event)
      if active and (event==active or (active.UserInputType==Enum.UserInputType.MouseButton1 and event.UserInputType==Enum.UserInputType.MouseMovement))then
        local d=event.Position-start
        if d.Magnitude>6 then moved=true end
        if moved then
          local view=workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1100,720)
          local baseX=origin.X.Scale*view.X+origin.X.Offset
          local baseY=origin.Y.Scale*view.Y+origin.Y.Offset
          target.Position=UDim2.fromOffset(baseX+d.X,baseY+d.Y)
          state[key]=target.Position
        end
      end
    end))
    connect(UserInputService.InputEnded:Connect(function(event)
      if active==event then active=nil;if isMini and not moved then restore()elseif not isMini and moved then state.windowSettings.x=target.Position.X.Offset;state.windowSettings.y=target.Position.Y.Offset;saveSettings()end end
    end))
  end
  widgetRefs.dragArea=mk('Frame',widgetRefs.header,{Name='DragHandle',Size=UDim2.new(1,-125,1,0),BackgroundTransparency=1,Active=true})
  drag(widgetRefs.dragArea,group,'windowPosition',false);drag(widgetRefs.mini,widgetRefs.mini,'miniPosition',true)
  widgetRefs.minimizeButton=btn(widgetRefs.header,'−',minimize,27,27);widgetRefs.minimizeButton.Position=UDim2.new(1,-112,0,16)
  widgetRefs.refreshButton=btn(widgetRefs.header,'⟳',function()if state.refresh then state.refresh()end end,27,27);widgetRefs.refreshButton.Position=UDim2.new(1,-77,0,16)
  widgetRefs.closeButton=btn(widgetRefs.header,'×',function()if state.close then state.close(false)end end,27,27);widgetRefs.closeButton.Position=UDim2.new(1,-42,0,16);widgetRefs.closeButton.TextColor3=C.pink
  tooltip(widgetRefs.minimizeButton,'Minimize · active tasks keep running')
  tooltip(widgetRefs.refreshButton,'Refresh this view without restarting tasks')
  tooltip(widgetRefs.closeButton,'Unload REDLINE and restore owned character settings')
  -- Screen-level notification is independent of the draggable window.
  widgetRefs.notice=rounded(mk('CanvasGroup',screen,{Name='GameNotification',Visible=false,AnchorPoint=Vector2.new(.5,0),Position=UDim2.new(.5,0,0,-120),Size=UDim2.fromOffset(380,108),BackgroundColor3=Color3.fromRGB(36,38,46),BorderSizePixel=0,GroupTransparency=0}),9)
  stroke(widgetRefs.notice,Color3.fromRGB(118,80,91));mk('Frame',widgetRefs.notice,{Size=UDim2.new(1,0,0,2),BackgroundColor3=C.red,BorderSizePixel=0})
  widgetRefs.noticeTitle=txt(widgetRefs.notice,'',20,11,C.pink,true);widgetRefs.noticeTitle.Position=UDim2.fromOffset(14,9);widgetRefs.noticeTitle.Size=UDim2.new(1,-55,0,20)
  widgetRefs.noticeMessage=txt(widgetRefs.notice,'',23,10,C.white);widgetRefs.noticeMessage.Position=UDim2.fromOffset(14,32);widgetRefs.noticeMessage.Size=UDim2.new(1,-28,0,23)
  widgetRefs.noticeHint=txt(widgetRefs.notice,'Closes after six seconds',20,9,C.dim);widgetRefs.noticeHint.Position=UDim2.fromOffset(14,72);widgetRefs.noticeHint.Size=UDim2.new(1,-145,0,20)
  local noticeId,noticeCallback=0,nil
  local function dismissNotice()
    state.notifications.currentCategory=nil
    noticeId=noticeId+1;local mine=noticeId;noticeCallback=nil
    tween(widgetRefs.notice,{Position=UDim2.new(.5,0,0,-120),GroupTransparency=1},.3)
    task.delay(.31,function()if widgetRefs.notice.Parent and mine==noticeId then widgetRefs.notice.Visible=false end end)
  end
  widgetRefs.noticeAction=btn(widgetRefs.notice,'GO',function()local callback=noticeCallback;dismissNotice();if callback then callback()end end,108,32,true);widgetRefs.noticeAction.Position=UDim2.new(1,-122,0,69)
  widgetRefs.dismissButton=btn(widgetRefs.notice,'×',dismissNotice,30,30);widgetRefs.dismissButton.Position=UDim2.new(1,-34,0,9)
  notifyUser=function(category,message,label,callback)
    if state.closed or not screen.Parent or not state.notifications.allowed(category)then return end
    local duplicate=category..'|'..message
    if state.notifications.lastKey==duplicate and os.clock()-(state.notifications.lastAt or 0)<2 then return end
    state.notifications.lastKey=duplicate;state.notifications.lastAt=os.clock()
    state.notifications.currentCategory=category
    noticeId=noticeId+1;local mine=noticeId;noticeCallback=callback
    widgetRefs.noticeTitle.Text='REDLINE · WANTED · '..category;widgetRefs.noticeMessage.Text=message;widgetRefs.noticeAction.Text=label or 'OK'
    widgetRefs.notice.Visible=true;tween(widgetRefs.notice,{Position=UDim2.new(.5,0,0,10),GroupTransparency=0},.3)
    local duration=(category=='CONFIRM'or category=='LOW AMMO')and 20 or 6
    widgetRefs.noticeHint.Text='Dismiss or choose an action · '..duration..'s'
    task.delay(duration,function()if widgetRefs.notice.Parent and mine==noticeId then dismissNotice()end end)
  end
  -- Home: the same three-tile overview and compact rows as the reference.
  state.notify=notifyUser
  state.notifications.dismiss=dismissNotice
  state.notifications.set=function(category,value)
    state.notifications.preferences[category]=value~=false
    if value==false and state.notifications.currentCategory==category then dismissNotice()end
    saveSettings()
  end
  widgetRefs.home=pages.Home
  widgetRefs.setupCard=card(widgetRefs.home,'Complete account setup')
  widgetRefs.setupLine=line(widgetRefs.setupCard,'Tutorials and Ghost Quest')
  widgetRefs.setupButton=action(widgetRefs.setupLine,'Start setup',function()if state.setup.active then state.setup.cancel('Stopped by user')else state.setup.start()end end,110,true)
  widgetRefs.setupStatus=txt(widgetRefs.setupCard,'Ready',38,11,C.muted);widgetRefs.setupStatus.TextWrapped=true

  widgetRefs.stats=row(widgetRefs.home,77)
  widgetRefs.statGrid=mk('UIGridLayout',widgetRefs.stats,{CellSize=UDim2.new(1/3,-6,0,77),CellPadding=UDim2.fromOffset(9,9),SortOrder=Enum.SortOrder.LayoutOrder})
  widgetRefs.statValues={}
  for index,entry in ipairs({{'Balance','Current cash'},{'Session','Time active'},{'Skeleton Key','Inventory check'}})do
    local tile=rounded(mk('Frame',widgetRefs.stats,{Position=UDim2.new((index-1)/3,(index-1)*3,0,0),Size=UDim2.new(1/3,-6,1,0),BackgroundColor3=C.raised,BorderSizePixel=0}),7)
    pad(tile,8,10,8,10)
    txt(tile,entry[1],14,9,C.dim)
    local value=txt(tile,'Reading',23,16,C.white,true);value.Position=UDim2.fromOffset(0,17);widgetRefs.statValues[index]=value
    local hint=txt(tile,entry[2],13,9,C.dim);hint.Position=UDim2.fromOffset(0,44)
  end
  widgetRefs.starter=card(widgetRefs.home,'Account Starter')
  divider(widgetRefs.starter)
  widgetRefs.introLine=line(widgetRefs.starter,'Skip initial tutorial');action(widgetRefs.introLine,'Skip intro',trySkipBayview,98)
  local bankLine,bankLabel=line(widgetRefs.starter,'Bank tutorial')
  widgetRefs.bankButton=action(bankLine,'Start tutorial',bank.start,112,true)
  textIcon(widgetRefs.bankButton,'check');textIcon(bankLabel,'check')
  widgetRefs.bankStopLine=line(widgetRefs.starter,'Tutorial controls');action(widgetRefs.bankStopLine,'Stop',bank.stop,75)
  widgetRefs.keyLine=line(widgetRefs.starter,'Skeleton Key')
  widgetRefs.keyState=txt(widgetRefs.keyLine,'Checking',28,10,C.pink);widgetRefs.keyState.Size=UDim2.fromOffset(125,28);widgetRefs.keyState.Position=UDim2.new(1,-125,0,0);widgetRefs.keyState.TextXAlignment=Enum.TextXAlignment.Right
  widgetRefs.tutorialStatus=txt(widgetRefs.starter,'Checking account state',40,12,C.dim);widgetRefs.tutorialStatus.TextWrapped=true;widgetRefs.tutorialStatus.TextTruncate=Enum.TextTruncate.None
  widgetRefs.inv=card(widgetRefs.home,'Account inventory')
  widgetRefs.inventory=txt(widgetRefs.inv,'Reading current tools...',21,10,C.muted)
  widgetRefs.bagLabel=txt(widgetRefs.inv,'Bag · Reading',20,10,C.muted)
  widgetRefs.bagBar=progress(widgetRefs.inv)
  widgetRefs.activityLine=line(widgetRefs.inv,'Current action')
  widgetRefs.activity=txt(widgetRefs.activityLine,'Idle',28,10,C.green);widgetRefs.activity.Position=UDim2.new(1,-160,0,0);widgetRefs.activity.Size=UDim2.fromOffset(160,28);widgetRefs.activity.TextXAlignment=Enum.TextXAlignment.Right
  widgetRefs.quick=card(widgetRefs.home,'Quick Access')
  -- Gunshop controls are owned by Combat below.
  widgetRefs.captureLine=line(widgetRefs.quick,'Tutorial route')
  widgetRefs.routeToggle=action(widgetRefs.captureLine,'Waypoints ▾',function()end,115)
  widgetRefs.routeEditor=card(widgetRefs.home,'Saved Tutorial Route','Recorded coordinates · no automatic detours');widgetRefs.routeEditor.Visible=false
  widgetRefs.routeStep=txt(widgetRefs.routeEditor,'',20,11,C.muted)
  widgetRefs.routeActions=row(widgetRefs.routeEditor,27)
  btn(widgetRefs.routeActions,'Previous',function()bank.index=math.max(1,bank.index-1)end,82)
  btn(widgetRefs.routeActions,'Capture',bank.capture,88).Position=UDim2.fromOffset(89,0)
  btn(widgetRefs.routeActions,'Next',function()bank.index=math.min(#bank.steps,bank.index+1)end,65).Position=UDim2.fromOffset(184,0)
  connect(widgetRefs.routeToggle.Activated:Connect(function()expand(widgetRefs.routeEditor,not widgetRefs.routeEditor.Visible)end))
  widgetRefs.exportLine=line(widgetRefs.routeEditor,'Saved route data');action(widgetRefs.exportLine,'Export',bank.export,88)
  widgetRefs.recheckLine=line(widgetRefs.quick,'Account status');action(widgetRefs.recheckLine,'Recheck',function()bank.check();syncExisting()end,95)
  -- Events
  widgetRefs.mission=card(pages.Events,'Speaker For The Dead')
  widgetRefs.questStatus=txt(widgetRefs.mission,'Not started',20,11,C.pink);textIcon(widgetRefs.questStatus,'check')
  widgetRefs.questStatus.Name='QuestStatus'
  widgetRefs.ghosts=txt(widgetRefs.mission,'Confirmed ghosts · 0 / 9',22,12,C.muted);widgetRefs.ghosts.Name='QuestObjective'
  widgetRefs.questDetail=txt(widgetRefs.mission,'',42,11,C.dim);widgetRefs.questDetail.TextWrapped=true;widgetRefs.questDetail.TextTruncate=Enum.TextTruncate.None
  widgetRefs.questDetail.Name='QuestDetail'
  widgetRefs.ghostBar=progress(widgetRefs.mission);widgetRefs.ghostBar.Name='QuestProgress'
  widgetRefs.questGuide=txt(widgetRefs.mission,'Accept mission  >  Amulet  >  Ghosts  >  Return & hand in',32,10,C.dim);widgetRefs.questGuide.TextWrapped=true;widgetRefs.questGuide.TextTruncate=Enum.TextTruncate.None
  widgetRefs.questLine=line(widgetRefs.mission,'Current account only');local questButton=action(widgetRefs.questLine,'Start quest',function()if not state.quest.workflowComplete then startQuest()end end,105,true)
  textIcon(questButton,'check')
  widgetRefs.questControls=row(widgetRefs.mission,27)
  widgetRefs.questControls.Name='QuestControls'
  widgetRefs.questPause=btn(widgetRefs.questControls,'Pause / Resume',function()setPaused(not state.paused)end,129)
  widgetRefs.questStop=btn(widgetRefs.questControls,'Stop',stop,75);widgetRefs.questStop.Position=UDim2.fromOffset(137,0)
  widgetRefs.keyInfo=txt(widgetRefs.mission,'Key possession is checked separately from quest progress.',36,10,C.dim);widgetRefs.keyInfo.TextWrapped=true;widgetRefs.keyInfo.TextTruncate=Enum.TextTruncate.None
  widgetRefs.questStatus.Size=UDim2.new(1,0,0,40);widgetRefs.questStatus.TextWrapped=true;widgetRefs.questStatus.TextTruncate=Enum.TextTruncate.None
  local function renderQuest()
    if not screen.Parent then return end
    local view=state.quest.display()
    widgetRefs.questStatus.Text=view.status;widgetRefs.ghosts.Text=view.objective;widgetRefs.questDetail.Text=view.detail;widgetRefs.keyInfo.Text=view.info
    widgetRefs.ghostBar.Size=UDim2.fromScale(view.fill,1);widgetRefs.ghostBar.BackgroundColor3=view.phase=='COMPLETED'and C.green or C.red
    widgetRefs.questGuide.Visible=view.phase~='COMPLETED'
    widgetRefs.questStatus.TextColor3=view.phase=='COMPLETED'and C.green or C.pink
    questButton.Text=view.button;questButton.Active=not state.quest.workflowComplete and not view.active;questButton.Selectable=questButton.Active
    questButton.TextTransparency=questButton.Active and 0 or .35;accent(questButton,view.phase~='COMPLETED')
    widgetRefs.questControls.Visible=view.active;widgetRefs.questPause.Active=view.active;widgetRefs.questStop.Active=view.active
    widgetRefs.questPause.Selectable=view.active;widgetRefs.questStop.Selectable=view.active
  end
  state.quest.render=renderQuest;renderQuest()
  -- Combat
  combat.v30.buildUI(pages.Combat,sync)
  -- Auto Farm
  widgetRefs.farm=pages['Auto Farm']
  widgetRefs.bagCard=card(widgetRefs.farm,'Bag Manager')
  widgetRefs.bagInfo=txt(widgetRefs.bagCard,'Reading inventory',22,12,C.white)
  widgetRefs.farmBagBar=progress(widgetRefs.bagCard)
  widgetRefs.bagItems=txt(widgetRefs.bagCard,'',18,10,C.muted)
  widgetRefs.seller=txt(widgetRefs.bagCard,'',18,10,C.dim)
  action(line(widgetRefs.bagCard,'Manual bag selling'),'Sell Bag Now',function()bag.sellNow()end,132,true)
  sync(slider(widgetRefs.bagCard,'Early sell after 25% full',10,15,5,function()return bag.earlyMinutes end,function(v)bag.earlyMinutes=v;saveSettings()end,' min'))
  widgetRefs.bankCard=card(widgetRefs.farm,'Bank Farm')
  widgetRefs.bankStatus=txt(widgetRefs.bankCard,'Checking vault',22,11,C.muted)
  widgetRefs.bankTimer=txt(widgetRefs.bankCard,'Bank cycle · Syncing',18,10,C.pink)
  widgetRefs.bankActionLine=line(widgetRefs.bankCard,'Continuous farming')
  widgetRefs.bankToggle=action(widgetRefs.bankActionLine,'Start',function()if bankFarm.autoMode or bankFarm.running then bankFarm.stop()else bankFarm.start(false)end end,87,true)
  widgetRefs.vaultLine=line(widgetRefs.bankCard,'Included vaults')
  widgetRefs.vaultToggle=action(widgetRefs.vaultLine,'Select vaults ▾',function()end,140)
  dropdown(widgetRefs.vaultToggle,{'All Vaults','Regular','Silver','Gold','Sapphire','Ruby','Emerald','Amethyst','Diamond'},function()
    local selection=table.clone(bankFarm.selected);selection['All Vaults']=bankFarm.allVaultsSelected();return selection
  end,function(name,value)
    if name=='All Vaults' then bankFarm.selectAll(value) else bankFarm.selected[name]=value;bankFarm.observerDirty=true;saveSettings()end
  end,true,'Included vaults')
  widgetRefs.unknownLine=line(widgetRefs.bankCard,'Unknown rarity (All Vaults)')
  widgetRefs.unknownToggle=action(widgetRefs.unknownLine,'Allow if available',function()end,145)
  dropdown(widgetRefs.unknownToggle,{'Allow if available','Wait for rarity'},function()return bankFarm.unknownPolicy=='wait' and 'Wait for rarity' or 'Allow if available'end,function(value)
    bankFarm.setUnknownPolicy(value=='Wait for rarity' and 'wait' or 'allow_all')
  end,false,'Unknown vault policy')
  local optionsLine=line(widgetRefs.bankCard,'Cash and valuables')
  local optionsToggle=action(optionsLine,'Loot options ▾',function()end,140)
  local vaultPanel=card(widgetRefs.farm,'Bank loot options');vaultPanel.Visible=false

  sync(toggle(vaultPanel,'Collect small cash piles',function()return bankFarm.collectSmall end,function(v)bankFarm.collectSmall=v;saveSettings()end))
  sync(toggle(vaultPanel,'Skip gold valuables',function()return bankFarm.skipGold end,function(v)bankFarm.skipGold=v;saveSettings()end))
  sync(toggle(vaultPanel,'Skip silver valuables',function()return bankFarm.skipSilver end,function(v)bankFarm.skipSilver=v;saveSettings()end))
  connect(optionsToggle.Activated:Connect(function()expand(vaultPanel,not vaultPanel.Visible)end))
  local airdropCard=card(widgetRefs.farm,'Airdrops')
  local airTimer=txt(airdropCard,'Next airdrop · Syncing',18,10,C.pink)
  local airStats=txt(airdropCard,'Opened 0 · Golden Barretts 0',18,10,C.dim)
  local airStatus=txt(airdropCard,'Idle',22,11,C.muted)
  local airLine=line(airdropCard,'Continuous farming')
  local airToggle=action(airLine,'Start',function()if af.enabled or af.requested then afStop()else afStart(false)end end,87,true)
  widgetRefs.teamCard=card(widgetRefs.farm,'Team Changer','Switch through WANTED faction interactions')
  widgetRefs.teamStatus=txt(widgetRefs.teamCard,'Current team · Checking',25,11,C.muted)
  for _,entry in ipairs({{'Civilian','civilian'},{'Criminal','criminal'},{'Police','police'}})do
    action(line(widgetRefs.teamCard,entry[1]),'Switch',function()state.teams.change(entry[2])end,90)
  end
  -- Loot rules get a dedicated workspace, not another long card under farm controls.
  local filter=card(widgetRefs.farm,'Loot rules')
  filter:FindFirstChildOfClass('TextLabel').Visible=false
  filter:FindFirstChildOfClass('UIListLayout').Padding=UDim.new(0,7)
  filter.Name='LootRules';filter.LayoutOrder=4
  widgetRefs.bagCard.LayoutOrder=30;widgetRefs.teamCard.LayoutOrder=35;widgetRefs.bankCard.LayoutOrder=10;vaultPanel.LayoutOrder=11;airdropCard.LayoutOrder=20
  local top=row(filter,32)
  local tabs=rounded(mk('Frame',top,{Size=UDim2.fromOffset(208,32),BackgroundColor3=C.base,BorderSizePixel=0}),8)
  local simple=btn(tabs,'Simple',function()end,100,28,true);simple.Position=UDim2.fromOffset(2,2)
  local advanced=btn(tabs,'Advanced',function()end,102,28);advanced.Position=UDim2.fromOffset(104,2)
  local filterSummary=txt(top,'',28,12,C.muted)
  filterSummary.AnchorPoint=Vector2.new(1,0);filterSummary.Position=UDim2.fromScale(1,0);filterSummary.Size=UDim2.fromOffset(290,28);filterSummary.TextXAlignment=Enum.TextXAlignment.Right
  local filterHint=txt(filter,'',30,11,C.dim);filterHint.TextWrapped=true;filterHint.TextTruncate=Enum.TextTruncate.None
  local rarityColors={Common=Color3.fromRGB(173,181,192),Uncommon=Color3.fromRGB(127,195,157),Rare=Color3.fromRGB(120,169,227),Epic=Color3.fromRGB(190,154,237),Legendary=Color3.fromRGB(234,194,119),Mythic=Color3.fromRGB(229,133,158),Unclassified=C.dim}
  state.filterView=state.filterView or {mode='simple',category='All',query='',scroll=Vector2.zero}
  local view=state.filterView
  local simplePanel=order(mk('Frame',filter,{Name='SimpleRules',Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1}));stack(simplePanel,10)
  local rarityGrid=row(simplePanel,222)
  local rarityLayout=mk('UIGridLayout',rarityGrid,{CellSize=UDim2.new(1,0,0,32),CellPadding=UDim2.fromOffset(0,6),SortOrder=Enum.SortOrder.LayoutOrder})
  local rarityButtons={}
  local repaintFilter
  for index,name in ipairs({'Common','Uncommon','Rare','Epic','Legendary','Mythic'})do
    local b=btn(rarityGrid,'',function()state.globalLoot.simple[name]=not state.globalLoot.simple[name];saveSettings();repaintFilter()end,100,46)
    b.LayoutOrder=index
    local mark=rounded(mk('Frame',b,{Position=UDim2.fromOffset(10,8),Size=UDim2.fromOffset(3,16),BorderSizePixel=0,BackgroundColor3=rarityColors[name]}),2)
    local label=txt(b,name,19,12,rarityColors[name],true);label.Position=UDim2.fromOffset(22,6);label.Size=UDim2.new(.5,-22,0,19)
    local status=txt(b,'',15,10,C.muted);status.AnchorPoint=Vector2.new(1,0);status.Position=UDim2.new(1,-12,0,8);status.Size=UDim2.new(.5,0,0,16);status.TextXAlignment=Enum.TextXAlignment.Right
    rarityButtons[name]={button=b,status=status,mark=mark}
  end
  local rarityActions=row(simplePanel,30)
  btn(rarityActions,'All rarities',function()for name in pairs(state.globalLoot.simple)do state.globalLoot.simple[name]=true end;saveSettings();repaintFilter()end,112,30).Position=UDim2.fromOffset(0,0)
  btn(rarityActions,'No rarities',function()for name in pairs(state.globalLoot.simple)do state.globalLoot.simple[name]=false end;saveSettings();repaintFilter()end,112,30).Position=UDim2.fromOffset(120,0)
  local simpleNote=txt(simplePanel,'Item overrides win over rarity choices. Money printers and presents keep your custom Mythic preference.',48,12,C.muted)
  simpleNote.TextWrapped=true;simpleNote.TextTruncate=Enum.TextTruncate.None
  local advancedPanel=order(mk('Frame',filter,{Name='AdvancedRules',Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1}));stack(advancedPanel,8)
  local searchRow=row(advancedPanel,34)
  local lootSearch=input(searchRow,'Search items...');lootSearch.Size=UDim2.new(1,-66,1,0);lootSearch.Text=view.query
  local clearSearch=btn(searchRow,'Clear',function()lootSearch.Text='';view.query='';repaintFilter()end,58,34);clearSearch.AnchorPoint=Vector2.new(1,0);clearSearch.Position=UDim2.fromScale(1,0)
  local categories=row(advancedPanel,34)
  local categoryButtons={}
  local categoryToggle=btn(categories,'All ▾',function()end,132,32)
  dropdown(categoryToggle,{'All','Guns','Gems','Jewelry','Tech','Shoes','Other'},function()return view.category end,function(value)view.category=value;repaintFilter()end,false,'Item category')
  view.rarity=view.rarity or 'All rarities'
  local tierToggle=btn(categories,'All rarities ▾',function()end,140,32);tierToggle.Position=UDim2.fromOffset(140,0)
  dropdown(tierToggle,{'All rarities','Common','Uncommon','Rare','Epic','Legendary','Mythic'},function()return view.rarity end,function(value)view.rarity=value;repaintFilter()end,false,'Rarity')

  local resultsHeader=row(advancedPanel,21)
  local resultsLabel=txt(resultsHeader,'',21,11,C.dim)
  local columnHeader=row(advancedPanel,20)
  local nameColumn=txt(columnHeader,'ITEM',20,10,C.dim,true);nameColumn.Size=UDim2.new(.46,0,1,0)
  local rarityColumn=txt(columnHeader,'RARITY',20,10,C.dim,true);rarityColumn.Position=UDim2.fromScale(.46,0);rarityColumn.Size=UDim2.fromScale(.2,1)
  local ruleColumn=txt(columnHeader,'CURRENT RULE',20,10,C.dim,true);ruleColumn.AnchorPoint=Vector2.new(1,0);ruleColumn.Position=UDim2.fromScale(1,0);ruleColumn.Size=UDim2.fromOffset(134,20)
  local savedFilterScroll=view.scroll or Vector2.zero
  local lootRows=scroll(advancedPanel,240);lootRows.Name='LootResults'
  local names,canonicalSeen={},{}
  for _,name in ipairs(state.naturalLootCatalog)do
    local key=baseLootName(name)
    if not canonicalSeen[key] then canonicalSeen[key]=true;table.insert(names,name) end
  end
  table.sort(names,function(a,b)local pa,pb=state.globalLoot.priority(a),state.globalLoot.priority(b);if pa~=pb then return pa<pb end;return a:lower()<b:lower()end)
  local lootFrames={}
  local ruleEditor={}
  for index,name in ipairs(names)do
    local frame=row(lootRows,62);frame.Name='Item_'..name
    frame.BackgroundTransparency=index%2==0 and .7 or 1;frame.BackgroundColor3=C.raised
    local key=baseLootName(name)
    local label=txt(frame,name,21,12,C.white,true);label.Position=UDim2.fromOffset(8,6);label.Size=UDim2.new(1,-240,0,21)
    local tier=state.globalLoot.rarity(name)
    local badge=rounded(mk('TextLabel',frame,{Position=UDim2.fromOffset(8,32),Size=UDim2.fromOffset(85,19),Text=tier,Font=Enum.Font.GothamMedium,TextSize=10,TextColor3=rarityColors[tier] or C.dim,BorderSizePixel=0,BackgroundColor3=C.raised}),4)
    local inherited=txt(frame,'',18,10,C.dim);inherited.Position=UDim2.fromOffset(100,32);inherited.Size=UDim2.new(1,-330,0,18)
    local control=btn(frame,'Default',function()end,134,30);control.Name='Rule_'..name
    control.AnchorPoint=Vector2.new(1,.5);control.Position=UDim2.new(1,-7,.5,0)
    if not ruleEditor.open then
      ruleEditor.key=key
      local update,open=dropdown(control,{'Default','Collect','Skip'},function()local value=state.globalLoot.overrides[ruleEditor.key];return value=='collect'and 'Collect'or value=='skip'and 'Skip'or 'Default'end,function(option)
        state.globalLoot.overrides[ruleEditor.key]=option~='Default'and option:lower()or nil;saveSettings();repaintFilter()
      end,false,'Item rule',true)
      ruleEditor.open=open
    end
    connect(control.Activated:Connect(function()ruleEditor.key=key;ruleEditor.open(control,'Rule: '..name)end))
    lootFrames[name]={frame=frame,label=label,badge=badge,inherited=inherited,control=control,key=key}
  end

  local empty=txt(lootRows,'No matching items. Clear search or choose All.',76,12,C.muted);empty.Name='NoResults';empty.TextWrapped=true
  local resetRow=row(advancedPanel,30)
  local resetOverrides=btn(resetRow,'Clear item overrides',function()notifyUser('CONFIRM','Clear every item override? Rarity settings stay as selected.','Confirm',function()state.globalLoot.overrides={};saveSettings();repaintFilter()end)end,164,30)
  local resetVisible=btn(resetRow,'Reset shown',function()local keys={};for _,entry in pairs(lootFrames)do if entry.frame.Visible then table.insert(keys,entry.key)end end;notifyUser('CONFIRM','Reset overrides for the currently shown items?','Confirm',function()for _,key in ipairs(keys)do state.globalLoot.overrides[key]=nil end;saveSettings();repaintFilter()end)end,106,30);resetVisible.Position=UDim2.fromOffset(172,0)
  tooltip(resetVisible,'Remove only the explicit overrides for the items currently shown')
  local unknown=txt(filter,'Unclassified items use saved legacy rules. Quest items and cash have separate objective controls.',38,11,C.dim);unknown.TextWrapped=true;unknown.TextTruncate=Enum.TextTruncate.None
  repaintFilter=function()
    local tiers,overrides={},0
    for _,name in ipairs({'Common','Uncommon','Rare','Epic','Legendary','Mythic'})do
      local on=state.globalLoot.simple[name];if on then table.insert(tiers,name)end
      local record=rarityButtons[name];record.button:SetAttribute('Accent',false);record.button.BackgroundColor3=on and C.raised or C.card;record.status.Text=on and 'Included  +'or 'Excluded  -';record.status.TextColor3=on and C.green or C.dim;record.mark.BackgroundTransparency=on and 0 or .6
    end
    for _ in pairs(state.globalLoot.overrides)do overrides=overrides+1 end
    filterSummary.Text=#tiers..' of 6 rarities  ·  '..overrides..' item overrides'
    filterHint.Text=#tiers==6 and 'All rarities included. Golden Barrett has first priority when eligible.' or (#tiers==0 and 'Rarities excluded; explicit Collect overrides still apply.' or 'Included: '..table.concat(tiers,', '))
    simplePanel.Visible=view.mode=='simple';advancedPanel.Visible=view.mode=='advanced'
    accent(simple,view.mode=='simple');accent(advanced,view.mode=='advanced')
    for category,b in pairs(categoryButtons)do accent(b,view.category==category)end
    local query=view.query:lower():gsub('[%s%p]','')
    local count,eligible=0,0
    for name,entry in pairs(lootFrames)do
      local visible=(view.category=='All' or state.globalLoot.category(name)==view.category) and (view.rarity=='All rarities' or state.globalLoot.rarity(name)==view.rarity) and (query=='' or name:lower():gsub('[%s%p]',''):find(query,1,true)~=nil)
      entry.frame.Visible=visible;if visible then count=count+1;if passesGlobalLoot(name)then eligible=eligible+1 end end
      local override=state.globalLoot.overrides[entry.key]
      local chosen=override=='collect' and 'Collect' or override=='skip' and 'Skip' or 'Default'
      entry.control:SetAttribute('DefaultLabel','Default: '..(passesGlobalLoot(name)and 'Collect'or 'Skip'))
      entry.control:SetAttribute('Accent',override~=nil);entry.control.Text=(chosen=='Default'and entry.control:GetAttribute('DefaultLabel')or chosen)..' ▾';entry.control.TextSize=11;textIcon(entry.control,'chevron')
      entry.control.BackgroundColor3=override and C.soft or C.raised
      entry.control.TextColor3=override=='collect'and C.green or override=='skip'and C.pink or C.white
      local border=entry.control:FindFirstChildOfClass('UIStroke');if border then border.Color=override and C.pink or C.line end
      local origin=state.globalLoot.raritySource(name)
      entry.inherited.Text=entry.key=='golden barrett m82' and (override=='skip' and 'Skipped' or '#1 eligible priority') or override and 'Item override' or (passesGlobalLoot(name) and 'Inherited · collect' or 'Inherited · skip')
      entry.badge.Text=state.globalLoot.rarity(name)..(origin=='Custom' and '*' or '')
      entry.control:SetAttribute('RaritySource',origin)
    end
    filterHint.Visible=view.mode=='simple';unknown.Visible=view.mode=='simple'
    empty.Visible=count==0;resultsLabel.Text=count..' / '..#names..' items  ·  '..eligible..' eligible'
    resetOverrides.Active=overrides>0;resetOverrides.TextTransparency=overrides>0 and 0 or .5
  end
  local searchGeneration=0
  connect(lootSearch:GetPropertyChangedSignal('Text'):Connect(function()searchGeneration=searchGeneration+1;local mine=searchGeneration;task.delay(.15,function()if screen.Parent and mine==searchGeneration then view.query=lootSearch.Text;repaintFilter()end end)end))
  connect(lootRows:GetPropertyChangedSignal('CanvasPosition'):Connect(function()view.scroll=lootRows.CanvasPosition end))
  connect(simple.Activated:Connect(function()view.mode='simple';repaintFilter()end))
  connect(advanced.Activated:Connect(function()view.mode='advanced';repaintFilter()end))
  repaintFilter()
  local farmNav=row(widgetRefs.farm,34);farmNav.LayoutOrder=3
  local overview=btn(farmNav,'Farm overview',function()end,130,32,true)
  local rules=btn(farmNav,'Loot rules',function()end,116,32);rules.Position=UDim2.fromOffset(138,0)
  state.farmView=state.farmView or 'overview'
  local function switchFarm(name,preserveScroll)
    state.farmView=name
    widgetRefs.farm:FindFirstChild('PageTitle').Visible=name~='rules'
    widgetRefs.farm:FindFirstChild('PageSubtitle').Visible=name~='rules'
    filter.Visible=name=='rules'
    widgetRefs.bagCard.Visible=name=='overview';widgetRefs.teamCard.Visible=name=='overview';widgetRefs.bankCard.Visible=name=='overview';airdropCard.Visible=name=='overview'
    vaultPanel.Visible=false
    accent(overview,name=='overview');accent(rules,name=='rules')
    if not preserveScroll then widgetRefs.farm.CanvasPosition=Vector2.zero end
  end
  connect(overview.Activated:Connect(function()switchFarm('overview')end))
  connect(rules.Activated:Connect(function()switchFarm('rules')end))
  switchFarm(state.farmView,true)
  task.defer(function()if lootRows.Parent then lootRows.CanvasPosition=savedFilterScroll end end)
  local function resizeFilter(compact,height)
    local landscape=compact and height<460
    top.Size=UDim2.new(1,0,0,compact and not landscape and 60 or 32)
    filterSummary.Visible=not landscape
    categories.Parent=landscape and searchRow or advancedPanel
    categories.AnchorPoint=landscape and Vector2.new(1,0)or Vector2.zero
    categories.Position=landscape and UDim2.fromScale(1,0)or UDim2.fromOffset(0,0)
    categories.LayoutOrder=2
    lootSearch.Size=UDim2.new(1,landscape and -326 or -66,1,0)
    clearSearch.Position=UDim2.new(1,landscape and -260 or 0,0,0)
    categoryToggle.Size=UDim2.fromOffset(landscape and 116 or 132,32)
    tierToggle.Size=UDim2.fromOffset(landscape and 128 or 140,32);tierToggle.Position=UDim2.fromOffset(landscape and 124 or 140,0)
    filterSummary.AnchorPoint=compact and Vector2.zero or Vector2.new(1,0)
    filterSummary.Position=compact and UDim2.fromOffset(0,32) or UDim2.fromScale(1,0)
    filterSummary.Size=compact and UDim2.new(1,0,0,24) or UDim2.fromOffset(290,28)
    filterSummary.TextXAlignment=compact and Enum.TextXAlignment.Left or Enum.TextXAlignment.Right
    rarityLayout.CellSize=UDim2.new(1,0,0,32)
    rarityGrid.Size=UDim2.new(1,0,0,222)
    categories.Size=landscape and UDim2.fromOffset(252,34)or UDim2.new(1,0,0,34)
    lootRows.Size=UDim2.new(1,0,0,math.max(140,math.min(compact and 300 or 270,height-(compact and 512 or 380))))
    local stacked=compact and not landscape
    columnHeader.Visible=not stacked and not landscape;resultsHeader.Visible=not landscape
    for _,entry in pairs(lootFrames)do
      entry.frame.Size=UDim2.new(1,0,0,stacked and 66 or 42)
      entry.label.Position=UDim2.fromOffset(8,stacked and 3 or 1);entry.label.Size=UDim2.new(stacked and 1 or .46,stacked and -16 or -12,0,21)
      entry.inherited.Position=UDim2.fromOffset(8,stacked and 23 or 22);entry.inherited.Size=UDim2.new(stacked and 1 or .46,stacked and -154 or -12,0,16);entry.inherited.Visible=not stacked
      entry.badge.Position=stacked and UDim2.fromOffset(8,34)or UDim2.new(.46,0,.5,-9);entry.badge.Size=UDim2.fromOffset(stacked and 94 or 86,19)
      entry.control.AnchorPoint=Vector2.new(1,stacked and 0 or .5);entry.control.Position=stacked and UDim2.new(1,-7,0,29)or UDim2.new(1,-7,.5,0)
    end
  end

  -- Settings
  local movement=card(pages.Settings,'Movement')
  sync(slider(movement,'Glide speed',75,90,5,function()return state.speed end,function(v)state.speed=v;saveSettings()end,' studs/s'))
  combat.v30.buildMovement(movement,sync,screen)
  local collisionStatus=txt(movement,'',34,11,C.dim);collisionStatus.TextWrapped=true
  local ownerStatus=txt(movement,'',20,11,C.muted)
  local modeLine=line(movement,'Long-distance travel')
  local modeButton=action(modeLine,'Direct ▾',function()end,145)
  dropdown(modeButton,{'Direct','High-Altitude'},function()return state.navigationSettings.mode end,function(v)state.navigationSettings.mode=v;saveSettings()end,false,'Travel mode')
  sync(slider(movement,'Travel altitude',150,2500,50,function()return state.navigationSettings.altitude end,function(v)state.navigationSettings.altitude=v;saveSettings()end,' studs'))
  sync(slider(movement,'Long-trip threshold',250,5000,50,function()return state.navigationSettings.threshold end,function(v)state.navigationSettings.threshold=v;saveSettings()end,' studs'))
  sync(toggle(movement,'Smart Respawn',function()return state.navigationSettings.smartRespawn end,function(v)state.navigationSettings.smartRespawn=v;saveSettings()end))
  sync(slider(movement,'Minimum time saved',10,120,5,function()return state.navigationSettings.minSaving end,function(v)state.navigationSettings.minSaving=v;saveSettings()end,' sec'))
  local recoveryInfo=txt(movement,'Pullbacks connect for 5 seconds: pause 3s at 4/12/20, restart ascent at 8/16/24, stop at 28. Ghost actions retain four attempts.',54,11,C.dim);recoveryInfo.TextWrapped=true
  if not UserInputService.TouchEnabled then
   sync(toggle(movement,'Left Alt: minimize / restore',function()return state.keybinds.minimizeLeftAlt end,function(value)state.keybinds.minimizeLeftAlt=value;saveSettings()end))
  end

  local notificationCard=card(pages.Settings,'Notification Settings')
  local notificationRow=line(notificationCard,'Choose popup categories')
  local notificationOptions=order(mk('Frame',notificationCard,{Name='NotificationOptions',Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Visible=false}))
  mk('UIListLayout',notificationOptions,{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder})
  local expandNotifications
  expandNotifications=action(notificationRow,'Expand',function()notificationOptions.Visible=not notificationOptions.Visible;expandNotifications.Text=notificationOptions.Visible and 'Collapse'or 'Expand'end,95)
  for _,entry in ipairs(state.notifications.categories)do
   local key,label=entry[1],entry[2]
   sync(toggle(notificationOptions,label,function()return state.notifications.preferences[key]~=false end,function(v)state.notifications.set(key,v)end))
  end
  local diagnose=card(pages.Settings,'Diagnostics')
  local trackerStatus=txt(diagnose,'Tracker · Checking',19,10,C.muted)
  local logBox=order(rounded(mk('TextBox',diagnose,{Size=UDim2.new(1,0,0,110),BackgroundColor3=C.base,BorderSizePixel=0,Text='',TextColor3=C.muted,Font=Enum.Font.Code,TextSize=10,TextEditable=false,MultiLine=true,TextWrapped=true,ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top}),5));pad(logBox,7,7,7,7)
  local logLine=line(diagnose,'Errors and current module state');action(logLine,'Copy log',copyDiagnostics,95)
  state.auth.renderSettings(pages.Settings)
  local about=card(pages.Settings,'REDLINE v30.1');txt(about,'RahamidAli · WANTED',18,10,C.dim)

  -- Free placement survives refresh and viewport changes. Recovery never clamps a drag.
  local recover=btn(screen,'Recover UI',function()
    group.Position=UDim2.fromScale(.5,.5);state.windowPosition=group.Position;state.windowSettings.x=nil;state.windowSettings.y=nil;saveSettings()
    widgetRefs.mini.Position=UDim2.new(0,27,1,-63);state.miniPosition=widgetRefs.mini.Position
    restore()
  end,112,30)
  recover.Name='RecoverUI';recover.AnchorPoint=Vector2.new(.5,0);recover.Position=UDim2.new(.5,0,0,12);recover.ZIndex=80;recover.Visible=false
  local function recovery(view)
    local target=state.minimized and widgetRefs.mini or group
    local pos,size,anchor=target.Position,target.Size,target.AnchorPoint
    local width=size.X.Scale*view.X+size.X.Offset;local height=size.Y.Scale*view.Y+size.Y.Offset
    local x=pos.X.Scale*view.X+pos.X.Offset-width*anchor.X
    local y=pos.Y.Scale*view.Y+pos.Y.Offset-height*anchor.Y
    local gripWidth=state.minimized and width or math.max(0,width-125)
    local gripHeight=state.minimized and height or 59
    local visibleWidth=math.min(view.X,x+gripWidth)-math.max(0,x)
    local visibleHeight=math.min(view.Y,y+gripHeight)-math.max(0,y)
    recover.Visible=(not state.boot or state.boot.complete)and (visibleWidth<32 or visibleHeight<18)
  end
  local previousView=nil;local resize
  local resizeGrip=mk('TextButton',root,{Name='ResizeHandle',AnchorPoint=Vector2.new(1,1),Position=UDim2.fromScale(1,1),Size=UDim2.fromOffset(22,22),BackgroundTransparency=1,Text='',Active=true,Visible=not UserInputService.TouchEnabled})
  local gripIcon=drawIcon(resizeGrip,'chevron',C.muted,14);gripIcon.Position=UDim2.fromOffset(4,4)
  local resizing,resizeStart,resizeSize
  connect(resizeGrip.InputBegan:Connect(function(event)if event.UserInputType==Enum.UserInputType.MouseButton1 then resizing=event;resizeStart=event.Position;resizeSize=group.AbsoluteSize;closeMenu()end end))
  connect(UserInputService.InputChanged:Connect(function(event)if resizing and event.UserInputType==Enum.UserInputType.MouseMovement then local delta=event.Position-resizeStart;state.windowSettings.width=math.clamp(resizeSize.X+delta.X,620,1400);state.windowSettings.height=math.clamp(resizeSize.Y+delta.Y,420,1000);previousView=nil;resize()end end))
  connect(UserInputService.InputEnded:Connect(function(event)if event==resizing then resizing=nil;saveSettings()end end))
  resize=function()
    local view=workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1100,720)
    recovery(view)
    if view==previousView then return end
    previousView=view
    local touch=UserInputService.TouchEnabled;local portrait=view.Y>=view.X
    local width=touch and math.min(portrait and 430 or 580,view.X-24)or math.min(tonumber(state.windowSettings.width)or 920,view.X-18)
    local height=touch and math.min(portrait and 600 or 430,view.Y-24)or math.min(tonumber(state.windowSettings.height)or 620,view.Y-18)
    local compact=touch or width<680
    local side=compact and 0 or 160
    group.Size=UDim2.fromOffset(width,height)
    local statColumns=width<410 and 2 or 3
    widgetRefs.statGrid.CellSize=UDim2.new(1/statColumns,-(statColumns-1)*9/statColumns,0,77)
    widgetRefs.stats.Size=UDim2.new(1,0,0,math.ceil(3/statColumns)*86-9)
    widgetRefs.sidebar.Position=compact and UDim2.new(0,0,1,-72) or UDim2.fromOffset(0,59)
    widgetRefs.sidebar.Size=compact and UDim2.new(1,0,0,49) or UDim2.new(0,side,1,-82)
    widgetRefs.navlabel.Visible=not compact;widgetRefs.profile.Visible=not compact
    for index,name in ipairs({'Home','Events','Combat','Auto Farm','Settings'})do
      local button=navigation[name]
      button.Text=compact and name or ''
      button.TextSize=compact and 11 or 13
      button.TextXAlignment=compact and Enum.TextXAlignment.Center or Enum.TextXAlignment.Left
      button.Position=compact and UDim2.new((index-1)/5,2,0,6) or UDim2.fromOffset(9,39+(index-1)*44)
      button.Size=compact and UDim2.new(.2,-4,0,36) or UDim2.new(1,-18,0,38)
      for _,child in ipairs(button:GetChildren())do if child.Name=='NavigationIcon'or child.Name=='NavigationLabel'then child.Visible=not compact end end
    end
    widgetRefs.pagesRoot.Position=UDim2.fromOffset(side,59);widgetRefs.pagesRoot.Size=UDim2.new(1,-side,1,compact and -131 or -82)
    resizeFilter(compact,height)
    widgetRefs.headerMeta.Visible=width>=600
    widgetRefs.who.Visible=width>=600;widgetRefs.user.Visible=width>=600
    for _,p in pairs(pages)do
      local padding=p:FindFirstChildOfClass('UIPadding')
      padding.PaddingLeft=UDim.new(0,width<700 and 11 or 23);padding.PaddingRight=padding.PaddingLeft
    end
    for _,value in ipairs(widgetRefs.statValues)do value.TextSize=width<600 and 12 or 16 end
    widgetRefs.notice.Size=UDim2.fromOffset(math.min(380,view.X-16),108)
    recovery(view)
  end
  resize()
  local keyboardOrigin
  local function keyboardLayout()
    if not UserInputService.TouchEnabled then return end
    local ok,visible,position=pcall(function()return UserInputService.OnScreenKeyboardVisible,UserInputService.OnScreenKeyboardPosition end)
    if not ok then return end
    if visible and typeof(position)=='Vector2'and position.Y>0 then
      keyboardOrigin=keyboardOrigin or group.Position
      local view=workspace.CurrentCamera.ViewportSize;local base=keyboardOrigin.Y.Scale*view.Y+keyboardOrigin.Y.Offset
      local bottom=base+group.Size.Y.Offset*(1-group.AnchorPoint.Y)
      group.Position=UDim2.new(keyboardOrigin.X.Scale,keyboardOrigin.X.Offset,keyboardOrigin.Y.Scale,keyboardOrigin.Y.Offset-math.max(0,bottom-position.Y+8))
    elseif keyboardOrigin then group.Position=keyboardOrigin;keyboardOrigin=nil end
  end
  for _,property in ipairs({'OnScreenKeyboardVisible','OnScreenKeyboardPosition','OnScreenKeyboardSize'})do pcall(function()connect(UserInputService:GetPropertyChangedSignal(property):Connect(keyboardLayout))end)end
  local nextTick,nextBag,nextBank,nextSync,nextLog=0,0,0,0,0
  local seenCrates=setmetatable({},{__mode='k'})
  connect(RunService.Heartbeat:Connect(function()
    if state.closed or not screen.Parent or os.clock()<nextTick then return end
    local now=os.clock();nextTick=now+.25
    if now>=nextSync then nextSync=now+1;refreshQuestEvidence();state.quest.refreshKey()end
    resize()
    widgetRefs.setupButton.Text=state.setup.active and 'Stop setup'or 'Start setup';widgetRefs.setupStatus.Text=state.setup.status
    renderQuest()
    if state.minimized then return end

    for _,syncControl in ipairs(syncControls)do syncControl()end
    widgetRefs.statValues[2].Text=fmt(now-sessionStarted)
    local data=liveModule('ClientData')
    if data and type(data.Get)=='function'then
      local ok,amount=pcall(data.Get,'cash');if ok and type(amount)=='number'then widgetRefs.statValues[1].Text=cash(amount)end
    end
    widgetRefs.statValues[3].Text=state.keyInInventory and 'Owned'or 'Not found';widgetRefs.statValues[3].TextColor3=C.pink
    widgetRefs.keyState.Text=state.keyInInventory and 'In inventory'or 'Not observed'
    widgetRefs.bankButton.Text=bank.done and 'Completed ✓'or bank.running and 'Running...'or 'Start tutorial';widgetRefs.bankButton.Active=not bank.done and not bank.running;widgetRefs.bankButton.TextTransparency=bank.done and .4 or 0
    widgetRefs.bankStopLine.Visible=bank.running
    bankLabel.Text=bank.done and 'Bank tutorial ✓'or 'Bank tutorial'
    widgetRefs.tutorialStatus.Text=(bank.running or bank.autoStatus:find('Stopped',1,true)) and bank.autoStatus or bank.status
    local toolNames={}
    local tools=itemClient()
    if tools and type(tools.GetItems)=='function'then
      local ok,items=pcall(tools.GetItems)
      if ok and type(items)=='table'and type(items.Tool)=='table'then
        for _,item in pairs(items.Tool)do if type(item)=='table'and type(item.name)=='string'then table.insert(toolNames,item.name)end end
      end
    end
    table.sort(toolNames);widgetRefs.inventory.Text=#toolNames>0 and table.concat(toolNames,'  ·  ')or 'No tools observed'
    widgetRefs.bagLabel.Text=bag.informationReady and ('Bag · '..string.format('%.1f / %.1f kg',bag.weight,bag.capacity)..'  ·  '..cash(bag.value))or 'Bag · Waiting for game data'
    widgetRefs.bagBar.Size=UDim2.fromScale(bag.percent or 0,1);widgetRefs.farmBagBar.Size=widgetRefs.bagBar.Size
    widgetRefs.activity.Text=state.running and (state.paused and 'Quest paused'or 'Ghost quest')or bank.running and (bankFarm.running and 'Bank farm'or 'Bank tutorial')or af.running and 'Airdrop farm'or bag.selling and 'Selling'or 'Idle'
    widgetRefs.routeStep.Text=tostring(bank.index)..'/9 · '..bank.steps[bank.index][2]
    renderQuest()
    widgetRefs.bagInfo.Text=bag.informationReady and string.format('%.1f / %.1f kg  ·  %s',bag.weight,bag.capacity,cash(bag.value))or 'Bag data unavailable'
    local entries={};for index,item in ipairs(bag.items or {})do if index>4 then break end;table.insert(entries,item.name..' x'..item.count)end
    widgetRefs.bagItems.Text=#entries>0 and table.concat(entries,', ')or 'Empty'
    widgetRefs.seller.Text='Seller · '..tostring(bag.seller)..'  ·  '..bag.status..'  ·  '..string.format('%.1f',bag.freeWeight or 0)..'kg free'
    widgetRefs.teamStatus.Text='Current team · '..tostring(player:GetAttribute('currentTeam')or 'civilian')..'  ·  '..tostring(state.teams.status)
    widgetRefs.bankStatus.Text=(bankFarm.running or bankFarm.autoMode or bankFarm.requested) and bankFarm.status or bankFarm.observationStatus or 'Searching for bank vault'
    widgetRefs.bankTimer.Text=bankFarm.clockText()
    widgetRefs.bankToggle.Text=(bankFarm.autoMode or bankFarm.running)and 'Stop'or 'Start'
    airToggle.Text=(af.enabled or af.requested)and 'Stop'or 'Start';airStatus.Text=af.status;airStats.Text='Opened '..af.openCount..' · Golden Barretts '..af.goldenCount
    local globals=liveModule('Globals');local air=globals and globals.AIRDROPS
    if air and tonumber(air.PERIOD)and tonumber(air.OFFSET)then
      local remaining=(air.PERIOD-((DateTime.now().UnixTimestamp-air.OFFSET)%air.PERIOD))%air.PERIOD
      airTimer.Text='Next airdrop · '..fmt(remaining)..' estimated'
    else airTimer.Text='Next airdrop · Waiting for game timing'end
    local locked,owner=state.collision.automatic()
    collisionStatus.Text=locked and ('Required by automation · '..tostring(owner))or ('Manual noclip '..(state.manualNoclipEnabled and 'ON'or 'OFF'))
    ownerStatus.Text='Active task · '..(state.work.lease and state.work.lease.owner or state.work.pending and ('queued '..state.work.pending.name)or 'none')
    trackerStatus.Text=isListed and ('Tracker · '..(state.trackerConnected and 'Connected'or state.networkError~=''and state.networkError or 'Waiting'))or 'Tracker · This account is not on the tracking list'
    if now>=nextLog then
      nextLog=now+3
      local lines={};for index=math.max(1,#state.history-7),#state.history do table.insert(lines,state.history[index])end
      logBox.Text=(#lines>0 and table.concat(lines,'\n')or 'No errors recorded')..state.diagnostics.copyText()
      local ok,crates=pcall(afFindCrates)
      if ok then for _,crate in ipairs(crates)do
        if not seenCrates[crate]then seenCrates[crate]=true;notifyUser('AIRDROP','Airdrop incoming','Farm drop',function()afStart(true)end)end
      end end
    end
  end))
  state.refresh=function()
    state.manual.keys={};state.manual.touch={}
    if state.closed or state.boot and not state.boot.complete then return end
    closeMenu();state.manual.recording=nil;if combat.v30.picker then combat.v30.picker:Destroy();combat.v30.picker=nil end
    for name,p in pairs(pages)do state.uiScroll[name]=p.CanvasPosition end
    state.windowPosition=keyboardOrigin or group.Position;state.miniPosition=widgetRefs.mini.Position
    saveSettings()
    -- Rebuild only the view. Active navigation and its tokens are untouched.
    clearUI()

    screen:Destroy();buildWorkspace(false)
  end
  state.close=function(immediate)
    if state.closed then return end
    if bankFarm.running or bankFarm.autoMode then bankFarm.stop()end
    state.manual.set(false);state.manual.recording=nil
    if state.auth and state.auth.enabled and state.auth.token and not state.auth.stopped then
      state.auth.stopped=true
      task.spawn(function()state.auth.request('POST','/api/logout',{});state.auth.token=nil end)
    end
    bank.stop();afStop();stop();endCombat()
    if state.shop then state.shop.running=false;state.shop.token=state.shop.token+1 end
    bag.selling=false;bag.token=bag.token+1
    state.diagnostics.mark('session_closed','normal unload')
    state.closed=true;state.work.pending=nil;state.work.dispatching=nil;state.work.critical=false
    if state.camera.current then state.camera.release(state.camera.current.lease)end
    stopMotion(true);state.collision.owners={};restoreCollision()
    saveSettings()
    if state.bankFarm and state.bankFarm.closeObserver then state.bankFarm.closeObserver()end
  for _,connection in ipairs(state.connected)do pcall(function()connection:Disconnect()end)end
    closeMenu();clearUI()
    if immediate then screen:Destroy()else
      local fade=TweenService:Create(group,TweenInfo.new(.16,Enum.EasingStyle.Quad),{GroupTransparency=1});fade:Play()
      task.delay(.17,function()fade:Destroy();screen:Destroy()end)
    end
    for _,key in ipairs({'REDLINEHubV30','REDLINEHubV29','REDLINEHubV28','REDLINEHubV27','REDLINEHubV26','REDLINEHubV23','REDLINEHubV20'})do if _G[key]==state then _G[key]=nil end end
  end
  page(state.selectedPage or 'Home')
  group.Visible=not state.minimized and (not firstBoot);widgetRefs.mini.Visible=state.minimized==true
  group.GroupTransparency=1;scale.Scale=1;if not firstBoot then tween(group,{GroupTransparency=0},.18)end
  if firstBoot then task.spawn(function()
    local deadline=os.clock()+20
    repeat
      if state.closed then return end
      local missing={}
      for _,name in ipairs({'ClientTasks','ClientTools','ClientGizmos','ClientData'})do if not liveModule(name)then table.insert(missing,name)end end
      state.boot.missing=missing;state.boot.ready=#missing==0
      state.boot.status=#missing==0 and 'Game modules available'or 'Waiting for game modules'
      if state.boot.ready then break end
      task.wait(.5)
    until os.clock()>=deadline
    if not state.boot.ready then warning('Interface ready; unavailable game modules: '..table.concat(state.boot.missing,', '))end
  end)end

  task.spawn(function()
    if firstBoot and isListed then report('client_seen','waiting',0,'REDLINE v30 launched',false)end
  end)
end

-- v30.1 AUTHENTICATION: the standalone Python API is not bundled or hosted here.
-- Set _G.REDLINE_AUTH_URL to a trusted HTTPS origin BEFORE executing REDLINE.
-- If no origin is configured, the visible login/register preview runs in explicitly
-- unprotected development mode. No client-side code is tamper-proof authentication.
state.auth={url=tostring(_G.REDLINE_AUTH_URL or (configSaved and configSaved.redlineAuthUrl) or ''):gsub('/+$',''),
 enabled=false,token=nil,user=nil,protected={},ownerListReady=false,verified=false,stopped=false}
do
 local auth=state.auth
 auth.enabled=auth.url~=''
 auth.endpointValid=auth.url:match('^https://[%w%.%-]+$')~=nil or auth.url:match('^https://[%w%.%-]+:%d+$')~=nil
 if not auth.endpointValid and not UserInputService.TouchEnabled and auth.url=='http://127.0.0.1:8765' then
  auth.endpointValid=true -- local PC development only; never for public access
 end
 function auth.request(method,path,body)
  if not auth.enabled or not auth.endpointValid then return nil,'Authentication server is not configured for this device' end
  local fn=transport()
  if not fn then return nil,'Executor HTTP request unavailable' end
  local headers={['Content-Type']='application/json'}
  if auth.token then headers.Authorization='Bearer '..auth.token end
  local opts={Url=auth.url..path,Method=method,Headers=headers}
  if body then opts.Body=HttpService:JSONEncode(body)end
  local ok,response=pcall(fn,opts)
  if not ok or type(response)~='table' then return nil,'Could not reach the authentication server' end
  local code=tonumber(response.StatusCode or response.Status)or 0
  local decoded
  pcall(function()decoded=HttpService:JSONDecode(response.Body or '{}')end)
  if code<200 or code>=300 then
   local message=type(decoded)=='table'and(decoded.error or decoded.detail)or nil
   return nil,tostring(message or ('Server returned '..code)),code
  end
  if type(decoded)~='table' then return nil,'Invalid server JSON response' end
  return decoded,nil,code
 end
 function auth.updateOwners()
  if not auth.enabled or not auth.token then return end
  local info,err=auth.request('GET','/api/combat/protected-owners')
  if info and type(info.owner_user_ids)=='table' then
   local ids={}
   for _,value in ipairs(info.owner_user_ids)do
    local id=tonumber(value)
    if id and id>0 then ids[id]=true end
   end
   auth.protected=ids;auth.ownerListReady=true
  else
   auth.ownerListReady=false
   note('WARN','Auth: protected Owner list unavailable: '..tostring(err))
  end
 end
 function auth.invalidate(reason)
  if auth.stopped or state.closed then return end
  auth.stopped=true;auth.token=nil;auth.verified=false;auth.ownerListReady=false
  state.sellRequested=false
  if bankFarm.autoMode or bankFarm.running then bankFarm.stop()end
  if af.enabled or af.running then afStop()end
  if bank.running then bank.stop()end
  if state.running then stop()end
  if state.manual then state.manual.set(false)end
  if state.close then state.close(true)end
  local pg=player:FindFirstChildOfClass('PlayerGui')
  if pg then
   local g=Instance.new('ScreenGui');g.Name='REDLINESessionEnded';g.ResetOnSpawn=false;g.DisplayOrder=230;g.Parent=pg
   local t=Instance.new('TextLabel');t.Size=UDim2.fromOffset(440,128);t.AnchorPoint=Vector2.new(.5,.5)
   t.Position=UDim2.fromScale(.5,.5);t.BackgroundColor3=Color3.fromRGB(22,20,28)
   t.TextColor3=Color3.fromRGB(240,235,243);t.Font=Enum.Font.GothamMedium;t.TextSize=14
   t.TextWrapped=true;t.Text='REDLINE session ended\n'..tostring(reason or 'Session expired')..'\nRe-execute REDLINE to sign in again.';t.Parent=g
  end
 end
 function auth.startMonitoring()
  if not auth.enabled or not auth.token then return end
  task.spawn(function()
   local lastOwners,lastMe,failedMe=0,0,0
   while not state.closed and not auth.stopped and auth.token do
    local now=os.clock()
    if now-lastMe>=60 or lastMe==0 then
     lastMe=now
     local who,err,status=auth.request('GET','/api/me')
     if status==401 or status==403 then auth.invalidate('Your login was revoked or expired');break end
     if who and who.user then
      failedMe=0;auth.user=who.user
      if who.user.must_change_password then auth.invalidate('Password change required');break end
     else
      failedMe=failedMe+1
      if failedMe>=2 then auth.invalidate('Authentication server unreachable or session invalid');break end
     end
    end
    if now-lastOwners>=90 or lastOwners==0 then lastOwners=now;auth.updateOwners()end
    local _,err,status=auth.request('POST','/api/presence/heartbeat',{
     job_id=tostring(game.JobId or ''),place_id=game.PlaceId,roblox_user_id=player.UserId,
     roblox_username=player.Name})
    if status==401 or status==403 then auth.invalidate('Session no longer authorized');break end
    if err then note('WARN','Auth presence: '..tostring(err))end
    for _=1,30 do if state.closed or auth.stopped then break end;task.wait(1)end
   end
  end)
 end
 function auth.renderSettings(parent)
  local panel=card(parent,'REDLINE Account')
  local role=auth.user and auth.user.role or 'development'
  local label=txt(panel,'Access · '..tostring(role)..(auth.verified and ' · verified' or ' · unprotected local development'),26,11,C.muted)
  label.TextWrapped=true
  if not auth.enabled then
   local description=txt(panel,'Login/register preview only. Configure a hosted HTTPS authentication API before distributing protected access.',47,11,C.dim)
   description.TextWrapped=true
   return
  end
  action(line(panel,'Account session'),'Logout',function()
   task.spawn(function()auth.request('POST','/api/logout',{});auth.invalidate('Logged out')end)
  end,90)
  if role=='admin' or role=='owner' then
   local staff=card(parent,'Online REDLINE Users')
   local textList=txt(staff,'Reported presence · Select refresh',110,11,C.muted)
   textList.TextWrapped=true;textList.TextTruncate=Enum.TextTruncate.None
   action(line(staff,'Same Roblox server'),'Refresh',function()
    task.spawn(function()
     local path='/api/admin/presence?job_id='..tostring(game.JobId or '')..'&place_id='..tostring(game.PlaceId)
     local data,err=auth.request('GET',path)
     if not data then textList.Text='Presence unavailable: '..tostring(err);return end
     local entries=data.presence or data.users or data.items or {}
     local lines={}
     for i,entry in ipairs(entries)do
      if i>8 then break end
      table.insert(lines,tostring(entry.username or entry.roblox_username or 'Unknown')..' · '..tostring(entry.role or 'user'))
     end
     textList.Text=#lines>0 and table.concat(lines,'\n') or 'No authenticated REDLINE client reports in this server.'
    end)
   end,96)
   local noteText=txt(staff,'Client-reported presence; not independently verified Roblox membership.',36,10,C.dim)
   noteText.TextWrapped=true
  end
 end
 function auth.show(onAuthorized)
  local pg=player:WaitForChild('PlayerGui')
  local g=mk('ScreenGui',pg,{Name='REDLINEAccess',DisplayOrder=180,IgnoreGuiInset=true,ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling})
  auth.gui=g
  local overlay=mk('Frame',g,{Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.fromRGB(11,12,17),BorderSizePixel=0})
  local window=rounded(mk('Frame',overlay,{Name='REDLINEAuthWindow',AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(.5,.5),Size=UDim2.fromOffset(458,570),BorderSizePixel=0,BackgroundColor3=Color3.fromRGB(16,16,20)}),12)
  stroke(window,Color3.fromRGB(57,48,60))
  local authScale=mk('UIScale',window,{Scale=1})
  local function resize()
   local cam=workspace.CurrentCamera
   local view=cam and cam.ViewportSize or Vector2.new(800,650)
   authScale.Scale=math.max(.58,math.min(1,(view.X-22)/458,(view.Y-22)/570))
  end
  resize()
  local viewConn=RunService.Heartbeat:Connect(function()
   if not g.Parent then return end
   local cam=workspace.CurrentCamera
   if cam and (not auth.lastViewport or (auth.lastViewport-cam.ViewportSize).Magnitude>1)then
    auth.lastViewport=cam.ViewportSize;resize()
   end
  end)
  auth.viewConn=viewConn
  local light=Color3.fromRGB(246,244,246);local secondary=Color3.fromRGB(169,162,172)
  local border=Color3.fromRGB(48,41,50);local accent=Color3.fromRGB(105,45,64)
  local function textAt(label,x,y,w,h,size,col,weight)
   return mk('TextLabel',window,{Position=UDim2.fromOffset(x,y),Size=UDim2.fromOffset(w,h),BackgroundTransparency=1,
    Text=label,TextColor3=col or light,Font=weight and Enum.Font.GothamBold or Enum.Font.Gotham,
    TextSize=size or 13,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center})
  end
  rounded(mk('Frame',window,{Position=UDim2.fromOffset(28,25),Size=UDim2.fromOffset(38,38),BackgroundColor3=accent,BorderSizePixel=0}),6)
  textAt('◆',38,25,30,38,20,Color3.fromRGB(233,203,214),true)
  textAt('REDLINE',76,24,190,26,20,light,true)
  textAt('BY RAHAMIDALI',76,48,192,15,9,secondary,true)
  local secure=textAt('⌑  SECURE ACCESS',316,33,115,20,10,Color3.fromRGB(156,131,158))
  secure.TextXAlignment=Enum.TextXAlignment.Right
  mk('Frame',window,{Position=UDim2.fromOffset(27,84),Size=UDim2.fromOffset(405,1),BackgroundColor3=border,BorderSizePixel=0})
  local heading=textAt('Welcome back',28,101,390,33,21,light,true)
  local sub=textAt('Log in to access your REDLINE dashboard.',28,137,407,39,12,secondary)
  sub.TextWrapped=true;sub.TextYAlignment=Enum.TextYAlignment.Top
  local buttons={}
  for i,entry in ipairs({{'Login','login'},{'Register','register'}})do
   buttons[entry[2]]=rounded(mk('TextButton',window,{Name=entry[1]..'Tab',Position=UDim2.fromOffset(28+(i-1)*207,188),Size=UDim2.fromOffset(199,35),Text=entry[1],Font=Enum.Font.GothamMedium,
    TextSize=13,BackgroundColor3=accent,TextColor3=light,BorderSizePixel=0,AutoButtonColor=true}),6)
  end
  local function field(label,y,placeholder,hide)
   textAt(label,28,y,376,22,12,Color3.fromRGB(216,211,220),true)
   local f=rounded(mk('TextBox',window,{Position=UDim2.fromOffset(28,y+27),Size=UDim2.fromOffset(404,40),BackgroundColor3=Color3.fromRGB(32,30,39),BorderSizePixel=0,
    Text='',TextSize=13,Font=Enum.Font.Gotham,TextColor3=light,PlaceholderColor3=Color3.fromRGB(151,144,155),PlaceholderText=placeholder,
    ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center}),6)
   stroke(f,Color3.fromRGB(65,58,71));pad(f,0,12,0,12)
   return f
  end
  local user=field('Username',236,'Enter your username')
  local pass=field('Password',316,'Enter your password')
  -- Roblox TextBox doesn't offer a reliable cross-executor secure password field.
  -- Overlay masks on-screen text; treat a client app as untrusted for secret storage.
  local passMask=textAt('',42,344,317,30,15,light)
  passMask.ZIndex=4
  local showing=false
  local reveal=rounded(mk('TextButton',window,{Position=UDim2.fromOffset(365,316),Size=UDim2.fromOffset(67,23),Text='Show',Font=Enum.Font.Gotham,TextSize=11,
    BackgroundTransparency=1,TextColor3=secondary,BorderSizePixel=0}),3)
  local function updateMask()
   pass.TextTransparency=showing and 0 or 1
   passMask.Visible=not showing and pass.Text~=''
   passMask.Text=string.rep('●',math.min(#pass.Text,22))
   reveal.Text=showing and 'Hide' or 'Show'
  end
  pass:GetPropertyChangedSignal('Text'):Connect(updateMask)
  reveal.Activated:Connect(function()showing=not showing;updateMask()end)
  updateMask()
  local keyLabel=textAt('Access key',28,393,400,20,12,Color3.fromRGB(216,211,220),true)
  local keyField=rounded(mk('TextBox',window,{Position=UDim2.fromOffset(28,417),Size=UDim2.fromOffset(404,40),BackgroundColor3=Color3.fromRGB(32,30,39),BorderSizePixel=0,
   Text='',TextSize=12,Font=Enum.Font.Gotham,TextColor3=light,PlaceholderText='RL-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX',PlaceholderColor3=secondary,
   ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left}),6)
  stroke(keyField,Color3.fromRGB(65,58,71));pad(keyField,0,12,0,12)
  local hint=textAt('Your key is redeemed once at registration.',28,460,402,15,10,secondary)
  local submit=rounded(mk('TextButton',window,{Position=UDim2.fromOffset(28,465),Size=UDim2.fromOffset(404,39),BackgroundColor3=Color3.fromRGB(111,54,76),
   BorderSizePixel=0,Text='Log In',TextColor3=light,Font=Enum.Font.GothamBold,TextSize=13,AutoButtonColor=true}),7)
  local status=textAt('',28,508,403,30,11,Color3.fromRGB(221,160,172))
  local footer=textAt('◇   Protected by REDLINE Authentication',86,544,365,16,10,secondary)
  status.TextWrapped=true;status.TextYAlignment=Enum.TextYAlignment.Top
  local mode='login';local busy=false;local dev
  local function choose(value)
   mode=value;status.Text=''
   heading.Text=value=='login'and 'Welcome back' or 'Create your account'
   sub.Text=value=='login'and 'Log in to access your REDLINE dashboard.' or 'Register using the access key provided by an administrator.'
   keyLabel.Visible=value~='login';keyField.Visible=value~='login';hint.Visible=value=='register'
   if value=='change' then
    heading.Text='Change your password';sub.Text='Your account requires a new password before accessing REDLINE.'
    keyLabel.Text='New password';keyField.PlaceholderText='Create a new password';submit.Text='Change Password'
   else keyLabel.Text='Access key';keyField.PlaceholderText='RL-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX' end
   if dev then dev.Visible=not auth.enabled and value=='login' end
   if value~='change'then submit.Text=value=='login'and 'Log In' or 'Create Account'end
   submit.Position=UDim2.fromOffset(28,value=='login'and 425 or 466)
   for k,b in pairs(buttons)do b.BackgroundColor3=k==value and accent or Color3.fromRGB(33,32,41)end
  end
  buttons.login.Activated:Connect(function()choose('login')end)
  buttons.register.Activated:Connect(function()choose('register')end)
  dev=rounded(mk('TextButton',window,{Position=UDim2.fromOffset(28,468),Size=UDim2.fromOffset(404,30),BackgroundColor3=Color3.fromRGB(41,36,48),
   BorderSizePixel=0,Text='Continue in development mode (unprotected)',TextSize=11,Font=Enum.Font.Gotham,TextColor3=secondary,Visible=not auth.enabled}),6)
  local function done(verified)
   if not g.Parent or state.closed then return end
   viewConn:Disconnect();auth.viewConn=nil;auth.gui=nil;g:Destroy()
   auth.verified=verified==true
   local ok,err=pcall(onAuthorized)
   if not ok then note('ERROR','REDLINE UI after auth: '..tostring(err))end
   if auth.verified then auth.startMonitoring()end
  end
  dev.Activated:Connect(function()
   if auth.enabled then return end
   auth.user={username='Local developer',role='development'}
   note('WARN','UNPROTECTED DEVELOPMENT MODE — configure REDLINE_AUTH_URL before public distribution')
   done(false)
  end)
  submit.Activated:Connect(function()
   if busy then return end
   if not auth.enabled then status.Text='Auth server not hosted yet. Login/Register are previews; use development mode to test REDLINE.';return end
   if not auth.endpointValid then status.Text='Configure a valid HTTPS authentication server URL.';return end
   if user.Text=='' or pass.Text=='' or mode~='login'and keyField.Text=='' then
    status.Text='Complete the required username, password and access key fields.';return
   end
   busy=true;submit.Text='Connecting...';status.Text='Checking REDLINE access...'
   local requestedMode=mode;local username=user.Text;local password=pass.Text;local key=keyField.Text
   task.spawn(function()
    if requestedMode=='change' then
     local changed,changeErr=auth.request('POST','/api/change-password',{current_password=password,new_password=key})
     password=nil;key=nil
     if not g.Parent then return end
     if not changed then status.Text='Password change failed: '..tostring(changeErr);busy=false;choose('change');return end
     local info,why=auth.request('GET','/api/me')
     if not info or not info.user or info.user.must_change_password then
      status.Text='Password updated, but account verification failed: '..tostring(why);busy=false;choose('login');return
     end
     auth.user=info.user;pass.Text='';keyField.Text='';auth.updateOwners();done(true);return
    end
    local payload={username=username,password=password,device_label='REDLINE PC'}
    if requestedMode=='register' then payload.key=key end
    local result,err=auth.request('POST',requestedMode=='register' and '/api/register' or '/api/login',payload)
    password=nil;key=nil
    if not g.Parent then return end
    if not result or type(result.token)~='string' or type(result.user)~='table' then
     status.Text=tostring(err or 'Login response incomplete');busy=false;choose(requestedMode);return
    end
    auth.token=result.token;auth.user=result.user
    if auth.user.must_change_password then
     -- Keep the current password in the field, collect a new password below.
     busy=false;choose('change');status.Text='Choose a different password to continue.';return
    end
    pass.Text='';keyField.Text=''
    status.Text='Authenticated · loading REDLINE'
    auth.updateOwners()
    done(true)
   end)
  end)
  choose('login')
  if not auth.enabled then status.Text='Local development: authentication not yet hosted.' end
  if auth.enabled and not auth.endpointValid then status.Text='Invalid HTTPS URL. Configure your API address before login.' end
 end
end

-- REDLINE authentication runs before the workspace UI appears.
state.auth.show(function()
-- REDLINE UI initialization guard
local uiOK,uiError=pcall(buildWorkspace,true)
if not uiOK then
  warning('Interface initialization failed: '..tostring(uiError))
  if state.close then state.close(true)end
  clearUI()
  local errorGui=mk('ScreenGui',player:WaitForChild('PlayerGui'),{Name='REDLINEInitializationError',ResetOnSpawn=false,DisplayOrder=200})
  local panel=rounded(mk('Frame',errorGui,{AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(.5,.5),Size=UDim2.new(.85,0,0,150),BackgroundColor3=C.card,BorderSizePixel=0}),10)
  mk('UISizeConstraint',panel,{MaxSize=Vector2.new(520,150)});pad(panel,16,16,16,16);stack(panel,8)
  txt(panel,'REDLINE · interface could not initialize',24,15,C.pink,true)
  local detail=txt(panel,tostring(uiError),65,12,C.muted);detail.TextWrapped=true;detail.TextTruncate=Enum.TextTruncate.None
  local dismiss=mk('TextButton',panel,{Size=UDim2.fromOffset(80,26),Text='Close',TextColor3=C.white,BackgroundColor3=C.red,BorderSizePixel=0})
  dismiss.Activated:Connect(function()errorGui:Destroy()end)
  state.close=function()if errorGui.Parent then errorGui:Destroy()end end
  _G.REDLINEHubV28=state
end
end)
end
