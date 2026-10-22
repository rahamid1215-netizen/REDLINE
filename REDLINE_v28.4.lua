-- REDLINE | WANTED v28.3 — by rahamidali
-- v28.3: stage-aware Ghost Quest resume, native hand-in, verified dropped-key receipt;
-- shared 20-consecutive-correction travel budget, independent of interaction retries.
-- Live task currentStep takes priority over the disappearing MeetGhosts found table.
-- Existing account receipts are shown finished only with current game completion evidence.
-- v28.2: native ghost quick interaction and verified cleanup; bounded local crash journal;
-- full automatic character noclip with locked UI and exact manual/collision restoration.
-- Authoritative update input: REDLINE_v28.2.lua; current turn-in observations supplied by owner.
-- Preserves v28.1 elevator, depleted-pile saved escape, no assumed gas timer, and all routes.
-- Confirmed repairs: precise approach tolerance, desktop-only ghost fallbacks on touch,
-- early/unverified dialogue dismissal, repeated NPC scans, idle/queued noclip ownership.
-- No live Delta/mobile test was available. The native process crash remains unconfirmed.
-- Crash journal: REDLINE_crash_<PlaceId>_<UserId>.txt plus _previous.txt (best effort).
-- After a crash, reopen once and use Settings > Copy log BEFORE starting another quest.
-- Last *_before without *_after narrows a native boundary; it does not prove causation.
-- Collision OFF restores original values immediately, including inside geometry; no teleport.
-- Authoritative base: supplied REDLINE_v27.1.lua; master specification read in full.
-- Changes: shared farm scheduler; task-owned CFrame flight, collision and camera cleanup;
-- native Ghost dialogue / identity verification; C4/vault revalidation; required elevator ride;
-- eight-second cosmetic startup; compact native controls and searchable dropdowns.
-- Preserved: allowlist, tracker endpoint/payload, credentials boundary, recorded route defaults,
-- loot catalog/Golden priorities, settings migration, combat targeting and shop functionality.
-- Validation: offline compile/model tests only. No live Roblox server execution is claimed.
-- Export/user difference: export reward table lists bones; user reports 30,000 bones plus
-- a dropped Skeleton Key near Ghost. Turn-in and actual inventory ownership are verified separately.
-- Native request timeout is an UNKNOWN outcome, never success; that target is not automatically
-- retried in this session. Canceling a local waiter cannot undo a server request already sent.
-- Startup progress is cosmetic; game-module readiness is reported separately.
local Players = game:GetService('Players')
local RunService = game:GetService('RunService')
local UserInputService = game:GetService('UserInputService')
local HttpService = game:GetService('HttpService')
local player = Players.LocalPlayer
if not player then return end
if game.PlaceId ~= 14438406081 then warn('[REDLINE] Unsupported game.'); return end

