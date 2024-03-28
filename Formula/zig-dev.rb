class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "fba45a8fd043df9076641d8cf7529d15e7ea7731ad0ece30387416d37f30de9c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b51f95473cc8cff3433b534e5a28040490a36d3fdc03c9710d8f1b6f0405b6e2" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "179c5bafa6bb59223fe2ee13da7d61b72e41e4a46c24e5cdc07de0db29f0e06d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3480+9dac8db2d.tar.xz"
  version "0.12.0-dev.3480+9dac8db2d"
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
