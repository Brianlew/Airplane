import RealityKit
import SwiftUI
import RealityKitContent

class PlaneLoader {
    func loadEntity() async -> Entity? {
        guard let scene = try? await Entity(named: "toy_biplane_idle", in: realityKitContentBundle),
              let model = await scene.findEntity(named: "toy_biplane_idle"),
              let resource = await model.availableAnimations.first,
              let animation = try? await AnimationResource.generate(with: resource.repeat().definition) else {
            return nil
        }

        await model.playAnimation(animation)

        return model
    }
}

