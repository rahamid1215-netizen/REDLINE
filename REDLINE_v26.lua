-- REDLINE | WANTED v26
-- Refined native UI, persistent flight state, verified bank actions
-- Created by RahamidAli

local Players = game:GetService('Players')
local RunService = game:GetService('RunService')
local UserInputService = game:GetService('UserInputService')
local HttpService = game:GetService('HttpService')
local player = Players.LocalPlayer
if not player then return end
if game.PlaceId ~= 14438406081 then warn('[REDLINE] Unsupported game.'); return end

if _G.REDLINEHubV26 and type(_G.REDLINEHubV26.close)=='function' then pcall(_G.REDLINEHubV26.close) end
if _G.REDLINEHubV23 and type(_G.REDLINEHubV23.close)=='function' then pcall(_G.REDLINEHubV23.close) end
if _G.REDLINEHubV20 and type(_G.REDLINEHubV20.close) == 'function' then pcall(_G.REDLINEHubV20.close) end
if _G.REDLINEHubV19 and type(_G.REDLINEHubV19.close) == 'function' then pcall(_G.REDLINEHubV19.close) end
if _G.REDLINEHubV16 and type(_G.REDLINEHubV16.close) == 'function' then pcall(_G.REDLINEHubV16.close) end
if _G.REDLINEHubV15 and type(_G.REDLINEHubV15.close) == 'function' then pcall(_G.REDLINEHubV15.close) end
if _G.REDLINEHubV18 and type(_G.REDLINEHubV18.close) == 'function' then pcall(_G.REDLINEHubV18.close) end
if _G.REDLINEHubV19 and type(_G.REDLINEHubV19.close) == 'function' then pcall(_G.REDLINEHubV19.close) end
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
local settingsFile = 'REDLINE_v23_settings.json'
local checkpointFile = 'REDLINE_v23_checkpoint_' .. tostring(player.UserId) .. '.json'
local queueFile = 'REDLINE_v23_outbox_' .. tostring(player.UserId) .. '.json'
local state = {
  running=false, stopping=false, awaiting=false, token=0, connected={}, noclipConn=nil, collisionOriginal={},
  speed=80, noclip=true, paused=false, pauseEach=false, tutorialReady=false, missionStarted=false, confirmedGhost=0,
  attemptedGhost=0, amuletHeld=false, questCompleted=false, selectedPage='home', phase='waiting',
  retries=0, session=HttpService:GenerateGUID(false), networkError='', trackerConnected=false, checkpointStamp=0, died=false, routeError='',
  url='https://rahamidali.pythonanywhere.com', status='Idle', history={}, errors={}, missionVerified=false, verificationSource='Unknown',
}
_G.REDLINEHubV26=state
_G.REDLINEHubV23=state
_G.REDLINEHubV20=state
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
  local lines={'REDLINE v26 | RahamidAli','Account: '..player.Name,'UserId: '..tostring(player.UserId),
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
state.naturalLootLookup={}
for _,name in ipairs(state.naturalLootCatalog) do
 state.naturalLootLookup[name:lower()]=true
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
af.openCount=0;af.goldenCount=0;af.goldenSeen={};af.knownFloorIds={};af.watchers={}
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
  for id,coord in pairs(defaults) do
    if type(bank.points[id])~='table' then bank.points[id]=coord end
  end
end
bank.running=false;bank.token=0;bank.autoStatus='Ready (route loaded)'

local function baseLootName(item)
 if type(item)~='string' then return '' end
 local lower=item:lower():match('^%s*(.-)%s*$') or ''
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
   if separator==' ' or separator=='(' or separator=='[' or separator==':'
      or separator=='|' or separator=='-' then best=n end
  end
 end
 if best~='' then return best end
 return lower
end
local function passesGlobalLoot(item)
  local key=baseLootName(item)
  if key=='' then return false end
  local override=state.globalLoot.overrides[key]
  if override=='collect' then return true end
  if override=='skip' then return false end
  local rarity=state.globalLoot.rarity and state.globalLoot.rarity(item) or 'Unclassified'
  if state.globalLoot.simple[rarity]~=nil then return state.globalLoot.simple[rarity] end
  local selected=state.globalLoot.selected[key]==true
  return (state.globalLoot.mode=='include' and selected) or (state.globalLoot.mode=='exclude' and not selected)
end
local function filterMatches(item)
  if type(item)~='string' or item=='' then return false end
  local key=baseLootName(item)
  -- Explicit Collect/Skip on Golden Barrett outranks even the old airdrop-only list.
  if key=='golden barrett m82' then
    local forced=state.globalLoot.overrides[key]
    if forced=='collect' then return true end
    if forced=='skip' then return false end
  end
  local selected=af.selected[key]==true
  local passAir=(af.mode=='include' and selected) or (af.mode=='exclude' and not selected)
  return passAir and passesGlobalLoot(item)
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

local configSaved=readFile(settingsFile) or readFile('REDLINE_v22_settings.json') or readFile('REDLINE_v21_settings.json') or readFile('REDLINE_v20_settings.json') or readFile('REDLINE_v19_settings.json') or readFile('REDLINE_v18_settings.json') or readFile('REDLINE_v17_settings.json') or readFile('REDLINE_v16_settings.json') or readFile('REDLINE_v15_settings.json') or readFile('REDLINE_v14_settings.json') or readFile('REDLINE_v13_settings.json') or readFile('REDLINE_v12_settings.json') or readFile('REDLINE_v11_settings.json') or readFile('REDLINE_v10_settings.json') or readFile('REDLINE_v9_settings.json') or readFile('REDLINE_v8_settings.json') or readFile('REDLINE_v7_settings.json') or readFile('WANTED_v6_settings.json')
if configSaved then
  if tonumber(configSaved.speed) and table.find(speedOptions,configSaved.speed) then state.speed=configSaved.speed end
  -- Staged pauses from early builds are no longer enabled by default.
  -- Tutorial state is per Roblox account, not a global executor setting.
  if type(configSaved.noclip)=='boolean' then state.noclip=configSaved.noclip end
    if configSaved.airdropMode=='include' or configSaved.airdropMode=='exclude' then af.mode=configSaved.airdropMode end
  if type(configSaved.airdropSelected)=='table' then for _,n in ipairs(configSaved.airdropSelected) do if type(n)=='string' then af.selected[n:lower()]=true end end end
  if configSaved.earlyMinutes==10 or configSaved.earlyMinutes==15 then bag.earlyMinutes=configSaved.earlyMinutes end
  if configSaved.globalLootMode=='include' or configSaved.globalLootMode=='exclude' then state.globalLoot.mode=configSaved.globalLootMode end
  if type(configSaved.globalLootSelected)=='table' then for _,name in ipairs(configSaved.globalLootSelected) do if type(name)=='string' then state.globalLoot.selected[name:lower()]=true end end end
  if type(configSaved.globalRarity)=='table' then for name,on in pairs(configSaved.globalRarity) do if state.globalLoot.simple[name]~=nil and type(on)=='boolean' then state.globalLoot.simple[name]=on end end end
  if type(configSaved.globalOverrides)=='table' then for name,v in pairs(configSaved.globalOverrides) do if v=='collect' or v=='skip' then state.globalLoot.overrides[name:lower()]=v end end end
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
local function saveSettings()
  local sels={};for n,on in pairs(af.selected) do if on then table.insert(sels,n) end end
  local other={};for name,active in pairs(state.globalLoot.selected) do if active then table.insert(other,name) end end
  local latest=readFile(settingsFile) or readFile('REDLINE_v22_settings.json') or readFile('REDLINE_v21_settings.json') or {}
  local c=state.combat
  if c then latest.fovColor=c.fovColor;latest.hitColor=c.hitColor;latest.fovAlpha=c.fovAlpha;latest.hitAlpha=c.hitAlpha;latest.ignoreFriends=c.ignoreFriends end
  saveFile(settingsFile,{fovColor=latest.fovColor,hitColor=latest.hitColor,fovAlpha=latest.fovAlpha,hitAlpha=latest.hitAlpha,ignoreFriends=latest.ignoreFriends,speed=state.speed,noclip=state.noclip,airdropMode=af.mode,airdropSelected=sels,globalLootMode=state.globalLoot.mode,globalLootSelected=other,globalRarity=state.globalLoot.simple,globalOverrides=state.globalLoot.overrides,bankVaults=state.bankFarm and state.bankFarm.selected or nil,bankCollectSmall=state.bankFarm and state.bankFarm.collectSmall,bankSkipGold=state.bankFarm and state.bankFarm.skipGold,bankSkipSilver=state.bankFarm and state.bankFarm.skipSilver,earlyMinutes=bag.earlyMinutes,combatWhitelist=latest.combatWhitelist or (configSaved and configSaved.combatWhitelist) or {},fovPixels=state.combat and state.combat.fovPixels or 175})
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
  if not isListed or #outbox==0 then return end
  local nextQueue={}
  for i,entry in ipairs(outbox) do
    if i>40 then table.insert(nextQueue,entry)
    else
      local data,err=http('POST','/api/public/events',entry)
      if not data then table.insert(nextQueue,entry);state.networkError=err;state.trackerConnected=false
      elseif data.tracked==false then state.networkError='Username not on tracker list' end
    end
  end
  outbox=nextQueue;saveFile(queueFile,outbox)
end
local function report(event,phase,ghost,detail,confirmed)
  if not isListed then return end
  -- Heartbeats are ephemeral: never fill the offline event queue with stale ticks.
  if event=='heartbeat' and not safeUrl() then return end
  local e={username=player.Name,user_id=player.UserId,event=event,event_id=HttpService:GenerateGUID(false),
    session_id=state.session,phase=phase or state.phase,ghost=ghost or 0,detail=tostring(detail or ''):sub(1,230),confirmed=confirmed==true}
  state.phase=e.phase
  if event=='error' then note('ERROR',e.phase..': '..e.detail) end
  local data,err=http('POST','/api/public/events',e)
  if data then
    if data.tracked==true then state.trackerConnected=true;state.networkError='' end
    if data.completed then state.questCompleted=true;checkpoint() end
    if #outbox>0 then flushOutbox() end
  else
    state.networkError=err or ''
    if event~='heartbeat' and #outbox<120 then table.insert(outbox,e);saveFile(queueFile,outbox) end
    if err and err:find('409',1,true) then
      note('WARN','Tracker rejected identity/setup: '..err..'; local navigation is unchanged')
    end
  end
end
-- Automatic public telemetry is intentionally write-only.
-- Never trust public reports as a verified cross-device quest checkpoint.
local syncExisting=function() end
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
-- A movement session holds collision/hover state through interaction pauses.
local motion={root=nil,attachment=nil,velocity=nil,humanoid=nil,autoRotate=nil}
state.motion=motion
function motion.busy()
  return not state.closed and (state.running or af.running or bank.running or bag.selling
    or (state.shop and state.shop.running) or (state.combat and state.combat.buying))
end
function motion.release()
  if motion.velocity then pcall(function()motion.velocity:Destroy()end)end
  if motion.attachment then pcall(function()motion.attachment:Destroy()end)end
  if motion.humanoid and motion.humanoid.Parent and motion.autoRotate~=nil then
    pcall(function()motion.humanoid.AutoRotate=motion.autoRotate end)
  end
  motion.root=nil;motion.velocity=nil;motion.attachment=nil;motion.humanoid=nil;motion.autoRotate=nil
end
function motion.prepare(part)
  if motion.root==part and motion.velocity and motion.velocity.Parent then return true end
  motion.release()
  if not part or not part.Parent then return false end
  local ok,err=pcall(function()
    motion.root=part
    motion.humanoid=part.Parent:FindFirstChildOfClass('Humanoid')
    if motion.humanoid then motion.autoRotate=motion.humanoid.AutoRotate;motion.humanoid.AutoRotate=false end
    motion.attachment=Instance.new('Attachment');motion.attachment.Name='REDLINE_MotionAttachment';motion.attachment.Parent=part
    motion.velocity=Instance.new('LinearVelocity');motion.velocity.Name='REDLINE_MotionVelocity'
    motion.velocity.Attachment0=motion.attachment
    motion.velocity.RelativeTo=Enum.ActuatorRelativeTo.World
    motion.velocity.VelocityConstraintMode=Enum.VelocityConstraintMode.Vector
    motion.velocity.ForceLimitsEnabled=false
    motion.velocity.VectorVelocity=Vector3.zero
    motion.velocity.Parent=part
  end)
  if not ok then motion.release();warning('Flight stabilization unavailable: '..tostring(err));return false end
  return true
end
function motion.set(part,velocity)
  if not motion.prepare(part) then error('Cannot create stable flight controller')end
  motion.velocity.VectorVelocity=velocity
  part.AssemblyLinearVelocity=velocity
  part.AssemblyAngularVelocity=Vector3.zero
end
function motion.halt()
  if motion.velocity and motion.velocity.Parent then motion.velocity.VectorVelocity=Vector3.zero end
  local part=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
  if part then pcall(function()part.AssemblyLinearVelocity=Vector3.zero;part.AssemblyAngularVelocity=Vector3.zero end)end
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
local function stopMotion(forceRelease)
  motion.halt()
  if forceRelease or not motion.busy() then motion.release();restoreCollision()end
end
table.insert(state.connected,RunService.Heartbeat:Connect(function()
  if state.closed or not characterAlive() or not motion.busy() then
    if motion.root or state.noclipConn then stopMotion(true)end
  elseif motion.root and not state.noclip then restoreCollision()end
end))

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
          motion.set(r,Vector3.zero)
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
        motion.set(r,v)
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
-- Executors expose different input methods. Prefer in-game APIs, then fall back to supported input.
local function inputKey(key,down)
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
-- Rarities transcribed from WANTED Wiki's Items page (October 2026).
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
  local wikiTier=state.wikiRarityLookup[canonical]
  if wikiTier then return wikiTier end
  local objects=liveModule('Objects')
  if objects and type(objects.GetDataProperty)=='function' then
    local ok,value=pcall(objects.GetDataProperty,name,'rarity')
    if ok and type(value)=='string' and value~='' then return value end
  end
  return 'Unclassified'
end
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
    motion.set(rootPart,delta.Unit*math.min(state.speed,math.max(10,delta.Magnitude*2)))
    RunService.Heartbeat:Wait()
  end
  stopMotion();return false,'Stopped'
end
function bag.sell()
  if bag.selling or state.closed or state.running or (not af.running and not state.bankFarmSellPending) then return end
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
    if bag.token==token then bag.selling=false;state.bankFarmSellPending=false;stopMotion() end
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
  if (not af.running and not state.bankFarmSellPending) or state.running then
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
  local result={source='REDLINE v18 manual route',placeId=game.PlaceId,bankCashRequired=5000,elevatorRequired=false,steps={}}
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
    if isListed and safeUrl() and not bank.trackerEventQueued then
      bank.trackerEventQueued=true
      task.spawn(function() report('tutorial_complete','bank_tutorial',0,'Game confirmed bank tutorial complete',true) end)
    end
    bank.autoStatus='Completed (game verified)'
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
function state.tryEquipTool(name)
  if toolEquipped(name) then return true end
  local tools=itemClient();local id=toolIdNamed(name)
  if not id or not tools or type(tools.ToggleEquip)~='function' then return false end
  local ok=pcall(tools.ToggleEquip,id)
  if not ok then return false end
  for _=1,9 do
    if toolEquipped(name) then return true end
    task.wait(.12)
  end
  return false
end
-- A Speaker's Amulet is a WorldItem gizmo, not a generic E prompt.
function state.findSpeakerPickup()
  return state.findWorldGizmo('Speakers Amulet',24)
end
function bank.stop()
  bank.running=false;bank.token=bank.token+1;stopMotion()
  bank.autoStatus='Stopped'
end
function bank.fly(point,token)
  if not point then return false,'Missing saved waypoint' end
  local dest=Vector3.new(point.x,point.y,point.z)
  local start=os.clock();local moved=os.clock();local closest=math.huge;local previous,corrections=nil,0
  local startingRoot=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
  local maxTravel=math.max(25,startingRoot and (dest-startingRoot.Position).Magnitude/state.speed*4+17 or 90)
  while bank.running and bank.token==token and not state.closed do
    local r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
    if not characterAlive() or not r then stopMotion();return false,'Character not available' end
    local delta=dest-r.Position
    if previous and (r.Position-previous).Magnitude>18 and delta.Magnitude>closest+8 then
      corrections=corrections+1
    elseif delta.Magnitude<closest-2 then corrections=math.max(0,corrections-1) end
    previous=r.Position
    if corrections>=20 then stopMotion();return false,'Movement rubberbanded 20 consecutive corrections' end
    if delta.Magnitude<3 then stopMotion();return true end
    if delta.Magnitude<closest-2 then closest=delta.Magnitude;moved=os.clock() end
    if os.clock()-moved>13 or os.clock()-start>maxTravel then
      stopMotion();return false,'Navigation stalled or rubberbanded'
    end
    startNoclip()
    motion.set(r,delta.Unit*math.min(state.speed,math.max(10,delta.Magnitude*2)))
    RunService.Heartbeat:Wait()
  end
  stopMotion();return false,'Canceled'
end
-- Bank actions use the exported client APIs; success requires replicated evidence.
function bank.active(token)
  return bank.running and bank.token==token and not state.closed and characterAlive()
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
function bank.stageReady()
  local data=bank.taskData()
  if not data then return false end
  bank.cashStolen=tonumber(data.bankCashStolen or data.cashStolen) or 0
  return bank.cashStolen>=5000 or (tonumber(data.currentStep) or 0)>=3
end
function bank.findDoor()
  local props=workspace:FindFirstChild('Props')
  local folder=props and props:FindFirstChild('VaultDoor')
  local point=bank.points.vault_throw
  if not folder or not point then return nil end
  local target=Vector3.new(point.x,point.y,point.z)
  local closest,distance=nil,180
  local models={folder}
  for _,obj in ipairs(folder:GetDescendants()) do
    if obj:IsA('Model') then table.insert(models,obj) end
  end
  for _,model in ipairs(models) do
    if model:IsA('Model') and model.PrimaryPart and model:GetAttribute('objectId')~=nil then
      local d=(model.PrimaryPart.Position-target).Magnitude
      if d<distance then closest,distance=model,d end
    end
  end
  return closest
end
function bank.isOpen(model)
  return model and model.Parent and model:GetAttribute('isBroken')==true
end
function bank.useElevator(token)
  local data=bank.taskData()
  if not data then error('Bank tutorial data unavailable; recheck the active mission') end
  if (tonumber(data.currentStep) or 1)>=2 then return end
  bank.autoStatus='Completing elevator requirement'
  local api=liveModule('ClientProps')
  local model
  for _,candidate in ipairs(game:GetService('CollectionService'):GetTagged('MainBankElevator')) do
    if candidate:IsA('Model') and candidate:IsDescendantOf(workspace) then model=candidate;break end
  end
  local prop=model and api and type(api.GetFromModel)=='function' and api.GetFromModel(model)
  if not prop or type(prop.Call)~='function' or type(prop.Hack)~='function' then
    error('Bank elevator not loaded; cannot verify the tutorial elevator requirement')
  end
  local floors=model:FindFirstChild('Floors')
  local ground=floors and floors:FindFirstChild('Ground')
  local button=ground and ground:FindFirstChild('Button')
  if not ground or not button or not button.PrimaryPart then error('Ground elevator controls not loaded') end
  local function fly(vec)
    local ok,why=bank.fly({x=vec.X,y=vec.Y,z=vec.Z},token)
    if not ok then error(why) end
  end
  fly(button.PrimaryPart.Position+Vector3.new(0,2,0))
  prop:Call('Ground',button)
  local arrived=bank.waitFor(token,45,function()
    return model:GetAttribute('currentFloor')=='Ground' and not model:GetAttribute('inTransit')
  end)
  if not arrived then error('Elevator did not arrive at Ground') end
  local base=ground:FindFirstChild('Base')
  local pad=ground:FindFirstChild('Buttons')
  if not base or not pad or not pad.PrimaryPart then error('Elevator cabin controls unavailable') end
  fly(base.Position)
  local inside=bank.waitFor(token,3,function()return prop:IsInside() end)
  if not inside then error('Player not confirmed inside elevator cabin') end
  if (pad.PrimaryPart.Position-(player.Character.HumanoidRootPart.Position)).Magnitude>14 then
    fly(pad.PrimaryPart.Position+Vector3.new(0,1,0))
  end
  task.wait(1.1)
  if not bank.active(token) then error('Canceled') end
  prop:Hack('Vault',pad)
  local used=bank.waitFor(token,55,function()
    local current=bank.taskData()
    return current and (tonumber(current.currentStep) or 0)>=2
  end)
  if not used then error('Elevator interaction did not advance the tutorial; no progress was fabricated') end
end
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
function bank.throwC4(token,door)
  if not bank.active(token) then return false,'Canceled' end
  if not door or not door.Parent then return false,'Vault door not replicated' end
  if bank.isOpen(door) then return true,'already_open' end
  if not state.tryEquipTool('C4') then return false,'C4 equip not confirmed' end
  local tools=liveModule('ClientTools')
  local ready,tool=bank.waitFor(token,7,function()
    local equipped=tools and tools.GetLocalEquippedTool()
    if equipped and equipped.name=='C4' and equipped.loaded and equipped.synced
      and type(equipped.GetComponent)=='function' and equipped:GetComponent('Thrower') then return equipped end
  end)
  if not ready then return false,'C4 did not finish loading/syncing' end
  local target=door:FindFirstChild('BigDoor') or door
  local point=objectWorldPosition(target) or objectWorldPosition(door)
  local r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
  if not point or not r or (r.Position-point).Magnitude>50 then return false,'C4 throw position is outside the tool range' end
  local camera=workspace.CurrentCamera
  if not camera then return false,'Camera unavailable' end
  local existing=bank.ownedStickies()
  local thrower=tool:GetComponent('Thrower')
  local ammo=tonumber(thrower.ammo or tool.toolState.ammo) or 0
  if ammo<1 then return false,'C4 has no ammunition' end
  local lastThrow=tonumber(thrower.lastThrow) or 0
  local readyAt=lastThrow+(tonumber(tool.throwDebounce) or 3)
  while bank.active(token) and os.clock()<readyAt do task.wait(.1) end
  if not bank.active(token) then return false,'Canceled' end
  bank.autoStatus='Aiming C4 at vault'
  -- Pin aim while the native Thrower samples its trajectory on RenderStepped.
  local aimConnection=RunService.RenderStepped:Connect(function()
    if bank.active(token) and camera.Parent and (point-camera.CFrame.Position).Magnitude>1 then
      camera.CFrame=CFrame.lookAt(camera.CFrame.Position,point)
    end
  end)
  local triggered,reason=pcall(function()
    camera.CFrame=CFrame.lookAt(camera.CFrame.Position,point)
    task.wait(.22)
    if not bank.active(token) then error('Canceled') end
    -- Same input state consumed by the game's own Thrower; no forged throw packet.
    if type(tool._inputPrimary)=='function' then tool:_inputPrimary(Enum.UserInputState.Begin)
    else tool.throwing=true end
    bank.autoStatus='Waiting for planted C4'
    local planted,model=bank.waitFor(token,9,function()
      for m in pairs(bank.ownedStickies()) do
        if not existing[m] and m.Parent and m.PrimaryPart and (m.PrimaryPart.Position-point).Magnitude<=25 then
          return m
        end
      end
    end)
    if not planted then error('No new owned C4 confirmed near the vault; detonation canceled') end
    local prior=model.PrimaryPart.Position
    task.wait(.25)
    if not model.Parent or not model.PrimaryPart or (model.PrimaryPart.Position-prior).Magnitude>2 then
      error('C4 has not settled near the vault')
    end
  end)
  aimConnection:Disconnect()
  pcall(function()tool.throwing=false end)
  if not triggered then return false,tostring(reason) end
  return true,'planted'
end
function bank.breach(token,door)
  if bank.isOpen(door) then return true end
  local thrown,why=bank.throwC4(token,door)
  if not thrown then return false,why end
  if why=='already_open' then return true end
  local retreat=bank.points.retreat_detonate
  local ok,err=bank.fly(retreat,token)
  if not ok then return false,err end
  if not bank.active(token) then return false,'Canceled' end
  bank.autoStatus='Detonating confirmed C4'
  if not tap(Enum.KeyCode.X,nil,.15) then return false,'Detonation input unavailable' end
  local opened=bank.waitFor(token,12,function()return bank.isOpen(door) end)
  if not opened then return false,'Vault did not confirm a breach after detonation' end
  -- Export Globals.BANK.GAS_TIME=30; do not fly into a freshly breached gas cloud.
  local globals=liveModule('Globals')
  local gasTime=globals and globals.BANK and tonumber(globals.BANK.GAS_TIME) or 30
  local deadline=os.clock()+math.clamp(gasTime,0,45)
  while bank.active(token) and os.clock()<deadline do
    bank.autoStatus='Gas clearing · '..math.ceil(deadline-os.clock())..'s'
    task.wait(.2)
  end
  return bank.active(token),'Canceled'
end
function bank.cashAmount(gizmo)
  local data=type(gizmo.gizmoState)=='table' and gizmo.gizmoState or {}
  local amount=tonumber(data.amount)
  if amount==nil then amount=tonumber(gizmo.cashLeft) end
  if amount==nil and type(gizmo.state)=='table' then amount=tonumber(gizmo.state.amount) end
  return amount
end
function bank.cashList(center,radius)
  local folder=workspace:FindFirstChild('Local')
  folder=folder and folder:FindFirstChild('Gizmos')
  local api=liveModule('ClientGizmos')
  local entries={}
  if not folder or not api or type(api.Get)~='function' then return entries,false end
  for _,model in ipairs(folder:GetChildren()) do
    if model:IsA('Model') and model.PrimaryPart and (model.PrimaryPart.Position-center).Magnitude<radius then
      local id=model:GetAttribute('objectId')
      local ok,g=pcall(api.Get,id)
      if ok and type(g)=='table' and g.name=='CashPallet' and type(g.AttemptCollect)=='function' then
        local location=g.properties and g.properties.locationName
        if not location or location=='Bank' then
          local amount=bank.cashAmount(g)
          if model:GetAttribute('isDestroyed')~=true and (amount==nil or amount>0) then
            table.insert(entries,{id=id,model=model,gizmo=g,amount=amount})
          end
        end
      end
    end
  end
  table.sort(entries,function(a,b)return (a.amount or 0)>(b.amount or 0) end)
  return entries,true
end
function bank.collectCash(token,center,tutorial)
  local started,lastChange,lastSignature=os.clock(),os.clock(),''
  local observed=false
  local emptySince=nil
  while bank.active(token) and os.clock()-started<300 do
    local entries,available=bank.cashList(center,90)
    local total,unknown,signature=0,false,{}
    for _,entry in ipairs(entries) do
      if entry.amount==nil then unknown=true else total=total+entry.amount end
      table.insert(signature,tostring(entry.id)..':'..tostring(entry.amount))
    end
    table.sort(signature);signature=table.concat(signature,'|')
    if signature~=lastSignature then lastSignature=signature;lastChange=os.clock() end
    bank.cashRemaining=available and not unknown and total or nil
    bank.stageReady()
    if #entries>0 then
      observed=true;emptySince=nil
      local candidate=entries[1]
      bank.autoStatus='Collecting cash · '..(unknown and 'reading balance' or ('$'..math.floor(total)..' left'))
      local r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
      if r and (r.Position-candidate.model.PrimaryPart.Position).Magnitude>8 then
        local p=candidate.model.PrimaryPart.Position+Vector3.new(0,2,0)
        local reached,why=bank.fly({x=p.X,y=p.Y,z=p.Z},token)
        if not reached then return false,why end
      end
      if not bank.active(token) then return false,'Canceled' end
      local ok,err=pcall(function()candidate.gizmo:AttemptCollect(player)end)
      if not ok then note('WARN','Cash collection: '..tostring(err)) end
      task.wait(.3)
    else
      if available and observed then
        emptySince=emptySince or os.clock()
        if os.clock()-emptySince>=2 then
          bank.cashRemaining=0
          bank.autoStatus='Vault cash cleared'
          return true,'empty'
        end
      end
      task.wait(.2)
    end
    if os.clock()-lastChange>15 then
      if tutorial and bank.stageReady() then
        return false,'Tutorial cash target reached; remaining cash unavailable or collection stalled'
      end
      return false,observed and 'Cash collection stopped making progress' or 'Cash piles not replicated; empty vault not confirmed'
    end
  end
  return false,bank.active(token) and 'Cash collection time limit reached' or 'Canceled'
end
function bank.escape(token)
  for _,id in ipairs({'escape_exit','escape'}) do
    bank.autoStatus=id=='escape_exit' and 'Leaving bank' or 'Escaping bank'
    local ok,err=bank.fly(bank.points[id],token)
    if not ok then return false,err end
  end
  local complete=bank.waitFor(token,12,function()bank.check();return bank.done end)
  if complete then return true end
  -- Move farther along the saved exterior direction if the live escape boundary differs.
  local outside=bank.points.escape
  local vault=bank.points.vault_enter
  local direction=Vector3.new(outside.x-vault.x,0,outside.z-vault.z)
  if direction.Magnitude<1 then return false,'Saved escape direction invalid' end
  for _,distance in ipairs({40,80}) do
    bank.autoStatus='Clearing exterior mission boundary'
    local p=Vector3.new(outside.x,outside.y,outside.z)+direction.Unit*distance
    local ok,err=bank.fly({x=p.X,y=p.Y,z=p.Z},token)
    if not ok then return false,err end
    if bank.waitFor(token,6,function()bank.check();return bank.done end) then return true end
  end
  return false,'Outside bank, but game has not confirmed tutorial completion'
end
function bank.start()
  if bank.running or state.running or af.running or bag.selling or (state.shop and state.shop.running) then
    warning('Stop the active navigation task before starting the tutorial');return
  end
  bank.check()
  if bank.done then log('Bank tutorial already complete');return end
  bank.running=true;bank.token=bank.token+1
  local token=bank.token
  task.spawn(function()
    local ok,err=pcall(function()
      local function move(id,message)
        bank.autoStatus=message
        local reached,why=bank.fly(bank.points[id],token)
        if not reached then error(why) end
      end
      move('bank_entrance','Entering bank')
      if bank.stageReady() then
        local escaped,why=bank.escape(token)
        if not escaped then error(why) end
        return
      end
      bank.useElevator(token)
      move('bank_upper','Flying upward')
      move('free_c4','Collecting free C4')
      local door=bank.findDoor()
      if not door then error('Main bank vault door not replicated near the saved route') end
      if not bank.isOpen(door) then
        for _=1,10 do
          if localNamedItem('C4') or not bank.active(token) then break end
          local pickup=state.findWorldGizmo('C4',16)
          if pickup then pcall(function()pickup:AttemptCollect()end) end
          task.wait(.3)
        end
        if not bank.active(token) then error('Canceled') end
        if not localNamedItem('C4') then error('Free C4 pickup not confirmed in inventory') end
        move('vault_throw','Approaching vault')
        local breached,why=bank.breach(token,door)
        if not breached then error(why) end
      end
      move('vault_enter','Entering breached vault')
      move('cash_pickup','Reading vault cash')
      local point=bank.points.cash_pickup
      local cleared,why=bank.collectCash(token,Vector3.new(point.x,point.y,point.z),true)
      if not cleared then
        if not bank.active(token) then error('Canceled') end
        if not bank.stageReady() then error(why) end
        note('WARN',why..'; proceeding to verified tutorial escape')
      end
      local ready=bank.waitFor(token,5,bank.stageReady)
      if not ready then error('Cash cleared, but the tutorial has not confirmed its $5000 requirement') end
      local escaped,escapeWhy=bank.escape(token)
      if not escaped then error(escapeWhy) end
    end)
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
  -- The exported dialogue uses Network.InvokeServer("startTask", "SpeakerForTheDead").
  local network=liveModule('Network')
  if network and type(network.InvokeServer)=='function' then
    local ok,result=pcall(network.InvokeServer,'startTask','SpeakerForTheDead')
    if not ok or result==false then note('WARN','Ghost mission start: '..tostring(result)) end
    task.wait(1)
    local evidence=refreshQuestEvidence()
    if evidence.mission then
      state.missionStarted=true;state.missionVerified=true;checkpoint()
      report('phase','quest_accepted',0,'Game confirmed quest after startTask',false)
      return true
    end
  end
  if not attemptE(token) then return false,'NPC E input unavailable' end
  task.wait(.8)
  for _=1,15 do
    if not valid(token) then return false end
    local found,control=visibleText('Start Mission')
    if found and control then
      local point=control.AbsolutePosition+control.AbsoluteSize*.5
      vclick(point.X,point.Y)
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
  if toolEquipped('Speakers Amulet') then return true end
  if localNamedItem('Speakers Amulet') then return equipAmulet(token) end
  local found,reason=state.findSpeakerPickup()
  if found then
    note('INFO','Speaker: invoking native WorldItem.AttemptCollect ('..tostring(reason)..')')
    local ok,err=pcall(function() found:AttemptCollect() end)
    if not ok then note('WARN','Speaker native collect error: '..tostring(err):sub(1,130)) end
    for _=1,12 do
      if not waitUntilActive(token) then return false,'Stopped' end
      task.wait(.20)
      if localNamedItem('Speakers Amulet') then
        if equipAmulet(token) then return true end
        return false,'Speaker collected, but item equip not confirmed'
      end
    end
  end
  -- Only fall back to E when the native object could not be found or collected.
  if not attemptE(token,.20) then
    return false,'Speaker not collected ('..tostring(reason)..'); no supported E input'
  end
  task.wait(.65)
  if not localNamedItem('Speakers Amulet') then return false,'Speaker inventory item still missing after interaction' end
  if not equipAmulet(token) then return false,'Speaker collected, equip not confirmed' end
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
  if not ghostName then return false,'No mapped ghost NPC loaded at waypoint '..i end
  local npcPos=Vector3.new(route.ghosts[i].x,route.ghosts[i].y,route.ghosts[i].z)
  local myRoot=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
  if not myRoot or (myRoot.Position-npcPos).Magnitude>23 then
    return false,'Not in ghost interaction range (23 studs)'
  end
  local network=liveModule('Network')
  local sent=false
  if network and type(network.FireServer)=='function' then
    local ok,err=pcall(network.FireServer,'meetNPC',ghostName)
    if ok then sent=true;note('INFO','Ghost '..i..': native meetNPC sent to '..ghostName)
    else note('WARN','Ghost '..i..': meetNPC failed '..tostring(err):sub(1,130)) end
  end
  if not sent then
    if not attemptE(token) then return false,'Ghost native interaction unavailable and no supported E input' end
    note('INFO','Ghost '..i..': E fallback sent')
  end
  state.attemptedGhost=math.max(state.attemptedGhost,i)
  checkpoint()
  report('ghost_attempted','ghost_dialogue',i,'NPC interaction attempted; awaiting server status',false)
  -- WANTED's ghost dialogue calls Network.FireServer("meetNPC", ghostName) in its text() callback.
  -- No ghost counts until the game's ClientTasks data confirms it.
  for attempt=1,22 do
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
  return false,'meetNPC did not increase verified quest progress for '..ghostName..' (step '..i..')'
end
local function collectKey(token)
  local evidence=refreshQuestEvidence()
  if not evidence.progress or evidence.progress<9 then return false,'Nine ghosts not verified' end
  local network=liveModule('Network')
  if network and type(network.FireServer)=='function' then
    local ok,err=pcall(network.FireServer,'taskEvent','SpeakerForTheDead','turnIn')
    if ok then note('INFO','Turn-in requested through WANTED DialogUtil taskEvent')
    else note('WARN','Turn-in request error: '..tostring(err):sub(1,130)) end
  end
  -- Dialogue-based fallback for executors without a usable network module.
  for attempt=1,17 do
    if not waitUntilActive(token) then return false,'Stopped' end
    task.wait(.22)
    local ev=refreshQuestEvidence()
    if localNamedItem('Skeleton Key') then
      state.questCompleted=true;state.confirmedGhost=9;checkpoint()
      report('key_verified','key_check',9,'Skeleton Key confirmed in ClientTools',true)
      log('Skeleton Key detected in inventory')
      return true
    end
    if ev.completed and not state.serverQuestComplete then
      state.serverQuestComplete=true
      note('WARN','Quest turn-in confirmed, but Skeleton Key is not in inventory yet')
    end
  end
  if attemptE(token) then
    task.wait(.6)
    tap(Enum.KeyCode.One,token)
    task.wait(.5)
    local ev=refreshQuestEvidence()
    if localNamedItem('Skeleton Key') then
      state.questCompleted=true;checkpoint()
      report('key_verified','key_check',9,'Skeleton Key confirmed after dialog interaction',true)
      return true
    end
    if ev.completed then state.serverQuestComplete=true end
  end
  return false,state.serverQuestComplete and 'Quest turned in but Skeleton Key not present; collect reward manually and copy diagnostics' or 'Turn-in not confirmed by ClientTasks or key inventory'
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
      if not valid(token) then return false end
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
      if attempts>=4 then
        warning('Paused after 4 failed attempts at '..phase..'. Resume to retry once the cause is fixed.')
        state.paused=true
        if not waitUntilActive(token) then return false end
        attempts=0
      end
      if not valid(token) then return false end
      log('Retry scheduled: '..phase)
      task.wait(math.min(8,1+attempts))
    end
  end
  return false
end
local function startQuest()
  if af.running or bank.running or (state.shop and state.shop.running) then warning('Stop other navigation before Skeleton Key');return end
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
  if not liveModule('Network') and not VirtualInputManager and type(keypress)~='function' then
    warning('Cannot interact: game Network module and executor input both unavailable');return
  end
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
  if state.boundDeathCharacter==ch then return end
  state.boundDeathCharacter=ch
  local hum=ch:FindFirstChildOfClass('Humanoid') or ch:WaitForChild('Humanoid',12)
  if not hum then return end
  table.insert(state.connected,hum.Died:Connect(function()
    if state.died then return end
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
  saveFile(settingsFile,config)
end
local function isFriendly(other)
  if combat.whitelist[other.UserId] or combat.whitelist[other.Name:lower()] then return true end
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
    if other~=player and not isFriendly(other) and
      (not combat.loopbring or not combat.manualTargetOnly or combat.selectedTargets[other.UserId]) then
      local ch=other.Character
      local hum=ch and ch:FindFirstChildOfClass('Humanoid')
      local rootPart=ch and ch:FindFirstChild('HumanoidRootPart')
      local head=ch and (ch:FindFirstChild('Head_Hitbox',true) or ch:FindFirstChild('Head') or rootPart)
      if hum and hum.Health>0 and head and rootPart then
        local dist=(myRoot.Position-rootPart.Position).Magnitude
        if dist<=combat.range then
          local screenPos,onscreen=cam:WorldToViewportPoint(head.Position)
          if onscreen and screenPos.Z>0 then
            local center=cam.ViewportSize*.5
            local fovDist=(Vector2.new(screenPos.X,screenPos.Y)-center).Magnitude
            if fovDist<=combat.fovPixels and fovDist<best then nearest=other;best=fovDist end
          end
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
      part.CanTouch=old.touch;part.CanQuery=old.query;part.Color=old.color
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
        local hit=ch and ch:FindFirstChild('Head_Hitbox',true)
        local myRoot=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
        -- Never resize HumanoidRootPart or the visible Head: it breaks player physics.
        if hit and hit:IsA('BasePart') and hum and hum.Health>0 and myRoot
          and (myRoot.Position-hit.Position).Magnitude<=combat.range then
          active[hit]=true
          if not combat.original[hit] then
            combat.original[hit]={size=hit.Size,transparency=hit.Transparency,
              collide=hit.CanCollide,massless=hit.Massless,touch=hit.CanTouch,query=hit.CanQuery,color=hit.Color}
          end
          pcall(function()
            hit.CanCollide=false;hit.CanTouch=false;hit.Massless=true
            hit.Size=Vector3.new(combat.hitboxSize,combat.hitboxSize,combat.hitboxSize)
            hit.Transparency=1-combat.hitAlpha;hit.Color=Color3.fromRGB(table.unpack(combat.hitColor));hit.CanQuery=true
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
        part.CanTouch=old.touch;part.CanQuery=old.query;part.Color=old.color
      end) end
      combat.original[part]=nil
    end
  end
end
combat.originalVisibility={}
local function restoreVisuals()
 for part,value in pairs(combat.originalVisibility) do
  if part and part.Parent then pcall(function()part.LocalTransparencyModifier=value end)end
 end
 combat.originalVisibility={}
end
local function discardClones()
 for _,model in pairs(combat.clones)do if model then pcall(function()model:Destroy()end)end end
 combat.clones={};restoreVisuals()
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
    if not visual or not visual.Parent then visual=cloneVisual(other);combat.clones[other.UserId]=visual end
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
   combat.clones[id]=nil;remove=true
  end
 end
 if remove then
  restoreVisuals()
  -- The next update reapplies local visibility for still-selected players.
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
        local mine=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
        if cam and mine and ((args[1]-cam.CFrame.Position).Magnitude<16
          or (args[1]-mine.Position).Magnitude<16) and args[2].Magnitude>10 then
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
  combat.silentStatus='Weapon-origin raycast hook installed (unverified)';return true
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
-- SPAS shop acquisition is a best-effort, game-validated purchase.
-- Never claims success until ClientTools shows ownership.
function combat.buySpas()
 if combat.buying or state.closed or state.running or af.running or bank.running or bag.selling then return end
 combat.buying=true
 combat.spasStatus='Checking nearest gunshop'
 task.spawn(function()
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
   local deadline=os.clock()+65;local best=math.huge;local lastProgress=os.clock()
   while not state.closed and combat.buying and os.clock()<deadline do
    if state.running or af.running or bank.running or bag.selling then error('Navigation task took priority')end
    local rootPart=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
    if not rootPart or not characterAlive() then error('Player unavailable')end
    local delta=destination-rootPart.Position
    if delta.Magnitude<=8 then break end
    if delta.Magnitude<best-2 then best=delta.Magnitude;lastProgress=os.clock()end
    if os.clock()-lastProgress>13 then error('Gunshop navigation stalled')end
    startNoclip()
    motion.set(rootPart,delta.Unit*math.min(state.speed,math.max(10,delta.Magnitude*2)))
    RunService.Heartbeat:Wait()
   end
   stopMotion()
   if not combat.buying then error('Canceled') end
   local rootPart=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
   if not rootPart or (rootPart.Position-shopPart.Position).Magnitude>15 then error('Not in shop range')end
   local okBuy,approved,result=pcall(network.InvokeServer,'purchaseTool',{
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
local function isCombatAllowed(target)
 if not target or not target.Character then return false end
 if target.Character:FindFirstChildOfClass('ForceField') then return false end
 local ch=target.Character
 local v=target:GetAttribute('isInSafeZone')
 if v==nil then v=ch:GetAttribute('isInSafeZone')end
 if v==true or target:GetAttribute('safeZone')==true or ch:GetAttribute('safeZone')==true then return false end
 return true
end
function combat.updateSpas()
  if not combat.loopbring or not combat.autoSpas or state.running or af.running or bank.running or bag.selling or (state.shop and state.shop.running) or not characterAlive() then
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
  if combat.hitbox then applyHitboxes() end
  if combat.loopbring then updateLoopbring() end
  combat.updateSpas()
  if combat.silent or combat.hitbox or combat.loopbring then
    combat.currentTarget=selectCombatTarget()
  else combat.currentTarget=nil end
end))
local function endCombat()
  combat.silent=false;combat.hitbox=false;combat.loopbring=false;combat.headAssist=false
  combat.cancelSpasFire();combat.buying=false;restoreHitboxes();discardClones()
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
          motion.set(r,Vector3.zero)
        else
          motion.set(r,diff.Unit*math.min(state.speed,math.max(10,diff.Magnitude*2)))
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
            af.knownFloorIds[id]=true
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
          -- Ground loot is static once the crate has opened; normal velocity movement.
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
            local diff=destination-root.Position
            if diff.Magnitude+2<lastDist then lastDist=diff.Magnitude;changed=os.clock() end
            if os.clock()-changed>9 then break end
            startNoclip()
            motion.set(root,diff.Unit*math.min(state.speed,math.max(9,diff.Magnitude*2)))
            RunService.Heartbeat:Wait()
          end
          stopMotion()
        end
        if deferredForGolden then
          afSetStatus('Golden Barrett detected — priority pickup')
          task.wait(.05) -- Keep original lower-priority entry queued for later.
        elseif not filterMatches(entry.name) then
          -- Don't collect an item that was excluded while we were traveling to it.
          done[entry.id]=true;af.pending[entry.id]=nil
        elseif af.running and entry.model.Parent and entry.model.PrimaryPart then
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
              done[entry.id]=true;af.pending[entry.id]=nil;skipped=skipped+1
            else
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
    afSetStatus('Fresh crate loot detected (opener unverified)')
    return af.collectFloor(pos,baseline,token)
  end
  if not crate.Parent or crate:GetAttribute('isLooted')==true then
    afSetStatus('Crate claimed; scanning floor loot')
    return af.collectFloor(pos,baseline,token)
  end
  return false,'No newly dropped loot; crate may already have been claimed by this account'
end
local function afStop()
  af.oneShot=false
  af.running=false;af.token=af.token+1;af.currentCrate=nil;af.pending={}
  stopMotion();afSetStatus('Stopped')
end
local function afStart(oneShot)
  if af.running then return end
  if state.running or bank.running or (state.shop and state.shop.running) then warning('Stop other navigation before Airdrop Farm');return end
  af.oneShot=oneShot==true
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
          if oneShot then afSetStatus('One-time airdrop attempt complete');break end
          -- Another player can open a surviving crate later. Watch for its new floor loot.
          if crate and crate.Parent and af.running and not af.watchers[crate] then
            af.watchers[crate]=true
            task.spawn(function()
              while af.running and af.token==token and crate.Parent and not state.closed do
                local pos=crate.PrimaryPart and crate.PrimaryPart.Position or af.lastPos
                if pos then
                  local objects=af.groundModels(pos,85)
                  local newlyAppeared=false
                  local old={}
                  for id,_ in pairs(objects) do
                    if af.knownFloorIds[id] then old[id]=true
                    else newlyAppeared=true end
                  end
                  if newlyAppeared and not bag.selling then
                    af.collectFloor(pos,old,token)
                  end
                end
                task.wait(1.2)
              end
              af.watchers[crate]=nil
            end)
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

state.shopState={running=false,token=0,status='Ready'}
state.shop=state.shopState
local function openGunshop()
  if state.shopState.running or state.running or af.running or bank.running or bag.selling or (state.combat and state.combat.buying) then
    warning('Stop navigation before opening Gunshop');return
  end
  local shops=liveModule('ClientGameShops')
  local util=liveModule('GameShopUtil')
  if not shops or type(shops.Enter)~='function' then warning('Gunshop module unavailable');return end
  local service=game:GetService('CollectionService')
  local r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
  local chosen,dist=nil,math.huge
  for _,obj in ipairs(service:GetTagged('GameShop')) do
    if obj:IsA('BasePart') and obj.Name=='GunShop' and obj:IsDescendantOf(workspace) then
      local d=r and (obj.Position-r.Position).Magnitude or math.huge
      if d<dist then chosen,dist=obj,d end
    end
  end
  local waypoint=nil
  if not chosen then
    local markers={Vector3.new(-187,82,-2806),Vector3.new(-2679,77,1494),Vector3.new(-6786,77,1310)}
    for _,pos in ipairs(markers) do
      local d=r and (pos-r.Position).Magnitude or math.huge
      if d<dist then waypoint=pos;dist=d end
    end
    if not waypoint then warning('Gunshop coordinates unavailable');return end
    note('INFO','Gunshop: traveling toward nearest exported shop marker')
  end
  state.shopState.running=true;state.shopState.token=state.shopState.token+1;local token=state.shopState.token
  task.spawn(function()
    local ok,reason=pcall(function()
      local since=os.clock();local best=math.huge;local improved=os.clock()
      while state.shopState.running and state.shopState.token==token do
        r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
        if not characterAlive() or not r or (chosen and not chosen.Parent) then error('Shop or character unavailable') end
        local target=chosen and chosen.Position or waypoint
        local delta=target-r.Position
        if delta.Magnitude<9 then break end
        if delta.Magnitude<best-2 then best=delta.Magnitude;improved=os.clock() end
        if os.clock()-improved>12 or os.clock()-since>100 then error('Could not reach Gunshop') end
        state.shopState.status='Flying to real Gunshop'
        startNoclip()
        motion.set(r,delta.Unit*math.min(state.speed,math.max(10,delta.Magnitude*2)))
        RunService.Heartbeat:Wait()
      end
      stopMotion()
      if not state.shopState.running or state.shopState.token~=token then return end
      if not chosen then
        for attempt=1,30 do
          for _,obj in ipairs(service:GetTagged('GameShop')) do
            if obj:IsA('BasePart') and obj.Name=='GunShop' and obj:IsDescendantOf(workspace)
              and r and (obj.Position-r.Position).Magnitude<=110 then
              chosen=obj;break
            end
          end
          if chosen then break end
          task.wait(.2)
        end
      end
      if util and type(util.GetClosestShopPart)=='function' then
        local found,part=pcall(util.GetClosestShopPart,player,'GunShop')
        if found and part and part:IsA('BasePart') then chosen=part end
      end
      if not chosen or not chosen:IsA('BasePart') then error('Real Gunshop part not loaded near marker') end
      if not r or (r.Position-chosen.Position).Magnitude>100 then error('Too far from shop for server validation') end
      state.shopState.status='Opening Gunshop'
      local sent,accepted,why=pcall(shops.Enter,'GunShop',chosen)
      if not sent or accepted==false then error('Shop refused: '..tostring(why or accepted)) end
      if type(shops.InShop)=='function' then
        local confirmed,inShop,shopName=pcall(shops.InShop)
        if not confirmed or not inShop then error('Gunshop did not open after server request') end
      end
      state.shopState.status='Gunshop opened'
      log('Gunshop opened with tagged shopPart')
    end)
    if not ok then state.shopState.status='Failed: '..tostring(reason);warning('Gunshop: '..tostring(reason)) end
    if state.shopState.token==token then state.shopState.running=false;stopMotion() end
  end)
end

-- v23 bank farm: separate from the verified nine-step tutorial.
local bankFarm={running=false,token=0,status='Idle',selected={Regular=true,Silver=true,Gold=true,Sapphire=true,Ruby=true,Emerald=true,Amethyst=true,Diamond=true},
  collectSmall=true,skipGold=false,skipSilver=false,currentVault='Unknown',lastObserved=0,lastDoor=nil,lastNotified={},looted=0,lastError=''}
state.bankFarm=bankFarm
if configSaved then
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
 if localNamedItem(name) then return true end
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
 local payload={itemType='Tool',shopName='GunShop',categoryName=category,itemName=name}
 local called,result,detail=pcall(net.InvokeServer,'purchaseTool',payload)
 if not called then return false,'Native server purchase request failed: '..tostring(result)end
 if result~=true then return false,'Server declined purchase: '..tostring(detail)end
 for _=1,10 do
  if localNamedItem(name) then return true end
  task.wait(.18)
 end
 return false,'Purchase acknowledged but inventory not updated'
end

local function detectVault()
  local model=bank.findDoor()
  if not model then return nil,'Main-bank vault prop not loaded' end
  local api=liveModule('ClientProps')
  local prop=api and type(api.GetFromModel)=='function' and api.GetFromModel(model) or nil
  local raw=model:GetAttribute('vaultName') or model:GetAttribute('vaultRarity') or model:GetAttribute('vaultType') or (prop and prop.vaultType)
  local name=normalizeVault(raw)
  if not name then return nil,'Vault type is not disclosed: '..tostring(raw or 'unknown') end
  return {model=model,gizmo=prop,name=name,opened=bank.isOpen(model),position=model.PrimaryPart.Position,id=tostring(model:GetAttribute('objectId'))},nil
end

local notifyUser=function() end
local function observeVault()
 local vault,err=detectVault()
 if not vault then bankFarm.currentVault='Unknown';return nil,err end
 bankFarm.currentVault=vault.name
 if vault.id~=bankFarm.lastDoor then bankFarm.lastDoor=vault.id;bankFarm.lastObserved=os.time() end
 local key=vault.id..':'..vault.name
 if not bankFarm.lastNotified[key] or os.time()-bankFarm.lastNotified[key]>1200 then
   bankFarm.lastNotified[key]=os.time()
   if vault.name~='Regular' then
     notifyUser('VAULT',vault.name..' vault detected','ROB BANK',function()
       if not state.running and not af.running and not bank.running and not bankFarm.running then bankFarm.start(true) end
     end)
   end
 end
 return vault
end
local function bankPickupList(vault)
 local folder=workspace:FindFirstChild('Local')
 folder=folder and folder:FindFirstChild('Gizmos')
 local api=liveModule('ClientGizmos')
 if not folder or not api or type(api.Get)~='function' then return {} end
 local entries={}
 for _,m in ipairs(folder:GetDescendants()) do
  if m:IsA('Model') and m.PrimaryPart and (m.PrimaryPart.Position-vault.position).Magnitude<=90 then
    local id=m:GetAttribute('objectId')
    if id then
      local ok,g=pcall(api.Get,id)
      if ok and type(g)=='table' and type(g.AttemptCollect)=='function' then
        local prop=type(g.properties)=='table' and g.properties or {}
        local name=tostring(prop.toolName or g.name or '')
        local cash=name=='CashPallet'
        local isLoot=not cash and name~='VaultDoor' and state.naturalLootLookup[baseLootName(name)]==true
        local lower=name:lower()
        if (cash and (bankFarm.collectSmall or (bank.cashAmount(g) or 0)>500)) or isLoot then
          -- Metal exclusions apply to valuables, never Golden AK/Deagle/Barrett.
          local excludedGold=(lower:sub(1,5)=='gold ') and bankFarm.skipGold
          local excludedSilver=(lower:sub(1,7)=='silver ') and bankFarm.skipSilver
          if not excludedGold and not excludedSilver and (cash or passesGlobalLoot(name)) then
            table.insert(entries,{id=tostring(id),name=name,model=m,gizmo=g,cash=cash,amount=bank.cashAmount(g) or 0})
          end
        end
      end
    end
  end
 end
 table.sort(entries,function(a,b)
  -- If a selected Golden Barrett is present, it always outranks cash as well.
  local ag=not a.cash and baseLootName(a.name)=='golden barrett m82'
  local bg=not b.cash and baseLootName(b.name)=='golden barrett m82'
  if ag~=bg then return ag end
  if a.cash~=b.cash then return a.cash end
  if not a.cash then
   local pa,pb=state.globalLoot.priority(a.name),state.globalLoot.priority(b.name)
   if pa~=pb then return pa<pb end
  end
  if a.cash and b.cash and a.amount~=b.amount then return a.amount>b.amount end
  local r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
  local pos=r and r.Position or vault.position
  return (a.model.PrimaryPart.Position-pos).Magnitude<(b.model.PrimaryPart.Position-pos).Magnitude
 end)
 return entries
end
function bankFarm.stop()
 bankFarm.oneShot=false
 bankFarm.running=false;bankFarm.token=bankFarm.token+1;bank.running=false;bank.token=bank.token+1
 bankFarm.status='Stopped';stopMotion()
end
function bankFarm.start(oneShot)
 if bankFarm.running or bank.running or state.running or af.running or bag.selling or state.closed then
   warning('Another movement task is active; bank farm not started');return false
 end
 local vault,err=detectVault()
 if not vault then bankFarm.status='Vault not detected: '..tostring(err);warning(bankFarm.status);return false end
 if not bankFarm.selected[vault.name] then bankFarm.status='Skipped '..vault.name..' (excluded)';return false end
 bankFarm.oneShot=oneShot==true
 bankFarm.running=true;bank.running=true;bank.token=bank.token+1
 bankFarm.token=bankFarm.token+1
 local token=bankFarm.token
 bankFarm.status='Starting '..vault.name
 task.spawn(function()
  local ok,reason=pcall(function()
   local function active()return bankFarm.running and bankFarm.token==token and not state.closed end
   local function flyPoint(vec,label)
     if not active() then error('Canceled') end
     bankFarm.status=label
     local yes,msg=bank.fly({x=vec.X,y=vec.Y,z=vec.Z},bank.token)
     if not yes then error(label..': '..tostring(msg)) end
   end
   if not vault.opened then
     bankFarm.status='Checking C4'
     if not localNamedItem('C4') then
       -- Preserve user's actual free-C4 waypoint. Purchase is server-validated and must be confirmed.
       local free=bank.points.free_c4
       if free then
         flyPoint(Vector3.new(free.x,free.y,free.z),'Fetching free C4')
         for i=1,5 do
           if localNamedItem('C4') then break end
           local pickup=state.findWorldGizmo('C4',16)
           if pickup then pcall(function()pickup:AttemptCollect()end)end
           task.wait(.22)
         end
       end
     end
     if not localNamedItem('C4') then
       local bought,why=buyFromGunShop('C4','Explosives',flyPoint)
       if not bought then error('Unable to acquire C4: '..tostring(why))end
     end
     -- Fly straight to the saved throw position rather than the tutorial's entrance/upper route.
     local dest=bank.points.vault_throw
     if not dest then error('Missing C4 throw waypoint') end
     flyPoint(Vector3.new(dest.x,dest.y,dest.z),'Approaching vault door')
     local breached,why=bank.breach(bank.token,vault.model)
     if not breached then error(why)end
     vault.opened=true
   end
   flyPoint(vault.position+Vector3.new(0,4,0),'Entering open vault')
   local done={};local dry=0;local collected=0;local sweepStarted=os.clock()
   while active() and dry<3 and os.clock()-sweepStarted<300 do
     local entries=bankPickupList(vault)
     local candidate
     for _,e in ipairs(entries) do if not done[e.id] then candidate=e;break end end
     if not candidate then dry=dry+1;task.wait(.45)
     else
       local m=candidate.model
       if not m.Parent or not m.PrimaryPart then done[candidate.id]=true
       else
         local pos=m.PrimaryPart.Position
         flyPoint(pos+Vector3.new(0,2,0),'Collecting '..candidate.name)
         local proof=false
         for i=1,3 do
           local beforeAmount=bank.cashAmount(candidate.gizmo)
           local yes,attemptErr=pcall(function()candidate.gizmo:AttemptCollect(player)end)
           if not yes then note('WARN','Bank pickup '..candidate.name..': '..tostring(attemptErr))end
           task.wait(.23)
           local afterAmount=bank.cashAmount(candidate.gizmo)
           if not m.Parent or m:GetAttribute('isDestroyed')==true or candidate.gizmo.isCollected==true
             or beforeAmount and afterAmount and afterAmount<beforeAmount then proof=true;break end
         end
         done[candidate.id]=not candidate.cash or not m.Parent or (bank.cashAmount(candidate.gizmo) or math.huge)<=0 or not proof
         if proof then collected=collected+1;dry=0
         else note('WARN','Bank pickup unconfirmed '..candidate.name) end
       end
     end
   end
   bankFarm.looted=bankFarm.looted+collected
   bankFarm.status=(dry>=3 and 'Sweep finished · ' or 'Sweep paused at time limit · ')..tostring(collected)..' confirmed pickups'
   if bag.read() and bag.informationReady and bag.percent>=.999 then
      state.bankFarmSellPending=true
   end
  end)
  if not ok then
    bankFarm.lastError=tostring(reason);bankFarm.status='Stopped: '..bankFarm.lastError
    note('ERROR','Bank Farm: '..bankFarm.lastError)
    report('error','bank_tutorial',0,'Bank farm: '..bankFarm.lastError,false)
  end
  if bankFarm.token==token then bankFarm.running=false;bank.running=false;stopMotion()end
 end)
 return true
end
-- Continuous Bank Farm scheduler. The notification's Rob Bank button calls the
-- original single-run path; START BANK remains active across future vault cycles.
-- A model/cycle cooldown prevents repeatedly sweeping an already-cleared vault.
local bankFarmRunOnce=bankFarm.start
local bankFarmStopOnce=bankFarm.stop
bankFarm.autoMode=false
bankFarm.schedulerToken=0
bankFarm.lastAttemptedCycle={}
function bankFarm.stop()
 bankFarm.autoMode=false
 bankFarm.schedulerToken=bankFarm.schedulerToken+1
 if bankFarm.running then bankFarmStopOnce()
 else bankFarm.status='Stopped (auto mode off)' end
end
function bankFarm.start(oneShot)
 if oneShot==true then return bankFarmRunOnce(true) end
 if bankFarm.autoMode then return true end
 if state.closed or state.running or bank.running or af.running or bag.selling then
   warning('Another task is active; cannot enable Bank Auto Farm yet');return false
 end
 bankFarm.autoMode=true
 bankFarm.schedulerToken=bankFarm.schedulerToken+1
 local scheduler=bankFarm.schedulerToken
 bankFarm.status='Auto mode · awaiting selected vault'
 task.spawn(function()
  while not state.closed and bankFarm.autoMode and bankFarm.schedulerToken==scheduler do
   if not bankFarm.running and not bank.running and not state.running and not af.running and not bag.selling then
    local observed=detectVault()
    if observed and bankFarm.selected[observed.name] then
     local key=tostring(observed.id)..':'..observed.name
     local last=bankFarm.lastAttemptedCycle[key] or 0
     if os.time()-last>=1200 then
       if bankFarmRunOnce(true) then
         bankFarm.lastAttemptedCycle[key]=os.time()
         bankFarm.status='Auto mode · robbing '..observed.name
       end
     else
       bankFarm.status='Auto mode · waiting for next vault cycle'
     end
    else
     bankFarm.status='Auto mode · selected vault not available'
    end
   end
   task.wait(2.5)
  end
 end)
 return true
end

-- Read-only event detectors never interrupt quests or other navigation modules.
task.spawn(function()
 while not state.closed do
  local ok,err=pcall(observeVault)
  if not ok then note('WARN','Vault observer: '..tostring(err))end
  task.wait(4)
 end
end)

-- Visual reference: REDLINE Refined Interactive Hub v2.
-- This is native Roblox UI; preview-only statistics and controls are not imported.
do
local TweenService=game:GetService('TweenService')
local uiStart=#state.connected
local C={base=Color3.fromRGB(21,23,28),nav=Color3.fromRGB(27,29,35),card=Color3.fromRGB(32,34,41),raised=Color3.fromRGB(41,43,51),line=Color3.fromRGB(53,55,64),red=Color3.fromRGB(168,61,84),soft=Color3.fromRGB(113,43,60),white=Color3.fromRGB(244,244,245),muted=Color3.fromRGB(163,166,177),dim=Color3.fromRGB(127,132,145),green=Color3.fromRGB(138,202,171),pink=Color3.fromRGB(228,163,178)}
local function connect(c)table.insert(state.connected,c);return c end
local function mk(kind,parent,properties)
  local object=Instance.new(kind)
  for key,value in pairs(properties or {})do object[key]=value end
  object.Parent=parent
  return object
end
local function tween(object,properties,time,style)
  if not object or not object.Parent then return end
  local anim=TweenService:Create(object,TweenInfo.new(time or .18,style or Enum.EasingStyle.Quad,Enum.EasingDirection.Out),properties)
  anim:Play();return anim
end
local function rounded(object,radius)
  mk('UICorner',object,{CornerRadius=UDim.new(0,radius or 7)})
  return object
end
local function stroke(object,color)
  return mk('UIStroke',object,{Color=color or C.line,Thickness=1,ApplyStrokeMode=Enum.ApplyStrokeMode.Border})
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
  return order(mk('TextLabel',parent,{BackgroundTransparency=1,Size=UDim2.new(1,0,0,height or 18),Text=text or '',Font=bold and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=size or 11,TextColor3=color or C.white,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextTruncate=Enum.TextTruncate.AtEnd}))
end
local function row(parent,height)
  return order(mk('Frame',parent,{BackgroundTransparency=1,Size=UDim2.new(1,0,0,height or 28)}))
end
local function card(parent,title,subtitle)
  local object=order(rounded(mk('Frame',parent,{Name=title,Size=UDim2.new(1,-2,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=C.card,BorderSizePixel=0}),8))
  stroke(object);pad(object,11,13,11,13);stack(object,7)
  txt(object,title,19,12,C.white,true)
  if subtitle then txt(object,subtitle,15,10,C.dim)end
  return object
end
local function btn(parent,label,callback,width,height,accent)
  local base=accent and C.red or C.raised
  local button=rounded(mk('TextButton',parent,{BackgroundColor3=base,BorderSizePixel=0,Text=label,TextColor3=C.white,Font=Enum.Font.GothamMedium,TextSize=10,AutoButtonColor=false,Size=UDim2.fromOffset(width or 110,height or 27)}),6)
  button:SetAttribute('Accent',accent==true)
  local function currentColor()return button:GetAttribute('Accent') and C.red or C.raised end
  stroke(button,accent and Color3.fromRGB(172,82,103) or Color3.fromRGB(65,66,77))
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
  tween(button,{BackgroundColor3=on and C.red or C.raised},.15)
end
local function action(parent,label,callback,width,accent)
  local caption=parent:FindFirstChild('RowLabel')
  if caption then caption.Size=UDim2.new(1,-((width or 110)+12),1,0)end
  local button=btn(parent,label,callback,width,26,accent)
  button.AnchorPoint=Vector2.new(1,.5);button.Position=UDim2.fromScale(1,.5)
  return button
end
local function line(parent,label)
  local frame=row(parent,28)
  local labelObject=txt(frame,label,28,10,C.muted);labelObject.Name='RowLabel'
  labelObject.Size=UDim2.new(1,-128,1,0)
  return frame,labelObject
end
local function divider(parent)
  return order(mk('Frame',parent,{BackgroundColor3=C.line,BorderSizePixel=0,Size=UDim2.new(1,0,0,1)}))
end
local function toggle(parent,label,get,set)
  local frame=line(parent,label)
  local button=rounded(mk('TextButton',frame,{AnchorPoint=Vector2.new(1,.5),Position=UDim2.fromScale(1,.5),Size=UDim2.fromOffset(42,22),Text='',AutoButtonColor=false,BorderSizePixel=0,BackgroundColor3=C.raised}),11)
  stroke(button)
  local knob=rounded(mk('Frame',button,{Size=UDim2.fromOffset(16,16),Position=UDim2.fromOffset(3,3),BorderSizePixel=0,BackgroundColor3=C.muted}),8)
  local previous
  local function sync()
    local active=get()==true
    if active==previous then return end
    previous=active
    tween(button,{BackgroundColor3=active and C.red or C.raised},.16)
    tween(knob,{Position=UDim2.fromOffset(active and 23 or 3,3),BackgroundColor3=active and C.white or C.muted},.16)
  end
  connect(button.Activated:Connect(function()
    local ok,err=pcall(set,not get())
    if not ok then warning(tostring(err))end
    sync()
  end))
  sync();return sync
end
local function input(parent,placeholder)
  local field=order(rounded(mk('TextBox',parent,{Size=UDim2.new(1,0,0,29),BackgroundColor3=C.base,BorderSizePixel=0,Text='',PlaceholderText=placeholder,ClearTextOnFocus=false,TextColor3=C.white,PlaceholderColor3=C.dim,Font=Enum.Font.Gotham,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left}),5))
  stroke(field);pad(field,0,8,0,8);return field
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
      value.Text=tostring(math.floor(number+.5))..(unit or '')
    end
  end
  local function change(x)
    local fraction=math.clamp((x-track.AbsolutePosition.X)/math.max(1,track.AbsoluteSize.X),0,1)
    local number=math.clamp(min+math.floor((fraction*(max-min))/step+.5)*step,min,max)
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
local function buildWorkspace(firstBoot)
  if state.closed then return end
  ui={}
  local syncControls={}
  local function sync(fn)table.insert(syncControls,fn)end
  local screen=mk('ScreenGui',player:WaitForChild('PlayerGui'),{Name='REDLINEv26UI',ResetOnSpawn=false,IgnoreGuiInset=true,ZIndexBehavior=Enum.ZIndexBehavior.Sibling,DisplayOrder=40})
  state.gui=screen
  local group=mk('CanvasGroup',screen,{Name='Window',AnchorPoint=Vector2.new(.5,.5),Position=state.windowPosition or UDim2.fromScale(.5,.5),Size=UDim2.fromOffset(1020,650),BackgroundTransparency=1,GroupTransparency=0})
  local scale=mk('UIScale',group,{Scale=1})
  local root=rounded(mk('Frame',group,{Name='Hub',Size=UDim2.fromScale(1,1),BackgroundColor3=C.base,BorderSizePixel=0,ClipsDescendants=true}),13)
  stroke(root,Color3.fromRGB(58,59,66))
  local header=mk('Frame',root,{Name='Header',Size=UDim2.new(1,0,0,59),BackgroundTransparency=1,Active=true})
  mk('Frame',header,{Position=UDim2.new(0,0,1,-1),Size=UDim2.new(1,0,0,1),BackgroundColor3=C.line,BorderSizePixel=0})
  rounded(mk('Frame',header,{Position=UDim2.fromOffset(19,14),Size=UDim2.fromOffset(3,31),BackgroundColor3=Color3.fromRGB(192,67,94),BorderSizePixel=0}),2)
  txt(header,'REDLINE',25,19,C.white,true).Position=UDim2.fromOffset(33,10)
  local by=txt(header,'BY RAHAMIDALI',14,8,C.pink,true);by.Position=UDim2.fromOffset(34,34);by.Size=UDim2.fromOffset(150,14)
  local headerMeta=txt(header,'WANTED',20,10,C.muted);headerMeta.Position=UDim2.new(1,-200,0,20);headerMeta.Size=UDim2.fromOffset(70,20)
  local sidebar=mk('Frame',root,{Name='Navigation',Position=UDim2.fromOffset(0,59),Size=UDim2.new(0,184,1,-82),BackgroundColor3=C.nav,BorderSizePixel=0})
  mk('Frame',sidebar,{Position=UDim2.new(1,-1,0,0),Size=UDim2.new(0,1,1,0),BackgroundColor3=C.line,BorderSizePixel=0})
  local navlabel=txt(sidebar,'WORKSPACE',20,9,C.dim,true);navlabel.Position=UDim2.fromOffset(21,10);navlabel.Size=UDim2.new(1,-30,0,20)
  local pagesRoot=mk('Frame',root,{Name='Workspace',Position=UDim2.fromOffset(184,59),Size=UDim2.new(1,-184,1,-82),BackgroundTransparency=1,ClipsDescendants=true})
  local footer=mk('Frame',root,{Position=UDim2.new(0,0,1,-23),Size=UDim2.new(1,0,0,23),BackgroundColor3=Color3.fromRGB(23,25,31),BorderSizePixel=0})
  mk('Frame',footer,{Size=UDim2.new(1,0,0,1),BackgroundColor3=C.line,BorderSizePixel=0})
  local footerBrand=txt(footer,'REDLINE · RAHAMIDALI',22,9,C.dim);footerBrand.Position=UDim2.fromOffset(16,0);footerBrand.Size=UDim2.fromOffset(180,22)
  ui.status=txt(footer,'READY',22,9,C.pink);ui.status.Position=UDim2.new(0,200,0,0);ui.status.Size=UDim2.new(1,-216,1,0);ui.status.TextXAlignment=Enum.TextXAlignment.Right
  local profile=mk('Frame',sidebar,{Position=UDim2.new(0,9,1,-90),Size=UDim2.new(1,-18,0,83),BackgroundTransparency=1})
  mk('Frame',profile,{Size=UDim2.new(1,0,0,1),BackgroundColor3=C.line,BorderSizePixel=0})
  local thumb=rounded(mk('ImageLabel',profile,{Position=UDim2.fromOffset(4,14),Size=UDim2.fromOffset(34,34),BackgroundColor3=C.raised,BorderSizePixel=0}),9)
  local who=txt(profile,player.DisplayName or player.Name,17,10,C.white,true);who.Position=UDim2.fromOffset(47,12);who.Size=UDim2.new(1,-50,0,17)
  local user=txt(profile,'@'..player.Name,15,9,C.muted);user.Position=UDim2.fromOffset(47,29);user.Size=UDim2.new(1,-50,0,15)
  local online=txt(profile,'●  Session active',17,9,C.green);online.Position=UDim2.fromOffset(4,60);online.Size=UDim2.new(1,-8,0,17)
  task.spawn(function()
    local ok,picture=pcall(function()return Players:GetUserThumbnailAsync(player.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size100x100)end)
    if ok and thumb.Parent then thumb.Image=picture end
  end)
  local pages,navigation={},{}
  local subtitles={Home='Account overview and startup actions',Events='Halloween · Speaker For The Dead',Combat='Targeting, player protection and appearance',['Auto Farm']='Bank, airdrops and loot preferences',Settings='Movement, preferences and diagnostics'}
  state.uiScroll=state.uiScroll or {}
  for _,name in ipairs({'Home','Events','Combat','Auto Farm','Settings'})do
    local p=mk('ScrollingFrame',pagesRoot,{Name=name,Size=UDim2.fromScale(1,1),BackgroundTransparency=1,BorderSizePixel=0,ScrollingDirection=Enum.ScrollingDirection.Y,ScrollBarThickness=4,ScrollBarImageColor3=C.line,CanvasSize=UDim2.new(),AutomaticCanvasSize=Enum.AutomaticSize.Y,Visible=false})
    pad(p,18,23,22,23);stack(p,9)
    local title=txt(p,name,27,20,C.white,true);title.Name='PageTitle'
    local description=txt(p,subtitles[name],17,10,C.dim);description.Name='PageSubtitle'
    p.CanvasPosition=state.uiScroll[name] or Vector2.zero
    pages[name]=p
  end
  local navFrames={}
  local function page(name)
    if not pages[name] then name='Home' end
    for key,p in pairs(pages)do
      if p.Visible then state.uiScroll[key]=p.CanvasPosition end
      p.Visible=key==name
    end
    for key,b in pairs(navigation)do
      tween(b,{BackgroundColor3=key==name and C.soft or C.nav,TextColor3=key==name and C.white or C.muted},.18)
      navFrames[key].Visible=key==name
    end
    state.selectedPage=name
  end
  local icons={'⌂','◇','⊕','▤','⚙'}
  for index,name in ipairs({'Home','Events','Combat','Auto Farm','Settings'})do
    local button=rounded(mk('TextButton',sidebar,{Position=UDim2.fromOffset(9,39+(index-1)*40),Size=UDim2.new(1,-18,0,36),BackgroundColor3=C.nav,BorderSizePixel=0,Text='      '..name,Font=Enum.Font.GothamMedium,TextSize=12,TextColor3=C.muted,TextXAlignment=Enum.TextXAlignment.Left,AutoButtonColor=false}),7)
    local icon=txt(button,icons[index],36,15,C.muted);icon.Position=UDim2.fromOffset(10,0);icon.Size=UDim2.fromOffset(19,36)
    navFrames[name]=rounded(mk('Frame',button,{Position=UDim2.fromOffset(0,7),Size=UDim2.fromOffset(3,22),BackgroundColor3=C.pink,BorderSizePixel=0,Visible=false}),2)
    navigation[name]=button
    connect(button.Activated:Connect(function()page(name)end))
    connect(button.MouseEnter:Connect(function()if state.selectedPage~=name then tween(button,{BackgroundColor3=C.raised},.15)end end))
    connect(button.MouseLeave:Connect(function()if state.selectedPage~=name then tween(button,{BackgroundColor3=C.nav},.15)end end))
  end
  local mini=rounded(mk('TextButton',screen,{Name='Mini',Visible=false,Position=state.miniPosition or UDim2.new(0,27,1,-63),Size=UDim2.fromOffset(145,39),BackgroundColor3=C.base,BorderSizePixel=0,Text='  REDLINE',Font=Enum.Font.GothamBold,TextSize=12,TextColor3=C.white,AutoButtonColor=false}),8)
  stroke(mini,C.red);rounded(mk('Frame',mini,{Position=UDim2.fromOffset(13,10),Size=UDim2.fromOffset(3,19),BackgroundColor3=C.red,BorderSizePixel=0}),2)
  local transition=0
  local function minimize()
    transition=transition+1;local token=transition
    state.windowPosition=group.Position
    tween(group,{GroupTransparency=1},.25);tween(scale,{Scale=.85},.3)
    task.delay(.26,function()if group.Parent and transition==token then group.Visible=false;mini.Visible=true end end)
  end
  local function restore()
    transition=transition+1;mini.Visible=false;group.Visible=true
    tween(group,{GroupTransparency=0},.3);tween(scale,{Scale=1},.35)
  end
  local function drag(handle,target,key,isMini)
    local active,start,origin,moved
    connect(handle.InputBegan:Connect(function(event)
      if event.UserInputType==Enum.UserInputType.MouseButton1 or event.UserInputType==Enum.UserInputType.Touch then active=event;start=event.Position;origin=target.Position;moved=false end
    end))
    connect(UserInputService.InputChanged:Connect(function(event)
      if active and (event==active or event.UserInputType==Enum.UserInputType.MouseMovement)then
        local d=event.Position-start
        if d.Magnitude>6 then moved=true end
        if moved then
          local view=workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1100,720)
          local baseX=origin.X.Scale*view.X+origin.X.Offset
          local baseY=origin.Y.Scale*view.Y+origin.Y.Offset
          local anchor=target.AnchorPoint
          local size=target.AbsoluteSize
          target.Position=UDim2.fromOffset(math.clamp(baseX+d.X,size.X*anchor.X,view.X-size.X*(1-anchor.X)),math.clamp(baseY+d.Y,size.Y*anchor.Y,view.Y-size.Y*(1-anchor.Y)))
          state[key]=target.Position
        end
      end
    end))
    connect(UserInputService.InputEnded:Connect(function(event)
      if active==event then active=nil;if isMini and not moved then restore()end end
    end))
  end
  local dragArea=mk('Frame',header,{Size=UDim2.new(1,-125,1,0),BackgroundTransparency=1,Active=true})
  drag(dragArea,group,'windowPosition',false);drag(mini,mini,'miniPosition',true)
  local minimizeButton=btn(header,'−',minimize,27,27);minimizeButton.Position=UDim2.new(1,-112,0,16)
  local refreshButton=btn(header,'⟳',function()if state.refresh then state.refresh()end end,27,27);refreshButton.Position=UDim2.new(1,-77,0,16)
  local closeButton=btn(header,'×',function()if state.close then state.close()end end,27,27);closeButton.Position=UDim2.new(1,-42,0,16);closeButton.TextColor3=C.pink
  -- Screen-level notification is independent of the draggable window.
  local notice=rounded(mk('CanvasGroup',screen,{Name='GameNotification',Visible=false,AnchorPoint=Vector2.new(.5,0),Position=UDim2.new(.5,0,0,-120),Size=UDim2.fromOffset(380,108),BackgroundColor3=Color3.fromRGB(36,38,46),BorderSizePixel=0,GroupTransparency=0}),9)
  stroke(notice,Color3.fromRGB(118,80,91));mk('Frame',notice,{Size=UDim2.new(1,0,0,2),BackgroundColor3=C.red,BorderSizePixel=0})
  local noticeTitle=txt(notice,'',20,11,C.pink,true);noticeTitle.Position=UDim2.fromOffset(14,9);noticeTitle.Size=UDim2.new(1,-55,0,20)
  local noticeMessage=txt(notice,'',23,10,C.white);noticeMessage.Position=UDim2.fromOffset(14,32);noticeMessage.Size=UDim2.new(1,-28,0,23)
  local noticeHint=txt(notice,'Closes after six seconds',20,9,C.dim);noticeHint.Position=UDim2.fromOffset(14,72);noticeHint.Size=UDim2.new(1,-145,0,20)
  local noticeId,noticeCallback=0,nil
  local function dismissNotice()
    noticeId=noticeId+1;local mine=noticeId;noticeCallback=nil
    tween(notice,{Position=UDim2.new(.5,0,0,-120),GroupTransparency=1},.3)
    task.delay(.31,function()if notice.Parent and mine==noticeId then notice.Visible=false end end)
  end
  local noticeAction=btn(notice,'GO',function()local callback=noticeCallback;dismissNotice();if callback then callback()end end,108,25,true);noticeAction.Position=UDim2.new(1,-122,0,69)
  local dismissButton=btn(notice,'×',dismissNotice,22,22);dismissButton.Position=UDim2.new(1,-34,0,9)
  notifyUser=function(category,message,label,callback)
    if state.closed or not screen.Parent then return end
    noticeId=noticeId+1;local mine=noticeId;noticeCallback=callback
    noticeTitle.Text='REDLINE · WANTED · '..category;noticeMessage.Text=message;noticeAction.Text=label or 'OK'
    notice.Visible=true;tween(notice,{Position=UDim2.new(.5,0,0,10),GroupTransparency=0},.3)
    task.delay(6,function()if notice.Parent and mine==noticeId then dismissNotice()end end)
  end
  -- Home: the same three-tile overview and compact rows as the reference.
  local home=pages.Home
  local stats=row(home,77)
  local statGrid=mk('UIGridLayout',stats,{CellSize=UDim2.new(1/3,-6,0,77),CellPadding=UDim2.fromOffset(9,9),SortOrder=Enum.SortOrder.LayoutOrder})
  local statValues={}
  for index,entry in ipairs({{'Balance','Current cash'},{'Session','Time active'},{'Skeleton Key','Inventory check'}})do
    local tile=rounded(mk('Frame',stats,{Position=UDim2.new((index-1)/3,(index-1)*3,0,0),Size=UDim2.new(1/3,-6,1,0),BackgroundColor3=C.raised,BorderSizePixel=0}),7)
    pad(tile,8,10,8,10)
    txt(tile,entry[1],14,9,C.dim)
    local value=txt(tile,'Reading',23,16,C.white,true);value.Position=UDim2.fromOffset(0,17);statValues[index]=value
    local hint=txt(tile,entry[2],13,9,C.dim);hint.Position=UDim2.fromOffset(0,44)
  end
  local starter=card(home,'Account Starter')
  divider(starter)
  local introLine=line(starter,'Skip initial tutorial');action(introLine,'Skip intro',trySkipBayview,98)
  local bankLine,bankLabel=line(starter,'Bank tutorial')
  local bankButton=action(bankLine,'Start tutorial',bank.start,112,true)
  local bankStopLine=line(starter,'Tutorial controls');action(bankStopLine,'Stop',bank.stop,75)
  local keyLine=line(starter,'Skeleton Key')
  local keyState=txt(keyLine,'Checking',28,10,C.pink);keyState.Size=UDim2.fromOffset(125,28);keyState.Position=UDim2.new(1,-125,0,0);keyState.TextXAlignment=Enum.TextXAlignment.Right
  local tutorialStatus=txt(starter,'Checking account state',17,10,C.dim)
  local inv=card(home,'Account inventory')
  local inventory=txt(inv,'Reading current tools…',21,10,C.muted)
  local bagLabel=txt(inv,'Bag · Reading',20,10,C.muted)
  local bagBar=progress(inv)
  local activityLine=line(inv,'Current action')
  local activity=txt(activityLine,'Idle',28,10,C.green);activity.Position=UDim2.new(1,-160,0,0);activity.Size=UDim2.fromOffset(160,28);activity.TextXAlignment=Enum.TextXAlignment.Right
  local quick=card(home,'Quick Access')
  local shopLine=line(quick,'In-game shops');action(shopLine,'Gunshop',openGunshop,95)
  local captureLine=line(quick,'Tutorial route')
  local routeToggle=action(captureLine,'Waypoints ▾',function()end,115)
  local routeEditor=card(home,'Saved Tutorial Route','Your recorded coordinates are preserved');routeEditor.Visible=false
  local routeStep=txt(routeEditor,'',20,11,C.muted)
  local routeActions=row(routeEditor,27)
  btn(routeActions,'Previous',function()bank.index=math.max(1,bank.index-1)end,82)
  btn(routeActions,'Capture',bank.capture,88).Position=UDim2.fromOffset(89,0)
  btn(routeActions,'Next',function()bank.index=math.min(#bank.steps,bank.index+1)end,65).Position=UDim2.fromOffset(184,0)
  connect(routeToggle.Activated:Connect(function()routeEditor.Visible=not routeEditor.Visible end))
  local recheckLine=line(quick,'Account status');action(recheckLine,'Recheck',function()bank.check();syncExisting()end,95)
  -- Events
  local mission=card(pages.Events,'Skeleton Key Quest')
  local questStatus=txt(mission,'Not started',20,11,C.pink)
  local ghosts=txt(mission,'Confirmed ghosts · 0 / 9',22,12,C.muted)
  local ghostBar=progress(mission)
  txt(mission,'Accept mission  ›  Amulet  ›  Nine ghosts  ›  Verify reward',20,10,C.dim)
  local questLine=line(mission,'Current account only');action(questLine,'Start quest',startQuest,105,true)
  local questControls=row(mission,27)
  btn(questControls,'Pause / Resume',function()setPaused(not state.paused)end,129)
  btn(questControls,'Stop',stop,75).Position=UDim2.fromOffset(137,0)
  local keyInfo=txt(mission,'Key possession is checked separately from quest progress.',19,10,C.dim)
  -- Combat
  local combatPage=pages.Combat
  local aim=card(combatPage,'Silent Aim')
  sync(toggle(aim,'Enabled',function()return combat.silent end,function(on)
    if on and not installSilentAim()then warning(combat.silentStatus);return end
    combat.silent=on
  end))
  sync(slider(aim,'Screen FOV radius',50,450,5,function()return combat.fovPixels end,function(v)combat.fovPixels=v;combat.savePrefs()end,' px'))
  local aimStatus=txt(aim,'Off',16,9,C.dim)
  local hit=card(combatPage,'Head Hitbox')
  sync(toggle(hit,'Enabled',function()return combat.hitbox end,function(on)combat.hitbox=on;if not on then restoreHitboxes()end end))
  sync(slider(hit,'Head size',3,18,1,function()return combat.hitboxSize end,function(v)combat.hitboxSize=v end,' studs'))
  local appearanceLine=line(hit,'FOV / hitbox appearance')
  local appearanceButton=action(appearanceLine,'Color & opacity',function()end,133)
  local appearance=card(combatPage,'Appearance');appearance.Visible=false
  local pickerTarget='FOV'
  local targetLine=line(appearance,'Editing')
  local pickerSelect
  pickerSelect=action(targetLine,'FOV ▾',function()pickerTarget=pickerTarget=='FOV' and 'Hitbox' or 'FOV';pickerSelect.Text=pickerTarget..' ▾'end,104)
  local wheel=row(appearance,115)
  for index=0,35 do
    local hue=index/36;local angle=2*math.pi*hue-math.pi/2
    local dot=rounded(mk('TextButton',wheel,{Position=UDim2.fromOffset(math.floor(60+math.cos(angle)*43-7),math.floor(56+math.sin(angle)*43-7)),Size=UDim2.fromOffset(14,14),BackgroundColor3=Color3.fromHSV(hue,.84,.98),Text='',BorderSizePixel=0,AutoButtonColor=false}),7)
    connect(dot.Activated:Connect(function()
      local value=Color3.fromHSV(hue,.84,.98)
      local channels={math.floor(value.R*255),math.floor(value.G*255),math.floor(value.B*255)}
      if pickerTarget=='FOV' then combat.fovColor=channels else combat.hitColor=channels end
      combat.savePrefs()
    end))
  end
  local swatch=rounded(mk('Frame',wheel,{Position=UDim2.fromOffset(45,41),Size=UDim2.fromOffset(30,30),BackgroundColor3=C.red,BorderSizePixel=0}),15)
  sync(slider(appearance,'Opacity',5,100,5,function()return (pickerTarget=='FOV' and combat.fovAlpha or combat.hitAlpha)*100 end,function(v)
    if pickerTarget=='FOV' then combat.fovAlpha=v/100 else combat.hitAlpha=v/100 end
    combat.savePrefs()
  end,'%'))
  connect(appearanceButton.Activated:Connect(function()appearance.Visible=not appearance.Visible end))
  local loop=card(combatPage,'Loopbring')
  sync(toggle(loop,'Enabled',function()return combat.loopbring end,function(on)
    combat.loopbring=on
    if on and combat.autoSpas then combat.headAssist=installSilentAim()==true end
    if not on then discardClones();combat.cancelSpasFire();combat.headAssist=false end
  end))
  sync(toggle(loop,'Auto SPAS-12',function()return combat.autoSpas end,function(on)
    combat.autoSpas=on
    if on and combat.loopbring then combat.headAssist=installSilentAim()==true else combat.cancelSpasFire()end
  end))
  local spasStatus=txt(loop,'Waiting',18,10,C.dim)
  local protection=card(combatPage,'Player Protection')
  sync(toggle(protection,'Exclude Roblox friends',function()return combat.ignoreFriends end,function(on)
    combat.ignoreFriends=on;combat.savePrefs();restoreHitboxes();discardClones()
  end))
  local search=input(protection,'Search usernames or display names…')
  local whitelist=scroll(protection,176)
  local selection=card(combatPage,'Loopbring Targets','Select only the players you want included')
  local selectedList=scroll(selection,176)
  local confirmation=card(combatPage,'Confirm Target');confirmation.Visible=false
  local confirmLabel=txt(confirmation,'',22,11,C.muted)
  local pending,refreshRoster
  local confirmRow=row(confirmation,27)
  btn(confirmRow,'Confirm',function()
    if pending and not combat.whitelist[pending.UserId] then combat.selectedTargets[pending.UserId]=not combat.selectedTargets[pending.UserId]end
    pending=nil;confirmation.Visible=false;refreshRoster()
  end,100,27,true)
  btn(confirmRow,'Cancel',function()pending=nil;confirmation.Visible=false end,82).Position=UDim2.fromOffset(108,0)
  local thumbCache={}
  refreshRoster=function()
    local whiteScroll,targetScroll=whitelist.CanvasPosition,selectedList.CanvasPosition
    for _,parent in ipairs({whitelist,selectedList})do
      for _,child in ipairs(parent:GetChildren())do if child:IsA('GuiObject')then child:Destroy()end end
      parent:SetAttribute('RedlineOrder',0)
    end
    local query=search.Text:lower();local shown=0
    local function avatar(parent,other)
      local img=rounded(mk('ImageLabel',parent,{Position=UDim2.fromOffset(4,4),Size=UDim2.fromOffset(26,26),BackgroundColor3=C.raised,BorderSizePixel=0}),6)
      if thumbCache[other.UserId]then img.Image=thumbCache[other.UserId]
      else task.spawn(function()
        local ok,pic=pcall(function()return Players:GetUserThumbnailAsync(other.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size48x48)end)
        if ok then thumbCache[other.UserId]=pic;if img.Parent then img.Image=pic end end
      end)end
    end
    for _,other in ipairs(Players:GetPlayers())do
      if other~=player and (query=='' or other.Name:lower():find(query,1,true)or other.DisplayName:lower():find(query,1,true))then
        shown=shown+1
        for _,entry in ipairs({{whitelist,true},{selectedList,false}})do
          local parent,isWhite=entry[1],entry[2]
          local frame=row(parent,34)
          if isWhite and combat.whitelist[other.UserId]then frame.BackgroundTransparency=0;frame.BackgroundColor3=Color3.fromRGB(71,42,55);rounded(frame,5)end
          avatar(frame,other)
          local name=txt(frame,other.DisplayName..'  @'..other.Name,34,10,C.muted);name.Position=UDim2.fromOffset(38,0);name.Size=UDim2.new(1,-137,0,34)
          if isWhite then
            action(frame,combat.whitelist[other.UserId] and 'Protected ✓'or 'Protect',function()
              combat.whitelist[other.UserId]=not combat.whitelist[other.UserId]
              if combat.whitelist[other.UserId]then combat.selectedTargets[other.UserId]=nil end
              combat.savePrefs();restoreHitboxes();discardClones();refreshRoster()
            end,91,combat.whitelist[other.UserId])
          else
            local button=action(frame,combat.selectedTargets[other.UserId]and 'Selected ✓'or 'Select',function()
              pending=other;confirmLabel.Text=(combat.selectedTargets[other.UserId]and 'Remove 'or 'Add ')..other.Name..'?';confirmation.Visible=true
              combatPage.CanvasPosition=Vector2.new(0,math.max(0,confirmation.AbsolutePosition.Y-combatPage.AbsolutePosition.Y+combatPage.CanvasPosition.Y-120))
            end,91,combat.selectedTargets[other.UserId])
            button.Active=not combat.whitelist[other.UserId];button.TextTransparency=button.Active and 0 or .6
          end
        end
      end
    end
    if shown==0 then txt(whitelist,'No matching players',30,10,C.dim);txt(selectedList,'No matching players',30,10,C.dim)end
    whitelist.CanvasPosition=whiteScroll;selectedList.CanvasPosition=targetScroll
  end
  connect(search:GetPropertyChangedSignal('Text'):Connect(refreshRoster));connect(Players.PlayerAdded:Connect(refreshRoster))
  connect(Players.PlayerRemoving:Connect(function()task.defer(function()if screen.Parent then refreshRoster()end end)end))
  refreshRoster()
  -- Auto Farm
  local farm=pages['Auto Farm']
  local bagCard=card(farm,'Bag Manager')
  local bagInfo=txt(bagCard,'Reading inventory',22,12,C.white)
  local farmBagBar=progress(bagCard)
  local bagItems=txt(bagCard,'',18,10,C.muted)
  local seller=txt(bagCard,'',18,10,C.dim)
  sync(slider(bagCard,'Early sell after 25% full',10,15,5,function()return bag.earlyMinutes end,function(v)bag.earlyMinutes=v;saveSettings()end,' min'))
  local bankCard=card(farm,'Bank Farm')
  local bankStatus=txt(bankCard,'Checking vault',22,11,C.muted)
  local bankTimer=txt(bankCard,'Bank cycle · Syncing',18,10,C.pink)
  local bankActionLine=line(bankCard,'Continuous farming')
  local bankToggle=action(bankActionLine,'Start',function()if bankFarm.autoMode or bankFarm.running then bankFarm.stop()else bankFarm.start(false)end end,87,true)
  local vaultLine=line(bankCard,'Included vaults')
  local vaultToggle=action(vaultLine,'Select vaults ▾',function()end,127)
  local vaultPanel=card(farm,'Vault Selection');vaultPanel.Visible=false
  local vaultChips=row(vaultPanel,58)
  mk('UIGridLayout',vaultChips,{CellSize=UDim2.new(.25,-6,0,25),CellPadding=UDim2.fromOffset(6,6),SortOrder=Enum.SortOrder.LayoutOrder})
  for _,name in ipairs({'Regular','Silver','Gold','Sapphire','Ruby','Emerald','Amethyst','Diamond'})do
    local button
    button=btn(vaultChips,name,function()bankFarm.selected[name]=not bankFarm.selected[name];button.Text=(bankFarm.selected[name]and '✓ 'or '○ ')..name;accent(button,bankFarm.selected[name]);saveSettings()end,92,25,bankFarm.selected[name])
    button.Text=(bankFarm.selected[name]and '✓ 'or '○ ')..name
  end
  sync(toggle(vaultPanel,'Collect small cash piles',function()return bankFarm.collectSmall end,function(v)bankFarm.collectSmall=v;saveSettings()end))
  sync(toggle(vaultPanel,'Skip gold valuables',function()return bankFarm.skipGold end,function(v)bankFarm.skipGold=v;saveSettings()end))
  sync(toggle(vaultPanel,'Skip silver valuables',function()return bankFarm.skipSilver end,function(v)bankFarm.skipSilver=v;saveSettings()end))
  connect(vaultToggle.Activated:Connect(function()vaultPanel.Visible=not vaultPanel.Visible end))
  local airdropCard=card(farm,'Airdrops')
  local airTimer=txt(airdropCard,'Next airdrop · Syncing',18,10,C.pink)
  local airStats=txt(airdropCard,'Opened 0 · Golden Barretts 0',18,10,C.dim)
  local airStatus=txt(airdropCard,'Idle',22,11,C.muted)
  local airLine=line(airdropCard,'Continuous farming')
  local airToggle=action(airLine,'Start',function()if af.running then afStop()else afStart(false)end end,87,true)
  local filter=card(farm,'Global Loot Filter','Golden Barrett remains the first eligible pickup')
  local tabRow=row(filter,28)
  local simple=btn(tabRow,'Simple',function()end,97,27,true)
  local advanced=btn(tabRow,'Advanced',function()end,107);advanced.Position=UDim2.fromOffset(104,0)
  local simplePanel=order(mk('Frame',filter,{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1}));stack(simplePanel,6)
  local rarityGrid=row(simplePanel,58)
  mk('UIGridLayout',rarityGrid,{CellSize=UDim2.new(1/3,-5,0,25),CellPadding=UDim2.fromOffset(6,6),SortOrder=Enum.SortOrder.LayoutOrder})
  for _,name in ipairs({'Common','Uncommon','Rare','Epic','Legendary','Mythic'})do
    local b
    b=btn(rarityGrid,(state.globalLoot.simple[name]and '✓ 'or '○ ')..name,function()
      state.globalLoot.simple[name]=not state.globalLoot.simple[name];b.Text=(state.globalLoot.simple[name]and '✓ 'or '○ ')..name;accent(b,state.globalLoot.simple[name]);saveSettings()
    end,100,25,state.globalLoot.simple[name])
  end
  local advancedPanel=order(mk('Frame',filter,{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Visible=false}));stack(advancedPanel,6)
  local lootSearch=input(advancedPanel,'Search guns, gems, rings, printers, presents…')
  local lootRows=scroll(advancedPanel,232)
  local names={};for _,name in ipairs(state.naturalLootCatalog)do table.insert(names,name)end
  table.sort(names,function(a,b)local pa,pb=state.globalLoot.priority(a),state.globalLoot.priority(b);if pa~=pb then return pa<pb end;return a:lower()<b:lower()end)
  local lootFrames={}
  for _,name in ipairs(names)do
    local frame=row(lootRows,34);lootFrames[name]=frame
    local key=baseLootName(name)
    local label=txt(frame,name,16,10,name=='Golden Barrett M82'and C.pink or C.white);label.Size=UDim2.new(1,-108,0,16)
    local tier=txt(frame,name=='Golden Barrett M82'and 'PRIORITY #1'or state.globalLoot.rarity(name),14,9,C.dim);tier.Position=UDim2.fromOffset(0,17);tier.Size=UDim2.new(1,-108,0,14)
    local button
    button=action(frame,(state.globalLoot.overrides[key]or 'default'):upper(),function()
      local old=state.globalLoot.overrides[key]
      state.globalLoot.overrides[key]=old==nil and 'collect'or old=='collect'and 'skip'or nil
      button.Text=(state.globalLoot.overrides[key]or 'default'):upper();saveSettings()
    end,99)
  end
  connect(lootSearch:GetPropertyChangedSignal('Text'):Connect(function()
    local q=lootSearch.Text:lower()
    for name,frame in pairs(lootFrames)do frame.Visible=q==''or name:lower():find(q,1,true)~=nil end
  end))
  connect(simple.Activated:Connect(function()simplePanel.Visible=true;advancedPanel.Visible=false;accent(simple,true);accent(advanced,false)end))
  connect(advanced.Activated:Connect(function()simplePanel.Visible=false;advancedPanel.Visible=true;accent(simple,false);accent(advanced,true)end))
  -- Settings
  local movement=card(pages.Settings,'Movement')
  sync(slider(movement,'Flight speed',75,85,5,function()return state.speed end,function(v)state.speed=v;saveSettings()end,' studs/s'))
  sync(toggle(movement,'Noclip',function()return state.noclip end,function(v)
    state.noclip=v
    if not v then restoreCollision()end
    saveSettings()
  end))
  local diagnose=card(pages.Settings,'Diagnostics')
  local trackerStatus=txt(diagnose,'Tracker · Checking',19,10,C.muted)
  local logBox=order(rounded(mk('TextBox',diagnose,{Size=UDim2.new(1,0,0,110),BackgroundColor3=C.base,BorderSizePixel=0,Text='',TextColor3=C.muted,Font=Enum.Font.Code,TextSize=10,TextEditable=false,MultiLine=true,TextWrapped=true,ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top}),5));pad(logBox,7,7,7,7)
  local logLine=line(diagnose,'Errors and current module state');action(logLine,'Copy log',copyDiagnostics,95)
  local about=card(pages.Settings,'REDLINE v26');txt(about,'RahamidAli · WANTED',18,10,C.dim)
  local fovRing=rounded(mk('Frame',screen,{Name='CombatFOV',BackgroundTransparency=1,AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(.5,.5),Size=UDim2.fromOffset(combat.fovPixels*2,combat.fovPixels*2),Visible=false}),999)
  local fovStroke=stroke(fovRing,C.red)
  local previousView=nil
  local function resize()
    local view=workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1100,720)
    if view==previousView then return end
    previousView=view
    local width,height=math.min(1020,view.X-18),math.min(650,view.Y-18)
    local side=width<410 and 104 or width<700 and 124 or 184
    group.Size=UDim2.fromOffset(width,height)
    local statColumns=width<410 and 1 or width<700 and 2 or 3
    statGrid.CellSize=UDim2.new(1/statColumns,-(statColumns-1)*9/statColumns,0,77)
    stats.Size=UDim2.new(1,0,0,math.ceil(3/statColumns)*86-9)
    sidebar.Size=UDim2.new(0,side,1,-82)
    for _,button in pairs(navigation)do button.TextSize=width<700 and 10 or 12 end
    pagesRoot.Position=UDim2.fromOffset(side,59);pagesRoot.Size=UDim2.new(1,-side,1,-82)
    headerMeta.Visible=width>=600
    who.Visible=width>=600;user.Visible=width>=600
    for _,p in pairs(pages)do
      local padding=p:FindFirstChildOfClass('UIPadding')
      padding.PaddingLeft=UDim.new(0,width<700 and 11 or 23);padding.PaddingRight=padding.PaddingLeft
    end
    for _,value in ipairs(statValues)do value.TextSize=width<600 and 12 or 16 end
    notice.Size=UDim2.fromOffset(math.min(380,view.X-16),108)
    local pos=group.Position;local px=pos.X.Scale*view.X+pos.X.Offset;local py=pos.Y.Scale*view.Y+pos.Y.Offset
    group.Position=UDim2.fromOffset(math.clamp(px,width/2,view.X-width/2),math.clamp(py,height/2,view.Y-height/2))
  end
  resize();connect(RunService.RenderStepped:Connect(resize))
  local nextTick,nextBag,nextBank,nextSync,nextLog=0,0,0,0,0
  local seenCrates={}
  connect(RunService.Heartbeat:Connect(function()
    if state.closed or not screen.Parent or os.clock()<nextTick then return end
    local now=os.clock();nextTick=now+.25
    -- Yielding inventory/HTTP reads never run inside the UI render callback.
    if now>=nextBag then nextBag=now+2;task.spawn(function()local ok,err=pcall(bag.tick);if not ok then note('WARN','Bag: '..tostring(err))end end)end
    if now>=nextBank then nextBank=now+3;task.spawn(bank.check)end
    if now>=nextSync and isListed then nextSync=now+28;task.spawn(function()local ok,err=pcall(syncExisting);if not ok then note('WARN','Tracker: '..tostring(err))end end)end
    for _,syncControl in ipairs(syncControls)do syncControl()end
    statValues[2].Text=fmt(now-sessionStarted)
    local data=liveModule('ClientData')
    if data and type(data.Get)=='function'then
      local ok,amount=pcall(data.Get,'cash');if ok and type(amount)=='number'then statValues[1].Text=cash(amount)end
    end
    statValues[3].Text=state.keyInInventory and 'Owned'or 'Not found';statValues[3].TextColor3=C.pink
    keyState.Text=state.keyInInventory and 'In inventory'or 'Not observed'
    bankButton.Text=bank.done and 'Completed ✓'or bank.running and 'Running…'or 'Start tutorial';bankButton.Active=not bank.done and not bank.running;bankButton.TextTransparency=bank.done and .4 or 0
    bankStopLine.Visible=bank.running
    bankLabel.Text=bank.done and 'Bank tutorial ✓'or 'Bank tutorial'
    tutorialStatus.Text=(bank.running or bank.autoStatus:find('Stopped',1,true)) and bank.autoStatus or bank.status
    local toolNames={}
    local tools=itemClient()
    if tools and type(tools.GetItems)=='function'then
      local ok,items=pcall(tools.GetItems)
      if ok and type(items)=='table'and type(items.Tool)=='table'then
        for _,item in pairs(items.Tool)do if type(item)=='table'and type(item.name)=='string'then table.insert(toolNames,item.name)end end
      end
    end
    table.sort(toolNames);inventory.Text=#toolNames>0 and table.concat(toolNames,'  ·  ')or 'No tools observed'
    bagLabel.Text=bag.informationReady and ('Bag · '..string.format('%.1f / %.1f kg',bag.weight,bag.capacity)..'  ·  '..cash(bag.value))or 'Bag · Waiting for game data'
    bagBar.Size=UDim2.fromScale(bag.percent or 0,1);farmBagBar.Size=bagBar.Size
    activity.Text=state.running and (state.paused and 'Quest paused'or 'Ghost quest')or bank.running and (bankFarm.running and 'Bank farm'or 'Bank tutorial')or af.running and 'Airdrop farm'or bag.selling and 'Selling'or 'Idle'
    routeStep.Text=tostring(bank.index)..'/9 · '..bank.steps[bank.index][2]
    questStatus.Text=state.questCompleted and 'Quest complete'or state.running and (state.paused and 'Paused'or state.phase)or 'Not running'
    ghosts.Text='Confirmed ghosts · '..state.confirmedGhost..' / 9';ghostBar.Size=UDim2.fromScale(state.confirmedGhost/9,1)
    keyInfo.Text=state.keyInInventory and 'Skeleton Key currently in inventory.'or state.serverQuestComplete and 'Quest completed; Skeleton Key not currently observed.'or 'Key possession is checked separately from quest progress.'
    aimStatus.Text=combat.silent and combat.silentStatus or 'Off'
    spasStatus.Text=combat.spasStatus
    swatch.BackgroundColor3=Color3.fromRGB(table.unpack(pickerTarget=='FOV'and combat.fovColor or combat.hitColor))
    bagInfo.Text=bag.informationReady and string.format('%.1f / %.1f kg  ·  %s',bag.weight,bag.capacity,cash(bag.value))or 'Bag data unavailable'
    local entries={};for index,item in ipairs(bag.items or {})do if index>4 then break end;table.insert(entries,item.name..' ×'..item.count)end
    bagItems.Text=#entries>0 and table.concat(entries,', ')or 'Empty'
    seller.Text='Seller · '..tostring(bag.seller)..'  ·  '..bag.status
    bankStatus.Text=bankFarm.currentVault..' vault · '..bankFarm.status
    bankTimer.Text=bankFarm.lastObserved>0 and ('Bank cycle · '..fmt(math.max(0,1200-(os.time()-bankFarm.lastObserved)))..' estimated')or 'Bank cycle · Waiting for observation'
    bankToggle.Text=(bankFarm.autoMode or bankFarm.running)and 'Stop'or 'Start'
    airToggle.Text=af.running and 'Stop'or 'Start';airStatus.Text=af.status;airStats.Text='Opened '..af.openCount..' · Golden Barretts '..af.goldenCount
    local globals=liveModule('Globals');local air=globals and globals.AIRDROPS
    if air and tonumber(air.PERIOD)and tonumber(air.OFFSET)then
      local remaining=(air.PERIOD-((DateTime.now().UnixTimestamp-air.OFFSET)%air.PERIOD))%air.PERIOD
      airTimer.Text='Next airdrop · '..fmt(remaining)..' estimated'
    else airTimer.Text='Next airdrop · Waiting for game timing'end
    fovRing.Visible=combat.silent;fovRing.Size=UDim2.fromOffset(combat.fovPixels*2,combat.fovPixels*2);fovStroke.Color=Color3.fromRGB(table.unpack(combat.fovColor));fovStroke.Transparency=1-combat.fovAlpha
    trackerStatus.Text=isListed and ('Tracker · '..(state.trackerConnected and 'Connected'or state.networkError~=''and state.networkError or 'Waiting'))or 'Tracker · This account is not on the tracking list'
    if now>=nextLog then
      nextLog=now+3
      local lines={};for index=math.max(1,#state.history-7),#state.history do table.insert(lines,state.history[index])end
      logBox.Text=#lines>0 and table.concat(lines,'\n')or 'No errors recorded'
      local ok,crates=pcall(afFindCrates)
      if ok then for _,crate in ipairs(crates)do
        if not seenCrates[crate]then seenCrates[crate]=true;notifyUser('AIRDROP','Airdrop incoming','Farm drop',function()afStart(true)end)end
      end end
    end
  end))
  state.refresh=function()
    if state.closed then return end
    for name,p in pairs(pages)do state.uiScroll[name]=p.CanvasPosition end
    state.windowPosition=group.Position;state.miniPosition=mini.Position
    saveSettings()
    -- Rebuild only the view. Active navigation and its tokens are untouched.
    for index=#state.connected,uiStart+1,-1 do pcall(function()state.connected[index]:Disconnect()end);state.connected[index]=nil end
    screen:Destroy();buildWorkspace(false)
  end
  state.close=function()
    if state.closed then return end
    if bankFarm.running or bankFarm.autoMode then bankFarm.stop()end
    bank.stop();afStop();stop();endCombat()
    if state.shop then state.shop.running=false;state.shop.token=state.shop.token+1 end
    bag.selling=false;bag.token=bag.token+1
    state.closed=true;stopMotion(true);restoreCollision()
    saveSettings()
    for _,connection in ipairs(state.connected)do pcall(function()connection:Disconnect()end)end
    screen:Destroy()
    for _,key in ipairs({'REDLINEHubV26','REDLINEHubV23','REDLINEHubV20'})do if _G[key]==state then _G[key]=nil end end
  end
  page(state.selectedPage or 'Home')
  if firstBoot then
    group.Visible=false
    local loader=mk('CanvasGroup',screen,{Name='Startup',Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.fromRGB(10,11,15),BackgroundTransparency=.2,GroupTransparency=0})
    local box=rounded(mk('Frame',loader,{AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(.5,.5),Size=UDim2.fromOffset(315,155),BackgroundColor3=C.nav,BorderSizePixel=0}),12)
    stroke(box,C.soft);pad(box,19,20,18,20);stack(box,8)
    txt(box,'REDLINE',27,21,C.white,true);txt(box,'BY RAHAMIDALI',13,8,C.pink,true)
    local stage=txt(box,'Checking current account',18,10,C.muted)
    local bar=progress(box,4)
    local count=txt(box,'01 / 05',15,9,C.dim)
    task.spawn(function()
      local stages={'Checking current account','Reading quest state','Setting up modules','Restoring preferences','REDLINE ready'}
      local missing={}
      for index,message in ipairs(stages)do
        if state.closed or not loader.Parent then return end
        stage.Text=message;count.Text=('%02d / 05'):format(index);tween(bar,{Size=UDim2.fromScale(index/5,1)},.3)
        if index==2 then bank.check()end
        if index==3 then for _,name in ipairs({'ClientTasks','ClientTools','ClientGizmos','ClientData'})do if not liveModule(name)then table.insert(missing,name)end end end
        if index==5 and #missing>0 then stage.Text='Interface ready · waiting for game modules';note('WARN','Modules unavailable: '..table.concat(missing,', '))end
        task.wait(.28)
      end
      if not loader.Parent or state.closed then return end
      tween(loader,{GroupTransparency=1},.3)
      group.Visible=true;group.GroupTransparency=1;scale.Scale=.96
      tween(group,{GroupTransparency=0},.3);tween(scale,{Scale=1},.35)
      task.delay(.32,function()if loader.Parent then loader:Destroy()end end)
    end)
  else
    group.GroupTransparency=1;scale.Scale=.98;tween(group,{GroupTransparency=0},.18);tween(scale,{Scale=1},.2)
  end
  task.spawn(function()
    if firstBoot and isListed then report('client_seen','waiting',0,'REDLINE v26 launched',false)end
  end)
end
buildWorkspace(true)
end
