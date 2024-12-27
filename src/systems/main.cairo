use starknet::ContractAddress;

#[starknet::interface]
trait IMainTrait<TContractState> {}


#[dojo::contract]
mod main {
    use super::IMainTrait;
    use dojo_defi_primitives::store::{Store, StoreTrait};
    use dojo_defi_primitives::models::erc20::ERC20;
    use dojo::world::WorldStorage;
    use starknet::ContractAddress;

    #[storage]
    struct Storage {}

    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {}

    fn dojo_init(self: @ContractState) {}

    #[abi(embed_v0)]
    impl MainImpl of IMainTrait<ContractState> {}

    #[generate_trait]
    impl Private of PrivateTrait {
        #[inline]
        fn world_storage(self: @ContractState) -> WorldStorage {
            self.world(@"tenpercent")
        }
    }
}
