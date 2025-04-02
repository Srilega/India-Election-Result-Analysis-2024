select 
	distinct count(const_id) 
from constituencywise_results;

select 
	count(parliament_constituency) as total_seats,
    s.state as state_name
from statewise_results sr
join states s on sr.state_id = s.state_id
group by s.state;

select
	sum(case
			when party in (
	'Bharatiya Janata Party - BJP',
	'Telugu Desam - TDP',
	'Janata Dal  (United) - JD(U)',
	'Shiv Sena - SHS',
	'AJSU Party - AJSUP',
	'Apna Dal (Soneylal) - ADAL',
	'Asom Gana Parishad - AGP',
	'Hindustani Awam Morcha (Secular) - HAMS',
	'Janasena Party - JnP',
	'Janata Dal  (Secular) - JD(S)',
	'Lok Janshakti Party(Ram Vilas) - LJPRV',
	'Nationalist Congress Party - NCP',
	'Rashtriya Lok Dal - RLD',
	'Sikkim Krantikari Morcha - SKM'
		) then won
	else 0
end) as NDA_total_seats_won
from partywise_results;

select 
	party as party_name,
    won as seats_won
from partywise_results
where party in(
'Bharatiya Janata Party - BJP',
	'Telugu Desam - TDP',
	'Janata Dal  (United) - JD(U)',
	'Shiv Sena - SHS',
	'AJSU Party - AJSUP',
	'Apna Dal (Soneylal) - ADAL',
	'Asom Gana Parishad - AGP',
	'Hindustani Awam Morcha (Secular) - HAMS',
	'Janasena Party - JnP',
	'Janata Dal  (Secular) - JD(S)',
	'Lok Janshakti Party(Ram Vilas) - LJPRV',
	'Nationalist Congress Party - NCP',
	'Rashtriya Lok Dal - RLD',
	'Sikkim Krantikari Morcha - SKM')
order by seats_won desc;

select 
	sum(case
		when party in(
                'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'

        ) then won
	else 0
    end) as total_seats_won_india
from partywise_results;


select 
	party as party_name,
    won as seats_won
from partywise_results
where party in (
'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK')
                order by seats_won desc;

-- Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER

alter table partywise_results
add party_alliance varchar(50);

update partywise_results
set party_alliance = 'I.N.D.I.A'
where party in (
'Indian National Congress - INC',
    'Aam Aadmi Party - AAAP',
    'All India Trinamool Congress - AITC',
    'Bharat Adivasi Party - BHRTADVSIP',
    'Communist Party of India  (Marxist) - CPI(M)',
    'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
    'Communist Party of India - CPI',
    'Dravida Munnetra Kazhagam - DMK',	
    'Indian Union Muslim League - IUML',
    'Jammu & Kashmir National Conference - JKN',
    'Jharkhand Mukti Morcha - JMM',
    'Kerala Congress - KEC',
    'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
    'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
    'Rashtriya Janata Dal - RJD',
    'Rashtriya Loktantrik Party - RLTP',
    'Revolutionary Socialist Party - RSP',
    'Samajwadi Party - SP',
    'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
    'Viduthalai Chiruthaigal Katchi - VCK'
);

update partywise_results
set party_alliance = 'N.D.A'
where party in(
'Bharatiya Janata Party - BJP',
    'Telugu Desam - TDP',
    'Janata Dal  (United) - JD(U)',
    'Shiv Sena - SHS',
    'AJSU Party - AJSUP',
    'Apna Dal (Soneylal) - ADAL',
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Janasena Party - JnP',
    'Janata Dal  (Secular) - JD(S)',
    'Lok Janshakti Party(Ram Vilas) - LJPRV',
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD',
    'Sikkim Krantikari Morcha - SKM'
);

update partywise_results
set party_alliance = 'others'
where party_alliance is null;

select party_alliance, sum(won) as total_won
from partywise_results
group by party_alliance
order by total_won desc;

-- Winning candidate's name, their party 
-- name, total votes, and the margin of 
-- victory for a specific state and 
-- constituency?

select 
	cr.winning_candidate,
    pr.party as party_name,
    cr.constituency_name, 
    cr.total_votes, 
    cr.margin,
    s.state
from constituencywise_results cr
inner join partywise_results pr on cr.party_id=pr.party_id
inner join statewise_results sr
on cr.parliament_constituency = sr.parliament_constituency
inner join states s on sr.state_id = s.state_id
where s.state='Tamil Nadu'
and cr.constituency_name ='THANJAVUR';

-- What is the distribution of EVM votes 
-- versus postal votes for candidates 
-- in a specific constituency?