do
  local closed={}
  for _,key in ipairs({'REDLINEHubV28','REDLINEHubV27','REDLINEHubV26','REDLINEHubV23','REDLINEHubV20','REDLINEHubV19','REDLINEHubV18','REDLINEHubV17','REDLINEHubV16','REDLINEHubV15','REDLINEHubV14','REDLINEHubV13','REDLINEHubV12','REDLINEHubV11','REDLINEHubV10','REDLINEHubV9','REDLINEHubV8','REDLINEHubV7','WANTEDHubV6'})do
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
local route = {['main']={['x']=-6724.72,['y']=43.09,['z']=735.3},['speaker']={['x']=-6713.94,['y']=45.09,['z']=715.24},['ghosts']={{['x']=-6997.7,['y']=53,['z']=3108.19},{['x']=-4891.73,['y']=20.76,['z']=3727.33},{['x']=-4436.99,['y']=559.19,['z']=2353.31},{['x']=-1115.07,['y']=180.93,['z']=3288.3},{['x']=701.04,['y']=69.1,['z']=2820.37},{['x']=1138.87,['y']=104.64,['z']=1808.63},{['x']=-137.28,['y']=39.83,['z']=-1749.5},{['x']=-3473.01,['y']=345,['z']=103.77},{['x']=-6335.73,['y']=397.31,['z']=-844.99}}}
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
  speed=80, noclip=false, paused=false, pauseEach=false, tutorialReady=false, missionStarted=false, confirmedGhost=0,
  attemptedGhost=0, amuletHeld=false, questCompleted=false, selectedPage='home', phase='waiting',
  retries=0, session=HttpService:GenerateGUID(false), networkError='', trackerConnected=false, checkpointStamp=0, died=false, routeError='',
  url='https://rahamidali.pythonanywhere.com', status='Idle', history={}, errors={}, missionVerified=false, verificationSource='Unknown',
}
_G.REDLINEHubV28=state
_G.REDLINEHubV27=state
_G.REDLINEHubV26=state
_G.REDLINEHubV23=state
_G.REDLINEHubV20=state
state.close=function()
  if state.closed then return end
  state.closed=true;state.running=false;state.token=state.token+1
  if state.camera and state.camera.current then state.camera.release(state.camera.current.lease)end
  if state.motion then state.motion.release()end
  if state.collision then
    for part,value in pairs(state.collision.original)do if part.Parent then pcall(function()part.CanCollide=value end)end end
    if state.collision.connection then state.collision.connection:Disconnect()end
  end
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
  local lines={'REDLINE v28.4 | RahamidAli','Account: '..player.Name,'UserId: '..tostring(player.UserId),
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
    return ('REDLINE v28.4 | session %s | UTC %s\n'):format(state.session,os.date('!%Y-%m-%d %H:%M:%S'))..table.concat(d.records,'\n')
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
  function d.copyText()
    return '\n--- CURRENT CRASH CHECKPOINTS ---\n'..d.text()..'\n--- PREVIOUS SESSION ---\n'..(d.previous~=''and d.previous or 'No saved previous session')
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
local function saveSettings()
  local sels={};for n,on in pairs(af.selected) do if on then table.insert(sels,n) end end
  local other={};for name,active in pairs(state.globalLoot.selected) do if active then table.insert(other,name) end end
  local latest=readFile(settingsFile) or readFile('REDLINE_v22_settings.json') or readFile('REDLINE_v21_settings.json') or {}
  local c=state.combat
  if c then latest.fovColor=c.fovColor;latest.hitColor=c.hitColor;latest.fovAlpha=c.fovAlpha;latest.hitAlpha=c.hitAlpha;latest.ignoreFriends=c.ignoreFriends end
  saveFile(settingsFile,{fovColor=latest.fovColor,hitColor=latest.hitColor,fovAlpha=latest.fovAlpha,hitAlpha=latest.hitAlpha,ignoreFriends=latest.ignoreFriends,speed=state.speed,noclip=state.manualNoclipEnabled==true,airdropMode=af.mode,airdropSelected=sels,globalLootMode=state.globalLoot.mode,globalLootSelected=other,globalRarity=state.globalLoot.simple,globalOverrides=state.globalLoot.overrides,bankVaults=state.bankFarm and state.bankFarm.selected or nil,bankCollectSmall=state.bankFarm and state.bankFarm.collectSmall,bankSkipGold=state.bankFarm and state.bankFarm.skipGold,bankSkipSilver=state.bankFarm and state.bankFarm.skipSilver,earlyMinutes=bag.earlyMinutes,combatWhitelist=latest.combatWhitelist or (configSaved and configSaved.combatWhitelist) or {},fovPixels=state.combat and state.combat.fovPixels or 175})
end
local function checkpoint()
  if state.closed then return end
  saveFile(checkpointFile,{missionStarted=state.missionStarted,confirmedGhost=state.confirmedGhost,
    attemptedGhost=state.attemptedGhost,questCompleted=state.questCompleted,tutorialReady=state.tutorialReady,
    userId=player.UserId,placeId=game.PlaceId,questWaypoints=state.quest and state.quest.waypoints or {},
    keyCollectedPreviously=state.quest and state.quest.keyCollectedPreviously==true})
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
state.work={lease=nil,serial=0,pending=nil,critical=false}
function state.work.owns(owner,token)
  local lease=state.work.lease
  return not state.closed and lease~=nil and lease.owner==owner and lease.token==token
end
function state.work.launch(owner,token,callback)
  if state.closed or state.work.lease or state.work.dispatching and state.work.dispatching.canceled then return false end
  state.work.serial=state.work.serial+1
  local lease={owner=owner,token=token,id=state.work.serial,started=os.clock()}
  state.work.lease=lease
  if state.collision then state.collision.acquire(lease)end
  lease.thread=task.spawn(function()
    motion.callers[coroutine.running()]=lease
    local ok,why=xpcall(callback,function(err)return tostring(err)end)
    if not ok then warning(owner..': '..tostring(why))end
    if state.quest and state.quest.cleanupDialogue and state.work.lease==lease then
      local cleaned,why=state.quest.cleanupDialogue(lease)
      if not cleaned then note('WARN','Dialogue cleanup: '..tostring(why))end
    end
    -- Finalizers may only release resources belonging to this exact generation.
    if state.camera then state.camera.release(lease)end
    if motion.lease==lease then motion.release()end
    if state.collision then state.collision.release(lease)end
    if state.work.lease==lease then
      state.work.lease=nil;state.work.critical=false
      if owner=='bank' then bank.running=false;if state.bankFarm then state.bankFarm.running=false end
      elseif owner=='airdrop' then af.running=false
      elseif owner=='quest' then state.running=false;state.awaiting=false
      elseif owner=='seller' then bag.selling=false
      elseif owner=='shop' and state.shop then state.shop.running=false
      elseif owner=='combatShop' and state.combat then state.combat.buying=false end
    end
    if state.collision then state.collision.sync()end
    if lease.navigationFailed then
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
    lease.finished=true
  end)
  return true
end
function motion.ownerGeneration(owner)
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
function motion.release()
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
  if not motion.lease then
    local active=state.work.lease
    if active and motion.callers[coroutine.running()]==active and motion.ownerActive(active.owner)and motion.prepare(part)then
      motion.lease=active;motion.owner=active.owner;motion.ownerStamp=active.token;state.collision.acquire(active)
    end
  end
  local lease=motion.lease
  if not lease or state.work.lease~=lease or not motion.ownerActive(lease.owner) or not characterAlive() then motion.release();return end
  if motion.root~=part or not part.Parent then return end
  if motion.mode=='hold' and motion.tween then return end
  motion.beginTween(part,part.CFrame,.2,'hold',part.Position,nil)
end
function motion.halt()if motion.root then motion.hold(motion.root)end end
function motion.holdForNativeLift(part)
  -- Exported lift has separate floor cabins. Its server transport must remain authoritative.
  -- Full noclip removes floor support; keep the existing hold, but rebase a native floor jump.
  motion.hold(part)
  local lease=motion.lease
  if not lease or motion.root~=part then return false end
  if motion.nativeRide then motion.nativeRide:Disconnect()end
  motion.nativeRide=part:GetPropertyChangedSignal('CFrame'):Connect(function()
    if state.work.lease~=lease or motion.lease~=lease or not motion.ownerActive(lease.owner)
      or not player.Character or player.Character:FindFirstChild('HumanoidRootPart')~=part then return end
    if motion.mode=='hold'and motion.target and (part.Position-motion.target).Magnitude>6 then
      -- Never create a destination or teleport locally. Accept the externally observed position.
      motion.cancelTween();motion.hold(part)
    end
  end)
  return true
end
-- Travel corrections are independent of interaction failures. Shared by every navigation owner.
function motion.watchTravel(part,target)
  local lease=state.work.lease
  if not lease or motion.callers[coroutine.running()]~=lease or not motion.ownerActive(lease.owner)
    or not characterAlive()or not player.Character or part~=player.Character:FindFirstChild('HumanoidRootPart')then
    return false,'Navigation canceled or character changed',false
  end
  if lease.navigationFailed then return false,lease.navigationFailed,false end
  local n=lease.navigation
  if not n or n.root~=part then
    n={root=part,count=0,lastCorrection=-math.huge,position=part.Position,target=target,best=(target-part.Position).Magnitude,stableSince=os.clock()}
    lease.navigation=n
  end
  local now=os.clock();local corrected=false
  local priorDistance=(n.target-n.position).Magnitude
  local againstPrior=(n.target-part.Position).Magnitude
  if (part.Position-n.position).Magnitude>18 and againstPrior>priorDistance+8 then
    corrected=true;n.count=n.count+1;n.lastCorrection=now;n.stableSince=now;n.best=(target-part.Position).Magnitude
    n.recoveryDistance=n.best
    motion.cancelTween() -- Retarget from the position the game actually returned us to.
    state.navigationStatus='Position correction '..n.count..'/20 · retrying travel'
    note('WARN',lease.owner..': '..state.navigationStatus)
    if n.count>=20 then
      lease.navigationFailed='Travel stopped after 20 consecutive position corrections'
      state.navigationStatus=lease.navigationFailed;return false,lease.navigationFailed,true
    end
  elseif n.count>0 and now-n.lastCorrection>=3 and (target-n.target).Magnitude<8
    and (target-part.Position).Magnitude<(n.recoveryDistance or math.huge)-20 then
    n.count=0;state.navigationStatus='Travel recovered';n.stableSince=now
  end
  n.position=part.Position;n.target=target
  return true,nil,corrected
end
function motion.arrived()
  local lease=state.work.lease
  if lease and motion.callers[coroutine.running()]==lease then lease.navigation=nil end
end

function motion.travel(part,destination,speed,owner)
  local lease=state.work.lease;local caller=motion.callers[coroutine.running()]
  owner=owner or (lease and lease.owner)
  if not lease or caller~=lease or lease.owner~=owner or not motion.ownerActive(owner) then return false end
  if typeof(destination)~='Vector3' or destination.X~=destination.X or destination.Y~=destination.Y or destination.Z~=destination.Z
    or math.abs(destination.X)>100000 or math.abs(destination.Y)>100000 or math.abs(destination.Z)>100000 then error('Invalid route coordinate')end
  local allowed,why=motion.watchTravel(part,destination);if not allowed then return false,why end
  if not motion.prepare(part) then return false end
  motion.owner=owner;motion.lease=lease;motion.ownerStamp=lease.token
  state.collision.acquire(lease)
  speed=math.clamp(tonumber(speed) or state.speed,75,90)
  local delta=destination-part.Position
  if delta.Magnitude<=.5 then motion.hold(part);return true end
  if motion.mode=='travel' and motion.tween and motion.target and motion.speed==speed
    and ((destination-motion.target).Magnitude<=.5 or os.clock()<(motion.nextRetarget or 0))then return true end
  motion.beginTween(part,part.CFrame+delta,math.max(.05,delta.Magnitude/speed),'travel',destination,speed)
  return true
end

-- Manual preference is independent of enabled features, queued actions and movement leases.
state.manualNoclipEnabled=state.noclip==true
state.collision={owners={},original={},character=nil,connection=nil,restorePending=false}
function state.collision.automatic()
  if state.closed then return false end
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

local function stop()
  if state.work.cancelPending then state.work.cancelPending('Ghost quest')end
  state.stopping=true;state.running=false;state.paused=false;state.token=state.token+1
  stopMotion();state.awaiting=false;state.collision.sync()
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
local function flyTo(record,token,phase,ghost,tolerance)
  local dest=Vector3.new(record.x,record.y,record.z)
  local tries=0
  tolerance=math.clamp(tonumber(tolerance)or 7,.5,14)
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
        task.wait(0.35)
        if valid(token)and characterAlive()and r==root()and (r.Position-dest).Magnitude<=tolerance+1 then
          motion.hold(r);motion.arrived();state.diagnostics.mark('ghost_approach_reached',phase);state.diagnostics.mark('travel_stopped_hold_established',motion.mode or 'none');return true end
      end
      tries=tries+1;startNoclip()
      local previous=r.Position;local started=os.clock()
      local flightDeadline=os.clock()+math.max(15,(r.Position-dest).Magnitude/state.speed*3+12)
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
        if corrected then flightDeadline=os.clock()+math.max(15,(r.Position-dest).Magnitude/state.speed*3+12)end
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
      if valid(token) and (r.Position-dest).Magnitude<=tolerance+1 then
        task.wait(0.45)
        if valid(token)and characterAlive()and r==root()and (r.Position-dest).Magnitude<=tolerance+1 then
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
    local allowed,why,corrected=motion.watchTravel(rootPart,point)
    if not allowed then stopMotion();return false,why end
    if corrected then lastProgress=os.clock();previousDistance=delta.Magnitude;deadline=os.clock()+math.max(14,delta.Magnitude/state.speed*3+12)end
    if delta.Magnitude<=9 then motion.arrived();stopMotion();return true end
    if delta.Magnitude<previousDistance-2 then previousDistance=delta.Magnitude;lastProgress=os.clock() end
    if os.clock()>deadline or os.clock()-lastProgress>12 then stopMotion();return false,'Could not reach seller' end
    startNoclip()
    motion.travel(rootPart,point,state.speed,'seller')
    RunService.Heartbeat:Wait()
  end
  stopMotion();return false,'Stopped'
end
function bag.sell()
  if bag.selling or state.closed or state.running or state.work.lease then return end
  if not bag.informationReady or bag.value<=0 then return end
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
      -- Mirrors the game's legitimate dialogue callback, within NPC interaction range.
      local invoked,result=state.work.nativeCall(10,'sellLoot',network.InvokeServer,'sellLoot',seller,seller=='Sir B' and true or nil)
      if not invoked or result~=true then error('Server refused '..seller..' sale: '..tostring(result)) end
      local previousValue=bag.value;local accepted=false
      for _=1,35 do
        if not bag.selling or bag.token~=token then break end
        task.wait(.2)
        bag.read()
        if bag.value<previousValue then accepted=true;break end
      end
      if not accepted then error('Sale response received, but bag contents did not change') end
      bag.lastSold=os.clock();bag.aboveSince=nil;af.needsSell=false;state.sellRequested=false
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
  if (not af.enabled and not af.requested and not state.bankFarmSellPending and not (state.bankFarm and state.bankFarm.autoMode)) or state.running then
    bag.status='Idle';return
  end
  if os.clock()-bag.lastFail<60 then bag.status='Sell Failed';return end
  if bag.value<=0 then bag.status='Farming';return end
  if bag.percent>=.999 or (bag.aboveSince and os.clock()-bag.aboveSince>=bag.earlyMinutes*60) then
    state.sellRequested=true;bag.status='Queued for sale'
  elseif not af.needsSell then state.sellRequested=false;bag.status='Farming' end
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
  local result={source=bank.routeSource,placeId=game.PlaceId,bankCashRequired=bank.cashRequirement(),elevatorRequired=false,steps={}}
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
  state.diagnostics.mark('amulet_ownership_checked',tostring(localNamedItem(name)),'ClientTools')
  if toolEquipped(name) then
    state.amuletHeld=true;state.diagnostics.mark('amulet_equip_confirmed','already equipped','ClientTools')
    return true
  end
  local tools=itemClient()
  local itemId=toolIdNamed(name)
  if itemId and tools and type(tools.ToggleEquip)=='function' then
    state.diagnostics.mark('amulet_equip_before','item ID located','ClientTools.ToggleEquip')
    local ok,equipped=state.work.nativeCall(5,'questAmuletEquip',tools.ToggleEquip,itemId)
    state.diagnostics.mark('amulet_equip_after',ok and 'returned'or tostring(equipped),'ClientTools.ToggleEquip')
    if ok and equipped~=false then
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
  if UserInputService.TouchEnabled then
    state.amuletHeld=false;state.quest.terminalFailure='Unsupported interaction: amulet equip unconfirmed; desktop inventory wheel is not used on touch'
    state.diagnostics.mark('amulet_equip_unavailable',state.quest.terminalFailure);return false
  end
  local selected=equipNamedItem({'Speakers Amulet',"Speaker's Amulet"},token)
  if selected and toolEquipped(name) then
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

function bank.acquireC4(token,door)
  local started,lastAttempt=os.clock(),-math.huge
  local reason='BankC4 has not streamed in'
  while bank.active(token) and os.clock()-started<22 do
    if bank.isOpen(door) then return true,'Vault already open' end
    if bank.c4Ready() then return true,'C4 ownership and ammunition confirmed' end
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
          local sent,err=pcall(g.Interact,g)
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
  for key,name in pairs(type(progress.questWaypoints)=='table'and progress.questWaypoints or {})do
    local index=tonumber(key)
    if index and index>=1 and index<=#route.ghosts and type(name)=='string'then state.quest.waypoints[index]=name end
  end
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
function state.npcReady(npc,token,rootPart)
  if not valid(token)or not characterAlive()or not state.work.owns('quest',token)then return false,'Stopped or character unavailable'end
  local r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
  if not r or rootPart and rootPart~=r then return false,'Character changed during interaction'end
  if not npc or not npc.model or not npc.model:IsDescendantOf(workspace)or not npc.model.PrimaryPart then return false,'NPC disappeared'end
  local g=npc.gizmo
  if g.model and g.model~=npc.model then return false,'NPC instance changed'end
  if (r.Position-npc.model.PrimaryPart.Position).Magnitude>(tonumber(g.interaction.promptDistance)or 0)-1 then return false,'NPC out of range'end
  if g.isGhost and g.isHidden~=false and g.ghostVisible~=true then return false,'Ghost is hidden'end
  local standing,why=state.standingForInteraction();if not standing then return false,why end
  if type(g._canSee)=='function'then local ok,seen=pcall(g._canSee,g);if not ok or not seen then return false,'Line of sight blocked'end end
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
  if g.isGhost and not equipAmulet(token)then return false,state.quest.terminalFailure or 'Speaker missing'end
  local r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
  if not r then return false,'Character unavailable'end
  local delta=r.Position-npc.position
  local direction=delta.Magnitude>.1 and delta.Unit or Vector3.new(0,0,1)
  local target=npc.position+direction*math.min(5,range-4)
  if delta.Magnitude>math.min(10,range-3)then
    local reached,why=flyTo({x=target.X,y=target.Y,z=target.Z},token,'npc_approach',state.confirmedGhost,2)
    if not reached then return false,why end
  end
  local deadline=os.clock()+4
  repeat
    if not waitUntilActive(token)or not characterAlive()then return false,'Stopped or character unavailable'end
    npc=state.resolveNPC(name,point,85)
    if npc then g=npc.gizmo;if not g.isGhost or g.isHidden==false or g.ghostVisible==true then break end end
    task.wait(.2)
  until os.clock()>=deadline
  if not npc then return false,'NPC unstreamed during approach'end
  if g.isGhost and g.isHidden~=false and g.ghostVisible~=true then return false,'Ghost still hidden after amulet, approach and visibility wait'end
  state.diagnostics.mark('visibility_confirmed',name)
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
  if not waitUntilActive(token)then return false,'Stopped'end
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
      if ok and other and (other.prompt or other.interaction)then return false,'Another interaction is closer; move nearer to '..npc.name end
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
    if corrected then start=os.clock();moved=os.clock();closest=delta.Magnitude;maxTravel=math.max(25,delta.Magnitude/state.speed*4+17)end
    if delta.Magnitude<3 then motion.arrived();stopMotion();return true end
    if delta.Magnitude<closest-2 then closest=delta.Magnitude;moved=os.clock() end
    if os.clock()-moved>13 or os.clock()-start>maxTravel then
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
function bank.cashRequirement()
  local properties=bank.requirements()
  for _,step in ipairs(properties and properties.steps or {}) do
    for _,req in ipairs(step.requirements or {}) do
      if req.requirementType=='StealBankCash' and tonumber(req.total) then return tonumber(req.total) end
    end
  end
  return 5000 -- Export fallback, never used as local progress evidence.
end
function bank.useElevator(token)
  local data=bank.taskData()
  if not data then error('Bank tutorial data unavailable; activate The Heist first')end
  local stepIndex
  local properties=bank.requirements()
  for index,step in ipairs(properties and properties.steps or {})do
    for _,req in ipairs(step.requirements or {})do if req.requirementType=='UseElevator'then stepIndex=index end end
  end
  if not stepIndex or (tonumber(data.currentStep)or 1)>stepIndex then return end
  if data.didUse==true then
    if not bank.waitFor(token,10,function()local d=bank.taskData();return d and (tonumber(d.currentStep)or 1)>stepIndex end)then
      error('Elevator use credited; another bank entrance requirement remains unconfirmed')
    end
    return
  end
  local prop,model,ground
  bank.autoStatus='Locating required bank elevator'
  local found=bank.waitFor(token,12,function()
    local api=liveModule('ClientProps')
    for _,candidate in ipairs(game:GetService('CollectionService'):GetTagged('MainBankElevator'))do
      if candidate:IsA('Model')and candidate:IsDescendantOf(workspace)then
        local floors=candidate:FindFirstChild('Floors')
        local floor=floors and floors:FindFirstChild('Ground')
        local current=api and type(api.GetFromModel)=='function'and api.GetFromModel(candidate)
        if floor and current and type(current.IsInside)=='function'and type(current.Hack)=='function'then
          model,ground,prop=candidate,floor,current;return true
        end
      end
    end
  end)
  if not found then error('Required bank elevator has not streamed in')end
  local function moveTo(part,label)
    if not part or not part:IsA('BasePart')then error(label..' unavailable')end
    bank.autoStatus=label
    local ok,why=bank.fly({x=part.Position.X,y=part.Position.Y,z=part.Position.Z},token)
    if not ok then error(why)end
  end
  if model:GetAttribute('currentFloor')~='Ground'or model:GetAttribute('inTransit')==true then
    local button=ground:FindFirstChild('Button')
    if not button or not button.PrimaryPart or type(prop.Call)~='function'then error('Elevator call button unavailable')end
    moveTo(button.PrimaryPart,'Calling bank elevator')
    local ok,why=state.work.nativeCall(10,prop,prop.Call,prop,'Ground',button)
    if not ok then error(why)end
    bank.autoStatus='Waiting for elevator at Ground'
    if not bank.waitFor(token,45,function()return model:GetAttribute('currentFloor')=='Ground'and model:GetAttribute('inTransit')~=true end)then
      error('Elevator did not arrive at Ground; no robbery started')
    end
  end
  local base=ground:FindFirstChild('Base')
  local controls=ground:FindFirstChild('Buttons')
  if not controls or not controls.PrimaryPart then error('Elevator cabin controls unavailable')end
  moveTo(base,'Entering bank elevator')
  local r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
  if not r or not prop:IsInside()or (r.Position-controls.PrimaryPart.Position).Magnitude>14 then
    error('Elevator cabin/range check failed; no hack sent')
  end
  -- Full automatic noclip needs support while waiting; accept native floor transport.
  if not motion.holdForNativeLift(r)then error('Elevator movement ownership unavailable')end
  task.wait(1.1)
  if not bank.active(token)then error('Canceled')end
  r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
  if not r or not prop:IsInside()or (r.Position-controls.PrimaryPart.Position).Magnitude>14 then error('Moved outside elevator controls')end
  bank.autoStatus='Using required elevator - riding to vault'
  local ok,why=state.work.nativeCall(10,prop,prop.Hack,prop,'Vault',controls)
  if not ok then error(why)end
  local arrived=bank.waitFor(token,55,function()
    local current=bank.taskData()
    return current and (tonumber(current.currentStep)or 1)>stepIndex
      and model:GetAttribute('currentFloor')=='Vault'and model:GetAttribute('inTransit')~=true
  end)
  if motion.nativeRide then motion.nativeRide:Disconnect();motion.nativeRide=nil end
  if not arrived then error('Elevator ride or tutorial credit not confirmed; robbery paused')end
  log('Required elevator ride confirmed; continuing saved bank route')
end

function bank.cashObjectiveMet()
  local data=bank.taskData();if not data then return false end
  bank.cashStolen=tonumber(data.bankCashStolen or data.cashStolen)or 0
  return bank.cashStolen>=bank.cashRequirement()
end

function bank.unconfirmedObjective()
  local data=bank.taskData();local properties=bank.requirements()
  local step=properties and properties.steps and data and properties.steps[tonumber(data.currentStep)or 1]
  for _,req in ipairs(step and step.requirements or {})do
    if req.requirementType=='UseElevator'then return 'Live task still requires UseElevator; restart the tutorial to perform its required elevator ride' end
  end
  return 'Cash requirement met; another tutorial requirement is still unconfirmed'
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
  if not model or not model.Parent then return 'UNKNOWN','Vault not replicated' end
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
  if not tap(Enum.KeyCode.X,nil,.15)then return false,'Detonation input unavailable'end
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
      if os.clock()-lastProgress>12 then bank.cashTarget=nil;return false,'Cash target unstreamed; zero balance not confirmed' end
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
    local ok,err=pcall(function()
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
      move('bank_entrance','Entering bank')
      bank.useElevator(token)
      move('bank_upper','Flying upward')
      move('free_c4','Collecting free C4')
      local found,door=bank.waitFor(token,15,bank.findDoor)
      if not found then error('Main bank vault door not replicated near the saved route') end
      if not bank.isOpen(door) then
        local acquired,why=bank.hasPlanted(door),nil
        if not acquired then acquired,why=bank.acquireC4(token,door)end
        if not acquired then error(why) end
        move('vault_throw','Approaching vault')
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
    if ok then result.completionKnown=true;result.completed=yes==true end
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
      result.handInReady=true;result.ghostsComplete=true;result.progress=state.quest.required
      result.source='ClientTasks.currentStep: ReturnToNPC';result.returned=data.hasReturned==true
    end
    result.ghostsComplete=result.ghostsComplete or result.progress~=nil and result.progress>=state.quest.required
  end
  if result.completed then
    result.known=true;result.ghostsComplete=true;result.progress=state.quest.required;result.source='ClientTasks.IsTaskComplete'
  end
  return result
end
local function refreshQuestEvidence()
  local evidence=readQuestEvidence()
  if evidence.tutorialComplete~=nil then state.tutorialReady=evidence.tutorialComplete end
  if evidence.known then
    state.missionVerified=evidence.mission;state.missionStarted=evidence.mission
    state.foundGhosts=evidence.found or {}
    state.quest.handInReady=evidence.handInReady;state.quest.ghostsComplete=evidence.ghostsComplete
    state.quest.currentStep=evidence.currentStep
  end
  if evidence.completionKnown then state.serverQuestComplete=evidence.completed;state.questCompleted=evidence.completed end
  state.verificationSource=evidence.source
  if evidence.progress~=nil and evidence.progress~=state.confirmedGhost then
    state.confirmedGhost=evidence.progress;checkpoint()
    note('INFO','Quest progress '..evidence.progress..'/'..state.quest.required..' from '..evidence.source)
  elseif evidence.known and not evidence.mission and not evidence.completed then state.confirmedGhost=0 end
  -- A receipt records an earlier verified pickup for this account; live completion is still required.
  if evidence.known and evidence.mission and not evidence.completed and state.quest.keyCollectedPreviously then
    state.quest.keyCollectedPreviously=false;checkpoint()
  end
  local owned=localNamedItem('Skeleton Key')
  state.keyInInventory=owned==true
  if evidence.completed and (owned or state.quest.keyCollectedPreviously)then
    if owned and not state.quest.keyCollectedPreviously then state.quest.keyCollectedPreviously=true;checkpoint()end
    state.quest.workflowComplete=true;state.quest.stage='complete';state.quest.lastFailure=''
  elseif evidence.known then
    state.quest.workflowComplete=false
    if not state.running then
      if evidence.completed then state.quest.stage='key_missing'
      elseif evidence.handInReady then state.quest.stage='ready_to_turn_in'
      elseif evidence.mission and state.quest.stage~='failed'then state.quest.stage='collecting_ghosts'end
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
      reason='Amulet owned, but equip not confirmed'
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
local function talkGhost(token,i)
  state.quest.stage='identifying_ghost';state.quest.currentWaypoint=i
  local ghostName
  for _=1,25 do
    if not waitUntilActive(token)then return false,'Stopped'end
    ghostName=ghostNameAtPoint(route.ghosts[i]);if ghostName then break end;task.wait(.2)
  end
  local evidence=refreshQuestEvidence()
  if evidence.completed or evidence.handInReady then return true,'Ghost stage complete; returning to giver'end
  if not ghostName then return false,'No quest ghost identified at saved waypoint '..i end
  state.quest.waypoints[i]=ghostName;state.quest.currentNPC=ghostName
  if evidence.found and evidence.found[ghostName]then return true,'Already credited'end
  if not equipAmulet(token)then return false,state.quest.terminalFailure or 'Speaker missing'end
  local npc,why=state.prepareNPC(ghostName,route.ghosts[i],token)
  if not npc then return false,why end
  state.attemptedGhost=math.max(state.attemptedGhost,i);checkpoint()
  state.quest.stage='opening_dialogue'
  local opened,inputWhy=state.npcDialogueInput(npc,token)
  if not opened then return false,inputWhy end
  state.quest.stage='verifying_ghost'
  local credited=false;local deadline=os.clock()+10
  repeat
    if not waitUntilActive(token)or not characterAlive()then return false,'Stopped or character unavailable'end
    local actual=refreshQuestEvidence()
    credited=actual.found and actual.found[ghostName]==true or actual.completed==true or actual.handInReady==true
    if credited then break end
    task.wait(.2)
  until os.clock()>=deadline
  if credited then state.diagnostics.mark('ghost_credit_observed',ghostName,'ClientTasks.found')end
  -- Wait for actual credit before dismissing: native talkedToNPC is scheduled after dialogue.
  local dismissed,closeWhy=dismissGhostDialogue(token,npc)
  if not dismissed then
    state.quest.terminalFailure='Dialogue cleanup unconfirmed: '..tostring(closeWhy)
    return false,state.quest.terminalFailure
  end
  if not credited then return false,'No task-data credit for '..ghostName..'; arrival/input is not success'end
  report('ghost_verified','ghost_dialogue',state.confirmedGhost,'NPC credited: '..ghostName,true)
  state.quest.lastFailure='';return true,'NPC identity verified in task data'
end

-- Live observation supplied by the owner: turn-in awards bones and drops a key near Ghost.
-- A reward entry alone is not possession. Watch the real world pickup and then current inventory.
function state.quest.collectDroppedKey(token)
  if not state.serverQuestComplete then return false,'Quest completion must be verified before reward pickup'end
  if state.quest.refreshKey()or state.quest.keyCollectedPreviously then
    state.quest.keyCollectedPreviously=true;state.quest.lastFailure='';state.quest.stage='complete';state.quest.workflowComplete=true;checkpoint();return true
  end
  state.quest.stage='waiting_for_key_drop';state.quest.keyState='missing';state.quest.workflowComplete=false
  local center=Vector3.new(route.main.x,route.main.y,route.main.z)
  local deadline=os.clock()+35;local lastAttempt=-math.huge;local attempts=0
  while valid(token)and os.clock()<deadline do
    if not waitUntilActive(token)then return false,'Stopped'end
    if not characterAlive()then return false,'death'end
    if localNamedItem('Skeleton Key')then
      task.wait(.2)
      if not valid(token)then return false,'Stopped'end
      if localNamedItem('Skeleton Key')then
        state.keyInInventory=true;state.quest.keyCollectedPreviously=true;state.quest.keyState='owned';state.quest.lastFailure='';state.quest.stage='complete';state.quest.workflowComplete=true
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
  return state.quest.collectDroppedKey(token)
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
    state.questCompleted=true;state.serverQuestComplete=true;state.quest.workflowComplete=true;state.quest.stage='complete'
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
    if state.confirmedGhost>0 and liveEvidence.progress==nil then
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
        if not doStage(token,route.speaker,'speaker_pickup',0,function() return pickupSpeaker(token) end) then return end
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
    state.died=true;if state.camera.current then state.camera.release(state.camera.current.lease)end;state.amuletHeld=false;stopMotion();log('Died; recovery will begin after respawn')
  end)
  table.insert(state.connected,state.deathConnection)
end
if player.Character then attachDeath(player.Character) end
table.insert(state.connected,player.CharacterAdded:Connect(function(ch)
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
    if not af.seen[crate] and crate.PrimaryPart and (not af.retryAt or (af.retryAt[crate]or 0)<=os.clock())then
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
  local flightDeadline=os.clock()+180
  while af.running and af.token==token and not state.closed and crate.Parent and crate.PrimaryPart and os.clock()<flightDeadline do
    af.lastPos=crate.PrimaryPart.Position
    if bag.selling then stopMotion(false,'airdrop');repeat task.wait(.2) until not bag.selling or not af.running;lastProgress=os.clock();priorDist=math.huge end
    if state.running then stopMotion(false,'airdrop');return false,'Quest running' end
    if not characterAlive() then
      stopMotion(false,'airdrop');afSetStatus('Waiting to respawn');task.wait(.8)
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
        if os.clock()-lastProgress>17 then stopMotion(false,'airdrop');return false,'Tracking crate stalled' end
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
  af.enabled=false;af.requested=false;af.oneShot=false;af.running=false;af.token=af.token+1
  af.currentCrate=nil;af.pending={};af.queuedSweeps={};af.needsSell=false
  if not (state.bankFarm and (state.bankFarm.autoMode or state.bankFarm.requested))and not bag.selling then state.sellRequested=false;state.bankFarmSellPending=false end
  stopMotion(false,'airdrop');state.collision.sync();afSetStatus('Disabled')
end
local function afStart(oneShot)
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
  if state.work.lease or state.shopState.running or state.running or af.running or bank.running or bag.selling or (state.combat and state.combat.buying) then
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
  if state.work.dispatching and state.work.dispatching.canceled then return end
  state.shopState.running=true;state.shopState.token=state.shopState.token+1;local token=state.shopState.token
  state.work.launch('shop',token,function()
    local ok,reason=pcall(function()
      local initialTarget=chosen and chosen.Position or waypoint
      local distance=r and (initialTarget-r.Position).Magnitude or 0
      local deadline=os.clock()+math.max(100,distance/state.speed*3+20)
      local best=math.huge;local improved=os.clock()
      while state.shopState.running and state.shopState.token==token do
        r=player.Character and player.Character:FindFirstChild('HumanoidRootPart')
        if not characterAlive() or not r or (chosen and not chosen.Parent) then error('Shop or character unavailable') end
        local target=chosen and chosen.Position or waypoint
        local delta=target-r.Position
        local allowed,why,corrected=motion.watchTravel(r,target)
        if not allowed then error(why)end
        if corrected then deadline=os.clock()+math.max(100,delta.Magnitude/state.speed*3+20);best=math.huge;improved=os.clock()end
        if delta.Magnitude<9 then motion.arrived();break end
        if delta.Magnitude<best-2 then best=delta.Magnitude;improved=os.clock() end
        if os.clock()-improved>12 or os.clock()>deadline then error('Could not reach Gunshop') end
        state.shopState.status='Gliding to real Gunshop'
        startNoclip()
        motion.travel(r,target,state.speed,'shop')
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
      if state.shopState.token~=token or state.closed then return end
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
 local routeOK,routeWhy=bank.validateRoute()
 if not routeOK then warning(routeWhy);return false end
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
 local folder=workspace:FindFirstChild('Local');folder=folder and folder:FindFirstChild('Gizmos')
 local api=liveModule('ClientGizmos')
 if not folder or not api or type(api.Get)~='function' then return {} end
 local entries,seen={},{}
 for _,m in ipairs(folder:GetDescendants()) do
  if m:IsA('Model') and m.PrimaryPart and (m.PrimaryPart.Position-vault.position).Magnitude<=90 then
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
     local cashAllowed=kind and (kind=='main' or bankFarm.collectSmall) and (amount==nil or amount>0)
     local lootAllowed=not kind and state.naturalLootLookup[key] and passesGlobalLoot(name)
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
 local function active()return bankFarm.running and bankFarm.token==token and bank.active(bank.token) end
 local mainObserved=false
 local discoveryDeadline=os.clock()+15
 while active() and os.clock()<discoveryDeadline do
  local cash=bank.cashList(vault.position,90,true)
  if #cash>0 then mainObserved=true;break end
  bankFarm.status='Waiting for main cash pile to stream in'
  task.wait(.25)
 end
 if not mainObserved then return false,'Main cash pile unavailable; vault clearance is not confirmed',0 end
 local function pickup(entry)
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
    else backoff[entry.id]=os.clock()+8;note('WARN',why) end
    break
   end
  end
  return active(),'Canceled'
 end
 while active() and dry<3 and os.clock()-started<360 do
  if not bank.isOpen(vault.model) then return false,'Vault closed/reset during collection',collected end
  local entries=bankPickupList(vault);local candidate;local waiting=false
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
   task.wait(.5)
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
    if not active() then return false,'Canceled',collected end
    failures[candidate.id]=(failures[candidate.id] or 0)+1
    note('WARN',why)
    if failures[candidate.id]>=3 then return false,why,collected end
    backoff[candidate.id]=os.clock()+3 -- Retry later; never mark a failed target done.
   end
  end
 end
 if not active() then return false,'Canceled',collected end
 if dry<3 then return false,'Collection time limit; remaining targets not marked complete',collected end
 return true,'Eligible pickups cleared',collected
end

function bankFarm.stop()
  bankFarm.autoMode=false;bankFarm.requested=false;bankFarm.resume=nil
  if bankFarm.running then bankFarm.suspend('Disabled')end
  if not af.enabled and not af.requested and not bag.selling then state.sellRequested=false;state.bankFarmSellPending=false end
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
          local breached,why=bank.breach(navigation,vault.model)
          if not breached then error(why)end
        end
      end
      if not active()then error('Canceled')end
      if not bank.isOpen(vault.model)then error('Vault state changed before entry')end
      flyPoint(vault.position+Vector3.new(0,4,0),'Resuming vault collection')
      bankFarm.phase='loot';checkpointState.phase='loot'
      local swept,why,collected=bankFarm.sweep(vault,token)
      if not active()then error('Canceled')end
      bankFarm.looted=bankFarm.looted+(collected or 0)
      if not swept then error(why)end
      bankFarm.status='Completed · eligible targets cleared'
      if bag.read()and bag.informationReady and bag.percent>=.999 then state.bankFarmSellPending=true end
    end)
    if bankFarm.token~=token then return end -- canceled generations cannot overwrite the new task's status
    bankFarm.running=false;bank.running=false
    bankFarm.requested=false;bankFarm.lastRunOK=ok;bankFarm.lastFinished=os.time()
    bankFarm.retryDelay=bankFarm.retryDelayFor(ok,reason)
    bankFarm.lastAttemptedCycle[cycle]=os.time()
    if ok then bankFarm.resume=nil
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
      else af.seen[crate]=true;af.retryAt[crate]=os.clock()+30 end
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
  if bankFarm.running then bankFarm.suspend(reason)
  elseif af.running then af.suspend(reason)end
end
-- Reuse existing tutorial/quest/shop implementations, but start only after the previous worker finalized.
do
  local tutorial=bank.start;local quest=startQuest;local shop=openGunshop
  bank.start=function()state.work.request('Bank tutorial',tutorial)end
  startQuest=function()state.work.request('Ghost quest',quest)end
  openGunshop=function()state.work.request('Gunshop',shop)end
end
state.work.lastScan=0
function state.work.tick()
  if state.closed then return end
  local lease=state.work.lease
  local drop
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
    if lease.owner=='bank'and bankFarm.running and (drop or sweep)then state.work.interruptFarm('Airdrop priority')end
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
  if af.enabled then af.status='Waiting · no eligible airdrop'end
  if bankFarm.autoMode or bankFarm.requested then
    local observed=detectVault()
    if observed and bankFarm.selected[observed.name]then
      local base=tostring(observed.id)..':'..observed.name
      local status=bank.vaultState(observed.model)
      if status=='UNKNOWN'or status=='OPENING'then bankFarm.status='Waiting · vault '..status:lower();return end
      if bankFarm.cycleBase~=base or bankFarm.wasOpen==true and status=='CLOSED'then
        bankFarm.cycleSerial=(bankFarm.cycleSerial or 0)+1;bankFarm.cycleBase=base;bankFarm.resume=nil
      end
      bankFarm.wasOpen=status=='OPEN'
      local cycle=base..':'..tostring(bankFarm.cycleSerial or 0)
      if bankFarm.resume and bankFarm.resume.suspended or bankFarm.requested or os.time()-(bankFarm.lastAttemptedCycle[cycle]or 0)>=(bankFarm.retryDelay or 1200)then
        bankFarm.run(observed,cycle)
      else bankFarm.status='Waiting · next vault cycle'end
    else bankFarm.status='Waiting · selected vault not available'end
  end
end
-- A single modest-rate scheduler; observers and bag reads do not depend on the UI being visible.
task.spawn(function()
  local nextBag,nextBank,nextTracker=0,0,0
  while not state.closed do
    local ok,err=pcall(function()
      local now=os.clock()
      if now>=nextBag then nextBag=now+2;bag.tick();state.quest.refreshKey()end
      if now>=nextBank then nextBank=now+4;bank.check();observeVault()end
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
local C={base=Color3.fromRGB(17,19,24),nav=Color3.fromRGB(20,23,29),card=Color3.fromRGB(25,28,35),raised=Color3.fromRGB(34,38,48),line=Color3.fromRGB(48,54,66),red=Color3.fromRGB(217,54,80),soft=Color3.fromRGB(65,28,40),white=Color3.fromRGB(242,244,248),muted=Color3.fromRGB(162,170,186),dim=Color3.fromRGB(129,139,158),green=Color3.fromRGB(101,196,154),pink=Color3.fromRGB(236,75,100),amber=Color3.fromRGB(227,181,103)}
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
  local base=accent and C.red or C.raised
  local button=rounded(mk('TextButton',parent,{BackgroundColor3=base,BorderSizePixel=0,Text=label,TextColor3=C.white,Font=Enum.Font.GothamMedium,TextSize=12,AutoButtonColor=false,Size=UDim2.fromOffset(width or 110,height or 30)}),6)
  local symbol=({['−']='minimize',['⟳']='refresh',['×']='close'})[label]
  if symbol then
    button.Text='';button.Name=symbol..'Button'
    local icon=drawIcon(button,symbol,C.white,17);icon.AnchorPoint=Vector2.new(.5,.5);icon.Position=UDim2.fromScale(.5,.5)
  elseif label:find('▾',1,true)then textIcon(button,'chevron')
  elseif label:find('✓',1,true)then textIcon(button,'check')end
  button:SetAttribute('Accent',accent==true)
  local function currentColor()return button:GetAttribute('Accent') and C.red or C.raised end
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
  tween(button,{BackgroundColor3=on and C.red or C.raised},.15)
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
    tween(button,{BackgroundColor3=disabled and C.line or active and C.red or C.raised},.16)
    tween(knob,{Position=UDim2.fromOffset(active and 24 or 4,4),BackgroundColor3=disabled and C.dim or active and C.white or C.muted},.16)
  end
  connect(button.Activated:Connect(function()
    if locked and locked()then sync();return end
    local ok,err=pcall(set,not get())
    if not ok then warning(tostring(err))end
    sync()
  end))
  sync();return sync
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
      value.Text=tostring(math.floor(number+.5))..(unit or '')
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
local function dropdown(anchor,options,get,set,multiple,title)
  local screen=state.gui
  local backdrop=mk('TextButton',screen,{Name='MenuDismiss',Visible=false,Size=UDim2.fromScale(1,1),Text='',BackgroundTransparency=1,AutoButtonColor=false,ZIndex=90})
  local panel=rounded(mk('CanvasGroup',screen,{Name='Dropdown',Visible=false,Size=UDim2.fromOffset(244,270),BackgroundColor3=C.card,BorderSizePixel=0,GroupTransparency=1,ZIndex=91}),9)
  stroke(panel,C.line);pad(panel,10,10,10,10);stack(panel,7)
  txt(panel,title or 'Select',21,12,C.white,true)
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
    anchor.Text=multiple and tostring(count)..' selected  ▾'or tostring(selection)..'  ▾'
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
    local size=anchor.AbsoluteSize;local position=anchor.AbsolutePosition
    local width=math.max(180,math.min(260,view.X-20));local height=math.min(294,view.Y-20)
    panel.Size=UDim2.fromOffset(width,height);list.Size=UDim2.new(1,0,0,math.max(60,height-88))
    local below=position.Y+size.Y+6
    local y=below+height<=view.Y-10 and below or math.max(10,position.Y-height-6)
    panel.Position=UDim2.fromOffset(math.clamp(position.X+size.X-width,10,math.max(10,view.X-width-10)),y)
  end
  connect(anchor.Activated:Connect(function()
    if ui.menu==menu then closeMenu();return end
    closeMenu();ui.menu=menu;update();place();backdrop.Visible=true;panel.Visible=true
    panel.GroupTransparency=1;tween(panel,{GroupTransparency=0},.16)
  end))
  connect(backdrop.Activated:Connect(closeMenu))
  connect(search:GetPropertyChangedSignal('Text'):Connect(update))
  connect(anchor:GetPropertyChangedSignal('AbsolutePosition'):Connect(function()if ui.menu==menu then place()end end))
  connect(anchor:GetPropertyChangedSignal('AbsoluteSize'):Connect(function()if ui.menu==menu then place()end end))
  update();return update
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
  local noteLabel=txt(shell,'WANTED · v28',32,11,C.dim);noteLabel.Position=UDim2.fromOffset(0,185);noteLabel.TextWrapped=true
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
        noteLabel.Text=boot.ready and 'WANTED · v28'or (#boot.missing>0 and 'Waiting for '..table.concat(boot.missing,', ')or boot.status)
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

local function buildWorkspace(firstBoot)
  if state.closed then return end
  ui={animations=setmetatable({},{__mode='k'}),connections={},scopes={}}
  local syncControls={}
  local function sync(fn)table.insert(syncControls,fn)end
  local screen=mk('ScreenGui',player:WaitForChild('PlayerGui'),{Name='REDLINEv28UI',ResetOnSpawn=false,IgnoreGuiInset=true,ZIndexBehavior=Enum.ZIndexBehavior.Sibling,DisplayOrder=40})
  state.gui=screen
  connect(UserInputService.InputBegan:Connect(function(event)if event.KeyCode==Enum.KeyCode.Escape then closeMenu()end end))
  local group=mk('CanvasGroup',screen,{Name='Window',AnchorPoint=Vector2.new(.5,.5),Position=state.windowPosition or UDim2.fromScale(.5,.5),Size=UDim2.fromOffset(950,640),BackgroundTransparency=1,GroupTransparency=0})
  local scale=mk('UIScale',group,{Scale=1})
  local root=rounded(mk('Frame',group,{Name='Hub',Size=UDim2.fromScale(1,1),BackgroundColor3=C.base,BorderSizePixel=0,ClipsDescendants=true}),13)
  stroke(root,C.line)
  if firstBoot then startup(screen,group)end
  local header=mk('Frame',root,{Name='Header',Size=UDim2.new(1,0,0,59),BackgroundTransparency=1,Active=true})
  mk('Frame',header,{Position=UDim2.new(0,0,1,-1),Size=UDim2.new(1,0,0,1),BackgroundColor3=C.line,BorderSizePixel=0})
  rounded(mk('Frame',header,{Position=UDim2.fromOffset(19,14),Size=UDim2.fromOffset(3,31),BackgroundColor3=Color3.fromRGB(192,67,94),BorderSizePixel=0}),2)
  txt(header,'REDLINE',25,19,C.white,true).Position=UDim2.fromOffset(33,10)
  local by=txt(header,'by rahamidali',14,8,C.pink,true);by.Position=UDim2.fromOffset(34,34);by.Size=UDim2.fromOffset(150,14)
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
  local online=txt(profile,'Session active',17,9,C.green);online.Position=UDim2.fromOffset(17,60);online.Size=UDim2.new(1,-21,0,17)
  drawIcon(profile,'dot',C.green,14).Position=UDim2.fromOffset(1,61)
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
    closeMenu()
    if not pages[name] then name='Home' end
    for key,p in pairs(pages)do
      if p.Visible then state.uiScroll[key]=p.CanvasPosition end
      p.Visible=key==name
    end
    for key,b in pairs(navigation)do
      tween(b,{BackgroundColor3=key==name and C.soft or C.nav,TextColor3=key==name and C.white or C.muted},.18)
      navFrames[key].Visible=key==name
      local caption=b:FindFirstChild('NavigationLabel');if caption then tween(caption,{TextColor3=key==name and C.white or C.muted},.18)end
    end
    if state.selectedPage~=name then
      pages[name].Position=UDim2.fromOffset(0,5);tween(pages[name],{Position=UDim2.fromOffset(0,0)},.12)
    end
    state.selectedPage=name
  end
  local icons={'home','events','combat','farm','settings'}
  for index,name in ipairs({'Home','Events','Combat','Auto Farm','Settings'})do
    local button=rounded(mk('TextButton',sidebar,{Position=UDim2.fromOffset(9,39+(index-1)*40),Size=UDim2.new(1,-18,0,36),BackgroundColor3=C.nav,BorderSizePixel=0,Text='      '..name,Font=Enum.Font.GothamMedium,TextSize=12,TextColor3=C.muted,TextXAlignment=Enum.TextXAlignment.Left,AutoButtonColor=false}),7)
    local icon=drawIcon(button,icons[index],C.muted,18);icon.Name='NavigationIcon';icon.Position=UDim2.new(0,10,.5,-9)
    local caption=txt(button,name,36,13,C.muted);caption.Name='NavigationLabel';caption.Position=UDim2.fromOffset(36,0);caption.Size=UDim2.new(1,-40,1,0)
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
    closeMenu()
    transition=transition+1;local token=transition
    state.windowPosition=group.Position
    state.minimized=true
    tween(group,{GroupTransparency=1},.14)
    task.delay(.15,function()if group.Parent and transition==token then group.Visible=false;mini.Visible=true end end)
  end
  local function restore()
    closeMenu()
    transition=transition+1;state.minimized=false;mini.Visible=false;group.Visible=true
    scale.Scale=1;tween(group,{GroupTransparency=0},.16)
  end
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
      if active==event then active=nil;if isMini and not moved then restore()end end
    end))
  end
  local dragArea=mk('Frame',header,{Name='DragHandle',Size=UDim2.new(1,-125,1,0),BackgroundTransparency=1,Active=true})
  drag(dragArea,group,'windowPosition',false);drag(mini,mini,'miniPosition',true)
  local minimizeButton=btn(header,'−',minimize,27,27);minimizeButton.Position=UDim2.new(1,-112,0,16)
  local refreshButton=btn(header,'⟳',function()if state.refresh then state.refresh()end end,27,27);refreshButton.Position=UDim2.new(1,-77,0,16)
  local closeButton=btn(header,'×',function()if state.close then state.close(false)end end,27,27);closeButton.Position=UDim2.new(1,-42,0,16);closeButton.TextColor3=C.pink
  tooltip(minimizeButton,'Minimize · active tasks keep running')
  tooltip(refreshButton,'Refresh this view without restarting tasks')
  tooltip(closeButton,'Unload REDLINE and restore owned character settings')
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
  textIcon(bankButton,'check');textIcon(bankLabel,'check')
  local bankStopLine=line(starter,'Tutorial controls');action(bankStopLine,'Stop',bank.stop,75)
  local keyLine=line(starter,'Skeleton Key')
  local keyState=txt(keyLine,'Checking',28,10,C.pink);keyState.Size=UDim2.fromOffset(125,28);keyState.Position=UDim2.new(1,-125,0,0);keyState.TextXAlignment=Enum.TextXAlignment.Right
  local tutorialStatus=txt(starter,'Checking account state',40,12,C.dim);tutorialStatus.TextWrapped=true;tutorialStatus.TextTruncate=Enum.TextTruncate.None
  local inv=card(home,'Account inventory')
  local inventory=txt(inv,'Reading current tools...',21,10,C.muted)
  local bagLabel=txt(inv,'Bag · Reading',20,10,C.muted)
  local bagBar=progress(inv)
  local activityLine=line(inv,'Current action')
  local activity=txt(activityLine,'Idle',28,10,C.green);activity.Position=UDim2.new(1,-160,0,0);activity.Size=UDim2.fromOffset(160,28);activity.TextXAlignment=Enum.TextXAlignment.Right
  local quick=card(home,'Quick Access')
  local shopLine=line(quick,'In-game shops');action(shopLine,'Gunshop',openGunshop,95)
  local captureLine=line(quick,'Tutorial route')
  local routeToggle=action(captureLine,'Waypoints ▾',function()end,115)
  local routeEditor=card(home,'Saved Tutorial Route','Recorded coordinates · no automatic detours');routeEditor.Visible=false
  local routeStep=txt(routeEditor,'',20,11,C.muted)
  local routeActions=row(routeEditor,27)
  btn(routeActions,'Previous',function()bank.index=math.max(1,bank.index-1)end,82)
  btn(routeActions,'Capture',bank.capture,88).Position=UDim2.fromOffset(89,0)
  btn(routeActions,'Next',function()bank.index=math.min(#bank.steps,bank.index+1)end,65).Position=UDim2.fromOffset(184,0)
  connect(routeToggle.Activated:Connect(function()expand(routeEditor,not routeEditor.Visible)end))
  local exportLine=line(routeEditor,'Saved route data');action(exportLine,'Export',bank.export,88)
  local recheckLine=line(quick,'Account status');action(recheckLine,'Recheck',function()bank.check();syncExisting()end,95)
  -- Events
  local mission=card(pages.Events,'Speaker For The Dead')
  local questStatus=txt(mission,'Not started',20,11,C.pink);textIcon(questStatus,'check')
  local ghosts=txt(mission,'Confirmed ghosts · 0 / 9',22,12,C.muted)
  local questDetail=txt(mission,'',42,11,C.dim);questDetail.TextWrapped=true;questDetail.TextTruncate=Enum.TextTruncate.None
  local ghostBar=progress(mission)
  txt(mission,'Accept mission  >  Amulet  >  Ghosts  >  Return & hand in',20,10,C.dim)
  local questLine=line(mission,'Current account only');local questButton=action(questLine,'Start quest',function()if not state.quest.workflowComplete then startQuest()end end,105,true)
  textIcon(questButton,'check')
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
  local search=input(protection,'Search usernames or display names...')
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
    for _,connection in ipairs(ui.scopes.roster or {})do pcall(function()connection:Disconnect()end)end
    ui.scopes.roster={};ui.scope='roster'
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
    whitelist.CanvasPosition=whiteScroll;selectedList.CanvasPosition=targetScroll;ui.scope=nil
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
  local vaultToggle=action(vaultLine,'Select vaults ▾',function()end,140)
  dropdown(vaultToggle,{'Regular','Silver','Gold','Sapphire','Ruby','Emerald','Amethyst','Diamond'},function()return bankFarm.selected end,function(name,value)bankFarm.selected[name]=value;saveSettings()end,true,'Included vaults')
  local optionsLine=line(bankCard,'Cash and valuables')
  local optionsToggle=action(optionsLine,'Loot options ▾',function()end,140)
  local vaultPanel=card(farm,'Bank loot options');vaultPanel.Visible=false

  sync(toggle(vaultPanel,'Collect small cash piles',function()return bankFarm.collectSmall end,function(v)bankFarm.collectSmall=v;saveSettings()end))
  sync(toggle(vaultPanel,'Skip gold valuables',function()return bankFarm.skipGold end,function(v)bankFarm.skipGold=v;saveSettings()end))
  sync(toggle(vaultPanel,'Skip silver valuables',function()return bankFarm.skipSilver end,function(v)bankFarm.skipSilver=v;saveSettings()end))
  connect(optionsToggle.Activated:Connect(function()expand(vaultPanel,not vaultPanel.Visible)end))
  local airdropCard=card(farm,'Airdrops')
  local airTimer=txt(airdropCard,'Next airdrop · Syncing',18,10,C.pink)
  local airStats=txt(airdropCard,'Opened 0 · Golden Barretts 0',18,10,C.dim)
  local airStatus=txt(airdropCard,'Idle',22,11,C.muted)
  local airLine=line(airdropCard,'Continuous farming')
  local airToggle=action(airLine,'Start',function()if af.enabled or af.requested then afStop()else afStart(false)end end,87,true)
  -- Loot rules get a dedicated workspace, not another long card under farm controls.
  local filter=card(farm,'Loot rules')
  filter:FindFirstChildOfClass('TextLabel').Visible=false
  filter:FindFirstChildOfClass('UIListLayout').Padding=UDim.new(0,7)
  filter.Name='LootRules';filter.LayoutOrder=4
  bagCard.LayoutOrder=30;bankCard.LayoutOrder=10;vaultPanel.LayoutOrder=11;airdropCard.LayoutOrder=20
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
  local rarityGrid=row(simplePanel,104)
  local rarityLayout=mk('UIGridLayout',rarityGrid,{CellSize=UDim2.new(1/3,-6,0,46),CellPadding=UDim2.fromOffset(8,8),SortOrder=Enum.SortOrder.LayoutOrder})
  local rarityButtons={}
  local repaintFilter
  for index,name in ipairs({'Common','Uncommon','Rare','Epic','Legendary','Mythic'})do
    local b=btn(rarityGrid,'',function()state.globalLoot.simple[name]=not state.globalLoot.simple[name];saveSettings();repaintFilter()end,100,46)
    b.LayoutOrder=index
    local mark=rounded(mk('Frame',b,{Position=UDim2.fromOffset(10,13),Size=UDim2.fromOffset(3,20),BorderSizePixel=0,BackgroundColor3=rarityColors[name]}),2)
    local label=txt(b,name,19,12,rarityColors[name],true);label.Position=UDim2.fromOffset(22,5);label.Size=UDim2.new(1,-26,0,19)
    local status=txt(b,'',15,10,C.muted);status.Position=UDim2.fromOffset(22,26);status.Size=UDim2.new(1,-26,0,15)
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
  local savedFilterScroll=view.scroll or Vector2.zero
  local lootRows=scroll(advancedPanel,240);lootRows.Name='LootResults'
  local names,canonicalSeen={},{}
  for _,name in ipairs(state.naturalLootCatalog)do
    local key=baseLootName(name)
    if not canonicalSeen[key] then canonicalSeen[key]=true;table.insert(names,name) end
  end
  table.sort(names,function(a,b)local pa,pb=state.globalLoot.priority(a),state.globalLoot.priority(b);if pa~=pb then return pa<pb end;return a:lower()<b:lower()end)
  local lootFrames={}
  for index,name in ipairs(names)do
    local frame=row(lootRows,62);frame.Name='Item_'..name
    frame.BackgroundTransparency=index%2==0 and .7 or 1;frame.BackgroundColor3=C.raised
    local key=baseLootName(name)
    local label=txt(frame,name,21,12,key=='golden barrett m82' and C.pink or C.white,true);label.Position=UDim2.fromOffset(8,6);label.Size=UDim2.new(1,-240,0,21)
    local tier=state.globalLoot.rarity(name)
    local badge=rounded(mk('TextLabel',frame,{Position=UDim2.fromOffset(8,32),Size=UDim2.fromOffset(85,19),Text=tier,Font=Enum.Font.GothamMedium,TextSize=10,TextColor3=rarityColors[tier] or C.dim,BorderSizePixel=0,BackgroundColor3=C.raised}),4)
    local inherited=txt(frame,'',18,10,C.dim);inherited.Position=UDim2.fromOffset(100,32);inherited.Size=UDim2.new(1,-330,0,18)
    local control=rounded(mk('Frame',frame,{AnchorPoint=Vector2.new(1,.5),Position=UDim2.new(1,-7,.5,0),Size=UDim2.fromOffset(210,30),BackgroundColor3=C.base,BorderSizePixel=0}),6)
    local choices={}
    for n,option in ipairs({'Default','Collect','Skip'})do
      local b=btn(control,option,function()
        state.globalLoot.overrides[key]=option~='Default' and option:lower() or nil
        saveSettings();repaintFilter()
      end,68,26)
      b.Position=UDim2.fromOffset(2+(n-1)*69,2);b.TextSize=11;choices[option]=b
    end
    lootFrames[name]={frame=frame,label=label,badge=badge,inherited=inherited,control=control,choices=choices,key=key}
  end
  local empty=txt(lootRows,'No matching items. Clear search or choose All.',76,12,C.muted);empty.Name='NoResults';empty.TextWrapped=true
  local resetRow=row(advancedPanel,30)
  local resetOverrides=btn(resetRow,'Clear item overrides',function()state.globalLoot.overrides={};saveSettings();repaintFilter()end,164,30)
  local resetVisible=btn(resetRow,'Reset shown',function()for _,entry in pairs(lootFrames)do if entry.frame.Visible then state.globalLoot.overrides[entry.key]=nil end end;saveSettings();repaintFilter()end,106,30);resetVisible.Position=UDim2.fromOffset(172,0)
  tooltip(resetVisible,'Remove only the explicit overrides for the items currently shown')
  local unknown=txt(filter,'Unclassified items use saved legacy rules. Quest items and cash have separate objective controls.',38,11,C.dim);unknown.TextWrapped=true;unknown.TextTruncate=Enum.TextTruncate.None
  repaintFilter=function()
    local tiers,overrides={},0
    for _,name in ipairs({'Common','Uncommon','Rare','Epic','Legendary','Mythic'})do
      local on=state.globalLoot.simple[name];if on then table.insert(tiers,name)end
      local record=rarityButtons[name];accent(record.button,on);record.status.Text=on and 'Included' or 'Excluded';record.status.TextColor3=on and C.white or C.dim
    end
    for _ in pairs(state.globalLoot.overrides)do overrides=overrides+1 end
    filterSummary.Text=#tiers..' of 6 rarities  ·  '..overrides..' item overrides'
    filterHint.Text=#tiers==6 and 'All rarities included. Golden Barrett has first priority when eligible.' or (#tiers==0 and 'Rarities excluded; explicit Collect overrides still apply.' or 'Included: '..table.concat(tiers,', '))
    simplePanel.Visible=view.mode=='simple';advancedPanel.Visible=view.mode=='advanced'
    accent(simple,view.mode=='simple');accent(advanced,view.mode=='advanced')
    for category,b in pairs(categoryButtons)do accent(b,view.category==category)end
    local query=view.query:lower():gsub('[%s%p]','')
    local count=0
    for name,entry in pairs(lootFrames)do
      local visible=(view.category=='All' or state.globalLoot.category(name)==view.category) and (view.rarity=='All rarities' or state.globalLoot.rarity(name)==view.rarity) and (query=='' or name:lower():gsub('[%s%p]',''):find(query,1,true)~=nil)
      entry.frame.Visible=visible;if visible then count=count+1 end
      local override=state.globalLoot.overrides[entry.key]
      local chosen=override=='collect' and 'Collect' or override=='skip' and 'Skip' or 'Default'
      for option,b in pairs(entry.choices)do
        accent(b,option==chosen)
        if option==chosen and option=='Skip' then b.TextColor3=C.pink else b.TextColor3=C.white end
      end
      local origin=state.globalLoot.raritySource(name)
      entry.inherited.Text=entry.key=='golden barrett m82' and (override=='skip' and 'Skipped' or '#1 eligible priority') or override and 'Item override' or (passesGlobalLoot(name) and 'Inherited · collect' or 'Inherited · skip')
      entry.badge.Text=state.globalLoot.rarity(name)..(origin=='Custom' and '*' or '')
      entry.inherited.Text=entry.inherited.Text..' · '..origin
    end
    filterHint.Visible=view.mode=='simple';unknown.Visible=view.mode=='simple'
    empty.Visible=count==0;resultsLabel.Text=count..' items  ·  Default inherits your rules'
    resetOverrides.Active=overrides>0;resetOverrides.TextTransparency=overrides>0 and 0 or .5
  end
  connect(lootSearch:GetPropertyChangedSignal('Text'):Connect(function()view.query=lootSearch.Text;repaintFilter()end))
  connect(lootRows:GetPropertyChangedSignal('CanvasPosition'):Connect(function()view.scroll=lootRows.CanvasPosition end))
  connect(simple.Activated:Connect(function()view.mode='simple';repaintFilter()end))
  connect(advanced.Activated:Connect(function()view.mode='advanced';repaintFilter()end))
  repaintFilter()
  local farmNav=row(farm,34);farmNav.LayoutOrder=3
  local overview=btn(farmNav,'Farm overview',function()end,130,32,true)
  local rules=btn(farmNav,'Loot rules',function()end,116,32);rules.Position=UDim2.fromOffset(138,0)
  state.farmView=state.farmView or 'overview'
  local function switchFarm(name,preserveScroll)
    state.farmView=name
    farm:FindFirstChild('PageTitle').Visible=name~='rules'
    farm:FindFirstChild('PageSubtitle').Visible=name~='rules'
    filter.Visible=name=='rules'
    bagCard.Visible=name=='overview';bankCard.Visible=name=='overview';airdropCard.Visible=name=='overview'
    vaultPanel.Visible=false
    accent(overview,name=='overview');accent(rules,name=='rules')
    if not preserveScroll then farm.CanvasPosition=Vector2.zero end
  end
  connect(overview.Activated:Connect(function()switchFarm('overview')end))
  connect(rules.Activated:Connect(function()switchFarm('rules')end))
  switchFarm(state.farmView,true)
  task.defer(function()if lootRows.Parent then lootRows.CanvasPosition=savedFilterScroll end end)
  local function resizeFilter(compact,height)
    top.Size=UDim2.new(1,0,0,compact and 60 or 32)
    filterSummary.AnchorPoint=compact and Vector2.zero or Vector2.new(1,0)
    filterSummary.Position=compact and UDim2.fromOffset(0,32) or UDim2.fromScale(1,0)
    filterSummary.Size=compact and UDim2.new(1,0,0,24) or UDim2.fromOffset(290,28)
    filterSummary.TextXAlignment=compact and Enum.TextXAlignment.Left or Enum.TextXAlignment.Right
    rarityLayout.CellSize=UDim2.new(compact and .5 or 1/3,compact and -4 or -6,0,46)
    rarityGrid.Size=UDim2.new(1,0,0,compact and 154 or 104)
    categories.Size=UDim2.new(1,0,0,34)
    lootRows.Size=UDim2.new(1,0,0,math.max(140,math.min(compact and 300 or 270,height-(compact and 512 or 380))))
    for _,entry in pairs(lootFrames)do
      entry.frame.Size=UDim2.new(1,0,0,compact and 88 or 62)
      entry.label.Size=UDim2.new(1,compact and -16 or -240,0,21)
      entry.badge.Position=UDim2.fromOffset(8,compact and 28 or 32)
      entry.inherited.Position=UDim2.fromOffset(100,compact and 28 or 32)
      entry.inherited.Size=UDim2.new(1,compact and -108 or -330,0,18)
      entry.control.AnchorPoint=compact and Vector2.zero or Vector2.new(1,.5)
      entry.control.Position=compact and UDim2.fromOffset(8,52) or UDim2.new(1,-7,.5,0)
    end
  end

  -- Settings
  local movement=card(pages.Settings,'Movement')
  sync(slider(movement,'Glide speed',75,90,5,function()return state.speed end,function(v)state.speed=v;saveSettings()end,' studs/s'))
  sync(toggle(movement,'Noclip',function()return state.collision.effective()end,function(v)
    local _,accepted=state.setNoclip(v);if accepted then saveSettings()end
  end,state.collision.automatic))
  local collisionStatus=txt(movement,'',34,11,C.dim);collisionStatus.TextWrapped=true
  local ownerStatus=txt(movement,'',20,11,C.muted)
  local diagnose=card(pages.Settings,'Diagnostics')
  local trackerStatus=txt(diagnose,'Tracker · Checking',19,10,C.muted)
  local logBox=order(rounded(mk('TextBox',diagnose,{Size=UDim2.new(1,0,0,110),BackgroundColor3=C.base,BorderSizePixel=0,Text='',TextColor3=C.muted,Font=Enum.Font.Code,TextSize=10,TextEditable=false,MultiLine=true,TextWrapped=true,ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top}),5));pad(logBox,7,7,7,7)
  local logLine=line(diagnose,'Errors and current module state');action(logLine,'Copy log',copyDiagnostics,95)
  local about=card(pages.Settings,'REDLINE v28.4');txt(about,'RahamidAli · WANTED',18,10,C.dim)
  local fovRing=rounded(mk('Frame',screen,{Name='CombatFOV',BackgroundTransparency=1,AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(.5,.5),Size=UDim2.fromOffset(combat.fovPixels*2,combat.fovPixels*2),Visible=false}),999)
  local fovStroke=stroke(fovRing,C.red)
  -- Free placement survives refresh and viewport changes. Recovery never clamps a drag.
  local recover=btn(screen,'Recover UI',function()
    group.Position=UDim2.fromScale(.5,.5);state.windowPosition=group.Position
    mini.Position=UDim2.new(0,27,1,-63);state.miniPosition=mini.Position
    restore()
  end,112,30)
  recover.Name='RecoverUI';recover.AnchorPoint=Vector2.new(.5,0);recover.Position=UDim2.new(.5,0,0,12);recover.ZIndex=80;recover.Visible=false
  local function recovery(view)
    local target=state.minimized and mini or group
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
  local previousView=nil
  local function resize()
    local view=workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1100,720)
    recovery(view)
    if view==previousView then return end
    previousView=view
    local width,height=math.min(950,view.X-18),math.min(640,view.Y-18)
    local compact=width<680
    if compact then height=math.min(840,view.Y-18)end
    local side=compact and 0 or 160
    group.Size=UDim2.fromOffset(width,height)
    local statColumns=width<410 and 2 or 3
    statGrid.CellSize=UDim2.new(1/statColumns,-(statColumns-1)*9/statColumns,0,77)
    stats.Size=UDim2.new(1,0,0,math.ceil(3/statColumns)*86-9)
    sidebar.Position=compact and UDim2.new(0,0,1,-72) or UDim2.fromOffset(0,59)
    sidebar.Size=compact and UDim2.new(1,0,0,49) or UDim2.new(0,side,1,-82)
    navlabel.Visible=not compact;profile.Visible=not compact
    for index,name in ipairs({'Home','Events','Combat','Auto Farm','Settings'})do
      local button=navigation[name]
      button.Text=compact and name or ''
      button.TextSize=compact and 11 or 13
      button.TextXAlignment=compact and Enum.TextXAlignment.Center or Enum.TextXAlignment.Left
      button.Position=compact and UDim2.new((index-1)/5,2,0,6) or UDim2.fromOffset(9,39+(index-1)*44)
      button.Size=compact and UDim2.new(.2,-4,0,36) or UDim2.new(1,-18,0,38)
      for _,child in ipairs(button:GetChildren())do if child.Name=='NavigationIcon'or child.Name=='NavigationLabel'then child.Visible=not compact end end
    end
    pagesRoot.Position=UDim2.fromOffset(side,59);pagesRoot.Size=UDim2.new(1,-side,1,compact and -131 or -82)
    resizeFilter(compact,height)
    headerMeta.Visible=width>=600
    who.Visible=width>=600;user.Visible=width>=600
    for _,p in pairs(pages)do
      local padding=p:FindFirstChildOfClass('UIPadding')
      padding.PaddingLeft=UDim.new(0,width<700 and 11 or 23);padding.PaddingRight=padding.PaddingLeft
    end
    for _,value in ipairs(statValues)do value.TextSize=width<600 and 12 or 16 end
    notice.Size=UDim2.fromOffset(math.min(380,view.X-16),108)
    recovery(view)
  end
  resize()
  local nextTick,nextBag,nextBank,nextSync,nextLog=0,0,0,0,0
  local seenCrates={}
  connect(RunService.Heartbeat:Connect(function()
    if state.closed or not screen.Parent or os.clock()<nextTick then return end
    local now=os.clock();nextTick=now+.25
    if now>=nextSync then nextSync=now+1;refreshQuestEvidence();state.quest.refreshKey()end
    resize()
    fovRing.Visible=combat.silent;fovRing.Size=UDim2.fromOffset(combat.fovPixels*2,combat.fovPixels*2)
    fovStroke.Color=Color3.fromRGB(table.unpack(combat.fovColor));fovStroke.Transparency=1-combat.fovAlpha
    if state.minimized then return end

    for _,syncControl in ipairs(syncControls)do syncControl()end
    statValues[2].Text=fmt(now-sessionStarted)
    local data=liveModule('ClientData')
    if data and type(data.Get)=='function'then
      local ok,amount=pcall(data.Get,'cash');if ok and type(amount)=='number'then statValues[1].Text=cash(amount)end
    end
    statValues[3].Text=state.keyInInventory and 'Owned'or 'Not found';statValues[3].TextColor3=C.pink
    keyState.Text=state.keyInInventory and 'In inventory'or 'Not observed'
    bankButton.Text=bank.done and 'Completed ✓'or bank.running and 'Running...'or 'Start tutorial';bankButton.Active=not bank.done and not bank.running;bankButton.TextTransparency=bank.done and .4 or 0
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
    questStatus.Text=state.quest.workflowComplete and 'Finished ✓'or state.running and (state.paused and 'Paused'or state.quest.stage)or state.quest.stage
    questDetail.Text=(state.quest.currentNPC~=''and state.quest.currentNPC..'  ·  'or '')..'Attempt '..state.quest.attempt..'/4  ·  Key: '..state.quest.keyState..(state.quest.lastFailure~=''and '\n'..state.quest.lastFailure or '')
    questButton.Text=state.quest.workflowComplete and 'Finished ✓'or state.quest.handInReady and 'Turn in'or state.serverQuestComplete and 'Pick up key'or state.confirmedGhost>0 and 'Resume quest'or 'Start quest'
    questButton.Active=not state.quest.workflowComplete;questButton.Selectable=questButton.Active
    ghosts.Text=state.quest.handInReady and 'Ghosts complete · Return to Ghost (0/1)'or ('Confirmed ghosts · '..state.confirmedGhost..' / '..state.quest.required);ghostBar.Size=UDim2.fromScale(math.clamp(state.confirmedGhost/state.quest.required,0,1),1)
    keyInfo.Text=state.quest.workflowComplete and 'Skeleton Key pickup verified for this account.'or state.serverQuestComplete and 'Quest handed in · Skeleton Key pickup pending.'or 'Key possession is checked separately from quest progress.'
    aimStatus.Text=combat.silent and combat.silentStatus or 'Off'
    spasStatus.Text=combat.spasStatus
    swatch.BackgroundColor3=Color3.fromRGB(table.unpack(pickerTarget=='FOV'and combat.fovColor or combat.hitColor))
    bagInfo.Text=bag.informationReady and string.format('%.1f / %.1f kg  ·  %s',bag.weight,bag.capacity,cash(bag.value))or 'Bag data unavailable'
    local entries={};for index,item in ipairs(bag.items or {})do if index>4 then break end;table.insert(entries,item.name..' x'..item.count)end
    bagItems.Text=#entries>0 and table.concat(entries,', ')or 'Empty'
    seller.Text='Seller · '..tostring(bag.seller)..'  ·  '..bag.status
    bankStatus.Text=bankFarm.currentVault..' vault · '..bankFarm.status
    bankTimer.Text=bankFarm.lastObserved>0 and ('Bank cycle · '..fmt(math.max(0,1200-(os.time()-bankFarm.lastObserved)))..' estimated')or 'Bank cycle · Waiting for observation'
    bankToggle.Text=(bankFarm.autoMode or bankFarm.running)and 'Stop'or 'Start'
    airToggle.Text=(af.enabled or af.requested)and 'Stop'or 'Start';airStatus.Text=af.status;airStats.Text='Opened '..af.openCount..' · Golden Barretts '..af.goldenCount
    local globals=liveModule('Globals');local air=globals and globals.AIRDROPS
    if air and tonumber(air.PERIOD)and tonumber(air.OFFSET)then
      local remaining=(air.PERIOD-((DateTime.now().UnixTimestamp-air.OFFSET)%air.PERIOD))%air.PERIOD
      airTimer.Text='Next airdrop · '..fmt(remaining)..' estimated'
    else airTimer.Text='Next airdrop · Waiting for game timing'end
    fovRing.Visible=combat.silent;fovRing.Size=UDim2.fromOffset(combat.fovPixels*2,combat.fovPixels*2);fovStroke.Color=Color3.fromRGB(table.unpack(combat.fovColor));fovStroke.Transparency=1-combat.fovAlpha
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
    if state.closed or state.boot and not state.boot.complete then return end
    closeMenu()
    for name,p in pairs(pages)do state.uiScroll[name]=p.CanvasPosition end
    state.windowPosition=group.Position;state.miniPosition=mini.Position
    saveSettings()
    -- Rebuild only the view. Active navigation and its tokens are untouched.
    clearUI()

    screen:Destroy();buildWorkspace(false)
  end
  state.close=function(immediate)
    if state.closed then return end
    if bankFarm.running or bankFarm.autoMode then bankFarm.stop()end
    bank.stop();afStop();stop();endCombat()
    if state.shop then state.shop.running=false;state.shop.token=state.shop.token+1 end
    bag.selling=false;bag.token=bag.token+1
    state.diagnostics.mark('session_closed','normal unload')
    state.closed=true;state.work.pending=nil;state.work.dispatching=nil;state.work.critical=false
    if state.camera.current then state.camera.release(state.camera.current.lease)end
    stopMotion(true);state.collision.owners={};restoreCollision()
    saveSettings()
    for _,connection in ipairs(state.connected)do pcall(function()connection:Disconnect()end)end
    closeMenu();clearUI()
    if immediate then screen:Destroy()else
      local fade=TweenService:Create(group,TweenInfo.new(.16,Enum.EasingStyle.Quad),{GroupTransparency=1});fade:Play()
      task.delay(.17,function()fade:Destroy();screen:Destroy()end)
    end
    for _,key in ipairs({'REDLINEHubV28','REDLINEHubV27','REDLINEHubV26','REDLINEHubV23','REDLINEHubV20'})do if _G[key]==state then _G[key]=nil end end
  end
  page(state.selectedPage or 'Home')
  group.Visible=not state.minimized and (not firstBoot);mini.Visible=state.minimized==true
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
    if firstBoot and isListed then report('client_seen','waiting',0,'REDLINE v28.4 launched',false)end
  end)
end
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
end
