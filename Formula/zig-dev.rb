class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "537d64313e277fb64eebf0095f4af90775c594f03ed4d32176e353989f765d25" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "58041d000f76d957510315aad9223b1f45d292e06a91324084002b910d21e2eb" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4525f2ff8ef4d6ed27943df9db42e7524bcf8deae8da31ee7de54de35eee19f7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1245+a07f288eb.tar.xz"
  version "0.12.0-dev.1245+a07f288eb"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"
  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