select candidate, postal_votes, evm_votes
from constituencywise_details cd
join constituencywise_results cr
on cd.const_id = cr.const_id
where constituency_name ='AGRA';

-- which parties won the most seats in a State, and 
-- how many seats did each party win?

SELECT 
    pr.party AS party_name,
    s.state,
    COUNT(*) AS total_constituencies
FROM statewise_results sr
join states s
on sr.state_id =s.state_id
JOIN constituencywise_results cr 
    ON sr.parliament_constituency = cr.parliament_constituency
JOIN partywise_results pr 
    ON cr.party_id = pr.party_id
where s.state ='Tamil Nadu'
group by pr.party
order by total_constituencies desc;

-- What is the total number of seats 
-- won by each party alliance 
-- (NDA, I.N.D.I.A, and OTHER) in 
-- each state for the India Elections 2024

select  s.state as state_name,
		sum(case when p.party_alliance = 'I.N.D.I.A'then 1 else 0 end) as INDIA_seats,
		sum(case when p.party_alliance ='N.D.A' then 1 else 0 end) as NDA_seats,
        sum(case when p.party_alliance ='others' then 1 else 0 end) as others_seats
from partywise_results p
join constituencywise_results cr on p.party_id = cr.party_id
join statewise_results sr on cr.parliament_constituency = sr.parliament_constituency
join states s on sr.state_id =s.state_id
group by s.state;

-- Which candidate received the highest number of EVM votes 
-- in each constituency (Top 10)?
SET SESSION net_read_timeout = 300;
SET SESSION net_write_timeout = 300;
SET SESSION wait_timeout = 300;

select 
	cd.candidate,
	cd.evm_votes,
    cr.constituency_name
from constituencywise_details cd
join constituencywise_results cr
on  cd.const_id = cr.const_id
order by evm_votes desc
limit 10;

SELECT 
    cr.constituency_name,
    cd.const_id,
    cd.candidate,
    cd.evm_votes
FROM constituencywise_details cd
JOIN constituencywise_results cr ON cd.const_id = cr.const_id
JOIN (
    SELECT const_id, MAX(evm_votes) AS max_votes
    FROM constituencywise_details
    GROUP BY const_id
) max_votes_tbl 
ON cd.const_id = max_votes_tbl.const_id 
AND cd.evm_votes = max_votes_tbl.max_votes
ORDER BY cd.evm_votes DESC
LIMIT 10;

-- Which candidate won and which candidate 
-- was the runner-up in each constituency of State 
-- for the 2024 elections?

WITH RankedCandidates AS (
    SELECT 
        cd.Const_ID,
        cd.Candidate,
        cd.Party,
        cd.EVM_Votes,
        cd.Postal_Votes,
        cd.EVM_Votes + cd.Postal_Votes AS Total_Votes,
        ROW_NUMBER() OVER (PARTITION BY cd.Const_ID ORDER BY cd.EVM_Votes + cd.Postal_Votes DESC) AS VoteRank
    FROM 
        constituencywise_details cd
    JOIN 
        constituencywise_results cr ON cd.Const_ID = cr.Const_ID
    JOIN 
        statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
    JOIN 
        states s ON sr.State_ID = s.State_ID
    WHERE 
        s.State = 'Maharashtra'
)

SELECT 
    cr.Constituency_Name,
    MAX(CASE WHEN rc.VoteRank = 1 THEN rc.Candidate END) AS Winning_Candidate,
    MAX(CASE WHEN rc.VoteRank = 2 THEN rc.Candidate END) AS Runnerup_Candidate
FROM 
    RankedCandidates rc
JOIN 
    constituencywise_results cr ON rc.Const_ID = cr.Const_ID
GROUP BY 
    cr.Constituency_Name
ORDER BY 
    cr.Constituency_Name;


-- For the state of Maharashtra, what are 
-- the total number of seats, total number 
-- of candidates, total number of parties,
-- total votes (including EVM and postal), 
-- and the breakdown of EVM and postal votes?
select 
	count(distinct cr.const_id) as total_seats,
    count(distinct cd.candidate) as total_candidates,
    count(distinct p.party) as total_parties,
    sum(cd.evm_votes + cd.postal_votes) as total_votes,
    sum(cd.evm_votes) as total_evm_votes,
    sum(cd.postal_votes) as total_postal_votes
from constituencywise_results cr
join constituencywise_details cd on cr.const_id = cd.const_id
join statewise_results sr on cr.parliament_constituency= sr.parliament_constituency
join states s on sr.state_id = s.state_id
join partywise_results p on cr.party_id = p.party_id
where s.state='Maharashtra';