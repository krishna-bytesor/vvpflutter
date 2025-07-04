import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:v_v_p_swami/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_animations.dart';

class PlaylistSongRow extends StatelessWidget {
  final MediaItem sObj;
  final Widget left; //  ▶️ / ⏸️ button (or any widget)
  final VoidCallback onPressed; // what happens when the row is tapped

  const PlaylistSongRow({
    super.key,
    required this.sObj,
    required this.left,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    /// A single looping "marquee" animation for long titles  ──────────────
    final marquee = AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effectsBuilder: () => [
        MoveEffect(
          curve: Curves.linear,
          delay: 500.ms,
          duration: 8000.ms,
          begin: Offset.zero,
          end: const Offset(-200, 0), // slide left 200 px
        ),
      ],
    );

    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12), // row height
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 1️⃣  Play/Pause circle
            SizedBox(
              width: 36,
              height: 36,
              child: left,
            ),

            const SizedBox(width: 12), // gap between icon & text

            /// 2️⃣  Song title (no duration)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title (marquee, clipped so it never overlaps the icon)
                  ClipRect(
                    child: SizedBox(
                      height: 27,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          sObj.title,

                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).gray,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 1.3,
                          ),
                        ).animateOnPageLoad(marquee),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
