module UsersHelper
    
    def get_result(id, flag_one_pack, budget, flag_dvr, budget_type)
        puts "BUDGET TYPE IN USERS_HELPER 1"
        puts budget_type
        must_have = []
        Perference.where(user_id: id, rate: 3).find_each.each do |pf|
            must_have << pf.channel_id
        end
        would_have = []
        Perference.where(user_id: id, rate: 2).find_each.each do |pf|
            would_have << pf.channel_id
        end
        ok_have = []
        Perference.where(user_id: id, rate: 1).find_each.each do |pf|
          ok_have << pf.channel_id
        end

        must_have = Antenna.remove_channel(id, must_have)
        would_have = Antenna.remove_channel(id, would_have)
        ok_have = Antenna.remove_channel(id, ok_have)
        must_have, would_have, ok_have = Perference.remove_redudant(must_have, would_have, ok_have)
        if flag_one_pack == 'true'
          results = Perference.one_package(must_have)
        else
          results = Perference.cut_cord(must_have)
        end
        
        puts "BUDGET TYPE IN USERS_HELPER 2"
        puts budget_type
        results_overall = Perference.recommend_overall(results, id, budget, must_have, would_have, ok_have, flag_dvr, flag_one_pack, budget_type)
        return results_overall
    end
end
