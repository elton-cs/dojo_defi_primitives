use dojo::world::WorldStorage;
use dojo::model::ModelStorage;
use starknet::ContractAddress;

use dojo_defi_primitives::models::erc20::ERC20;

#[derive(Copy, Drop)]
struct Store {
    world: WorldStorage,
}

#[generate_trait]
impl StoreImpl of StoreTrait {
    #[inline]
    fn new(world: WorldStorage) -> Store {
        Store { world: world }
    }

    #[inline]
    fn read_erc20(self: @Store, token_id: felt252, owner: ContractAddress) -> ERC20 {
        self.world.read_model((token_id, owner))
    }

    #[inline]
    fn write_erc20(ref self: Store, erc20: @ERC20) {
        self.world.write_model(erc20)
    }
}
